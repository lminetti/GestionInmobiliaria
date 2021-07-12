Public Class AltaContratos
    Inherits System.Web.UI.Page

    Dim MES_CORRIENTE As Integer
    Dim AÑO_CORRIENTE As Integer
    Dim VALOR As String = "0"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session("tipo"), String) = "" Or DirectCast(Session("tipo"), String) = "Inquilino" Then
            Response.Redirect("Default.aspx")
        ElseIf DirectCast(Session("tipo"), String) = "Administrador" Then
            TextBox1.Text = "Bienvenido/a, Administrador"
        End If
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Session("tipo") = "Administrador"
        Response.Redirect("Panel.aspx")
    End Sub

    Protected Sub TextBox4_TextChanged(sender As Object, e As EventArgs)
        If TextBox4.Text.Length > 0 Then
            SqlDataSource1.SelectCommand = "SELECT * FROM [Hoja1$] WHERE NUMERO = '" & TextBox4.Text & "' OR PROPIEDAD LIKE '%" & TextBox4.Text & "%' OR LOCATARIO LIKE '%" & TextBox4.Text & "%' OR LOCADOR LIKE '%" & TextBox4.Text & "%' OR CONTRATO LIKE '%" & TextBox4.Text & "%'"
            GridView1.DataBind()
        Else
            SqlDataSource1.SelectCommand = "SELECT * FROM [Hoja1$]"
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)

        If TextBox5.Text.Length = 0 Then
            TextBox5.Text = "Ingrese un número de contrato."
            TextBox5.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If
        If TextBox6.Text.Length = 0 Then
            TextBox6.Text = "Ingrese fecha de inicio del contrato (Formato: dd/MM/yyyy)."
            TextBox6.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If
        If TextBox7.Text.Length = 0 Then
            TextBox7.Text = "Ingrese fecha de finalización del contrato (Formato: dd/MM/yyyy)."
            TextBox7.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If
        If TextBox8.Text.Length = 0 Then
            TextBox8.Text = "Ingrese domicilio de la propiedad."
            TextBox8.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If
        If TextBox9.Text.Length = 0 Then
            TextBox9.Text = "Ingrese el nombre del locatario."
            TextBox9.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If
        If TextBox10.Text.Length = 0 Then
            TextBox10.Text = "Ingrese el nombre del locador."
            TextBox10.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If
        If TextBox11.Text.Length = 0 Then
            TextBox10.Text = "Ingrese el valor del alquiler."
            TextBox10.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If
        If TextBox12.Text.Length = 0 Then
            TextBox10.Text = "Ingrese el % de actualización."
            TextBox10.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If

        'Checkear si existe el número de cuenta
        SqlDataSource1.SelectCommand = "SELECT * FROM [Hoja1$] WHERE NUMERO = '" & TextBox5.Text & "'"
        GridView1.DataBind()

        If GridView1.Rows.Count > 0 Then
            TextBox5.Text = "Ya existe número de contrato."
            TextBox5.ForeColor = System.Drawing.Color.Red
            cuadro_grid.Style.Add("display", "none")
            cuadro_altas.Style.Add("display", "block")
            Exit Sub
        End If

        Dim NUMERO As String = TextBox5.Text
        Dim PROPIEDAD As String = TextBox8.Text
        Dim LOCATARIO As String = TextBox9.Text
        Dim LOCADOR As String = TextBox10.Text
        Dim TIPO As String = "Inquilino"

        Dim FECHA_DESDE As String = TextBox6.Text
        Dim FECHA_HASTA As String = TextBox7.Text
        Dim CONTRATO As String

        Dim AÑO_DESDE As Integer = CDate(FECHA_DESDE).Year
        Dim AÑO_HASTA As Integer = CDate(FECHA_HASTA).Year

        CONTRATO = AÑO_DESDE & "/" & AÑO_HASTA

        Dim MES_HASTA As Integer = CDate(FECHA_HASTA).Month

        Dim NUMERO_ACT As Integer

        If DropDownList1.SelectedValue = 1 Then
            NUMERO_ACT = 6
        ElseIf DropDownList1.SelectedValue = 2 Then
            NUMERO_ACT = 12
        ElseIf DropDownList1.SelectedValue = 999 Then
            NUMERO_ACT = 0
        End If

        SqlDataSource1.InsertCommand = "INSERT INTO [Hoja1$] ([NUMERO], [PROPIEDAD], [LOCATARIO], [LOCADOR], [TIPO], [CONTRATO]) VALUES (@NUMERO, @PROPIEDAD, @LOCATARIO, @LOCADOR, @TIPO, @CONTRATO)"
        SqlDataSource1.InsertParameters.Add("NUMERO", NUMERO)
        SqlDataSource1.InsertParameters.Add("PROPIEDAD", PROPIEDAD)
        SqlDataSource1.InsertParameters.Add("LOCATARIO", LOCATARIO)
        SqlDataSource1.InsertParameters.Add("LOCADOR", LOCADOR)
        SqlDataSource1.InsertParameters.Add("TIPO", TIPO)
        SqlDataSource1.InsertParameters.Add("CONTRATO", CONTRATO)
        SqlDataSource1.Insert()

        GridView1.DataBind()

        Dim SUMA_ACT As Integer = 0

        SqlDataSource8.InsertCommand = "INSERT INTO [ALQUILER] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PAGADO], [SALDO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PAGADO, @SALDO, @PROPIEDAD)"

        Do

            If VALOR = "0" Then
                MES_CORRIENTE = CDate(FECHA_DESDE).Month
                AÑO_CORRIENTE = CDate(FECHA_DESDE).Year
                VALOR = CDbl(TextBox11.Text).ToString("F2")
            End If

            If MES_HASTA = MES_CORRIENTE And AÑO_HASTA = AÑO_CORRIENTE Then
                Exit Do
            End If

            If NUMERO_ACT = 0 Then
                VALOR = CDbl(TextBox11.Text).ToString("F2")
            Else
                SUMA_ACT = SUMA_ACT + 1
                If SUMA_ACT > NUMERO_ACT Then
                    SUMA_ACT = 1
                    'Actualiza valor
                    VALOR = CDbl(CDbl(VALOR) + ((CDbl(TextBox12.Text) * CDbl(VALOR)) / 100)).ToString("F2")
                Else
                    'No actualiza valor
                End If
            End If

            SqlDataSource8.InsertParameters.Add("NUMERO", NUMERO)
            SqlDataSource8.InsertParameters.Add("CONTRATO", CONTRATO)
            SqlDataSource8.InsertParameters.Add("MES", MES_CORRIENTE)
            SqlDataSource8.InsertParameters.Add("AÑO", AÑO_CORRIENTE)
            SqlDataSource8.InsertParameters.Add("MONTO", VALOR)
            SqlDataSource8.InsertParameters.Add("PAGADO", "0,00")
            SqlDataSource8.InsertParameters.Add("SALDO", VALOR)
            SqlDataSource8.InsertParameters.Add("PROPIEDAD", PROPIEDAD)
            SqlDataSource8.Insert()

            If MES_CORRIENTE = 12 Then
                MES_CORRIENTE = 1
                AÑO_CORRIENTE = AÑO_CORRIENTE + 1
            Else
                MES_CORRIENTE = MES_CORRIENTE + 1
            End If

            SqlDataSource8.InsertParameters.Clear()

        Loop

        SqlDataSource1.SelectCommand = "SELECT * FROM [Hoja1$] WHERE NUMERO = '" & TextBox5.Text & "'"
        GridView1.DataBind()
        cuadro_grid.Style.Add("display", "block")
        cuadro_altas.Style.Add("display", "none")

        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBox7.Text = ""
        TextBox8.Text = ""
        TextBox9.Text = ""
        TextBox10.Text = ""
        TextBox11.Text = ""
        TextBox12.Text = ""

    End Sub
End Class