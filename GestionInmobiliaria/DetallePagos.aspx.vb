Public Class DetallePagos
    Inherits System.Web.UI.Page

    Dim Fecha As String = ""
    Dim Tipo As String = ""
    Dim Monto As String = ""
    Dim Pago As String = ""
    Dim Locatario As String = ""
    Dim Numero As String = ""
    Dim Propiedad As String = ""
    Dim Locador As String = ""
    Dim Contrato As String = ""
    Dim NroMes As Integer
    Dim NroAño As Integer
    Dim MontoOriginal As String = ""
    Dim Pagado As String = ""
    Dim Saldo As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session("tipo"), String) = "" Or DirectCast(Session("tipo"), String) = "Inquilino" Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Session("tipo") = "Administrador"
        Response.Redirect("Panel.aspx")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim Tipo As String = String.Format("{0}", Request.Form("Text1"))
        If Tipo = "ALL" Then
            Tipo = "Todos"
        ElseIf Tipo = "0" Then
            Tipo = "Alquiler"
        ElseIf Tipo = "1" Then
            Tipo = "Expensas"
        ElseIf Tipo = "2" Then
            Tipo = "Servicio de agua"
        ElseIf Tipo = "3" Then
            Tipo = "Servicio de gas"
        ElseIf Tipo = "4" Then
            Tipo = "Servicio de electricidad"
        ElseIf Tipo = "5" Then
            Tipo = "Impuestos"
        End If

        If Tipo = "Todos" Then
            SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS] WHERE FECHA >= #" & TextBox4.Text & "# AND FECHA <= #" & TextBox5.Text & "# ORDER BY VALIDADO ASC"
        Else
            SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS] WHERE FECHA >= #" & TextBox4.Text & "# AND FECHA <= #" & TextBox5.Text & "# AND TIPO = '" & Tipo & "' ORDER BY VALIDADO ASC"
        End If

        GridView1.DataBind()
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs)

        For Each gvrow As GridViewRow In GridView1.Rows
            Dim chk As CheckBox = CType(gvrow.FindControl("SelectRow"), CheckBox)

            If chk IsNot Nothing And chk.Checked Then

                Dim ID As String = gvrow.Cells(11).Text

                'Validar pago
                SqlDataSource1.UpdateCommand = "UPDATE [PAGOS] SET VALIDADO = 'SI' WHERE ID = " & ID & ""
                SqlDataSource1.UpdateParameters.Add("ID", ID)
                SqlDataSource1.Update()
                GridView1.DataBind()

                Fecha = gvrow.Cells(1).Text
                Tipo = gvrow.Cells(2).Text
                Monto = gvrow.Cells(3).Text
                Pago = gvrow.Cells(4).Text
                Locatario = gvrow.Cells(8).Text
                Numero = gvrow.Cells(7).Text
                Propiedad = gvrow.Cells(5).Text
                Locador = gvrow.Cells(9).Text
                Contrato = gvrow.Cells(10).Text

                NroMes = Month(CDate(Fecha))
                NroAño = Year(CDate(Fecha))

                IngresoPago()

            End If
        Next

        SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS] ORDER BY VALIDADO ASC, FECHA"
        GridView1.DataBind()

    End Sub

    Protected Sub IngresoPago()

        'Si es ALQUILER va a calcular el saldo según valor de la cuota filtrando mes y año del contrato
        If Tipo = "Alquiler" Then
            SqlDataSource3.SelectCommand = "SELECT * FROM [ALQUILER] WHERE NUMERO = '" & Numero & "' AND MES = " & NroMes & " AND AÑO = " & NroAño & ""
            GridView3.DataBind()

            If GridView3.Rows(0).Cells(6).Text = "0,00" Then
                MontoOriginal = GridView3.Rows(0).Cells(5).Text
                Pagado = CDbl(Monto).ToString("F2")
                Saldo = CDbl(CDbl(MontoOriginal) - CDbl(Pagado)).ToString("F2")
            Else
                MontoOriginal = GridView3.Rows(0).Cells(5).Text
                Pagado = CDbl(CDbl(GridView3.Rows(0).Cells(6).Text) + CDbl(Monto)).ToString("F2")
                Saldo = CDbl(CDbl(MontoOriginal) - CDbl(Pagado)).ToString("F2")
            End If

        End If

        'Según tipo de pago ingresa registro en la base de datos correspondiente
        If Tipo = "Servicio de agua" Then
            SqlDataSource2.InsertCommand = "INSERT INTO [AGUA] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
            SqlDataSource2.InsertParameters.Add("NUMERO", Numero)
            SqlDataSource2.InsertParameters.Add("CONTRATO", Contrato)
            SqlDataSource2.InsertParameters.Add("MES", NroMes)
            SqlDataSource2.InsertParameters.Add("AÑO", NroAño)
            SqlDataSource2.InsertParameters.Add("MONTO", Monto)
            SqlDataSource2.InsertParameters.Add("PROPIEDAD", Propiedad)
            SqlDataSource2.Insert()
        ElseIf Tipo = "Alquiler" Then
            SqlDataSource3.UpdateCommand = "UPDATE [ALQUILER] SET [PAGADO] = '" & Pagado & "', [SALDO] = '" & Saldo & "' WHERE NUMERO = '" & Numero & "' AND MES = " & NroMes & " AND AÑO = " & NroAño & ""
            SqlDataSource3.UpdateParameters.Add("PAGADO", Pagado)
            SqlDataSource3.UpdateParameters.Add("SALDO", Saldo)
            SqlDataSource3.UpdateParameters.Add("NUMERO", Numero)
            SqlDataSource3.UpdateParameters.Add("MES", NroMes)
            SqlDataSource3.UpdateParameters.Add("AÑO", NroAño)
            SqlDataSource3.Update()
        ElseIf Tipo = "Servicio de electricidad" Then
            SqlDataSource4.InsertCommand = "INSERT INTO [ELECTRICIDAD] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
            SqlDataSource4.InsertParameters.Add("NUMERO", Numero)
            SqlDataSource4.InsertParameters.Add("CONTRATO", Contrato)
            SqlDataSource4.InsertParameters.Add("MES", NroMes)
            SqlDataSource4.InsertParameters.Add("AÑO", NroAño)
            SqlDataSource4.InsertParameters.Add("MONTO", Monto)
            SqlDataSource4.InsertParameters.Add("PROPIEDAD", Propiedad)
            SqlDataSource4.Insert()
        ElseIf Tipo = "Expensas" Then
            SqlDataSource5.InsertCommand = "INSERT INTO [EXPENSAS] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
            SqlDataSource5.InsertParameters.Add("NUMERO", Numero)
            SqlDataSource5.InsertParameters.Add("CONTRATO", Contrato)
            SqlDataSource5.InsertParameters.Add("MES", NroMes)
            SqlDataSource5.InsertParameters.Add("AÑO", NroAño)
            SqlDataSource5.InsertParameters.Add("MONTO", Monto)
            SqlDataSource5.InsertParameters.Add("PROPIEDAD", Propiedad)
            SqlDataSource5.Insert()
        ElseIf Tipo = "Servicio de gas" Then
            SqlDataSource6.InsertCommand = "INSERT INTO [GAS] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
            SqlDataSource6.InsertParameters.Add("NUMERO", Numero)
            SqlDataSource6.InsertParameters.Add("CONTRATO", Contrato)
            SqlDataSource6.InsertParameters.Add("MES", NroMes)
            SqlDataSource6.InsertParameters.Add("AÑO", NroAño)
            SqlDataSource6.InsertParameters.Add("MONTO", Monto)
            SqlDataSource6.InsertParameters.Add("PROPIEDAD", Propiedad)
            SqlDataSource6.Insert()
        ElseIf Tipo = "Impuestos" Then
            SqlDataSource7.InsertCommand = "INSERT INTO [IMPUESTOS] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
            SqlDataSource7.InsertParameters.Add("NUMERO", Numero)
            SqlDataSource7.InsertParameters.Add("CONTRATO", Contrato)
            SqlDataSource7.InsertParameters.Add("MES", NroMes)
            SqlDataSource7.InsertParameters.Add("AÑO", NroAño)
            SqlDataSource7.InsertParameters.Add("MONTO", Monto)
            SqlDataSource7.InsertParameters.Add("PROPIEDAD", Propiedad)
            SqlDataSource7.Insert()
        End If

    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs)
        For Each gvrow As GridViewRow In GridView1.Rows
            Dim chk As CheckBox = CType(gvrow.FindControl("SelectRow"), CheckBox)

            If chk IsNot Nothing And chk.Checked Then

                Dim ID As String = gvrow.Cells(11).Text

                'Borrar registro
                SqlDataSource1.DeleteCommand = "DELETE FROM [PAGOS] WHERE ID = " & ID & ""
                SqlDataSource1.DeleteParameters.Add("ID", ID)
                SqlDataSource1.Delete()
                GridView1.DataBind()

            End If
        Next

        SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS] ORDER BY VALIDADO ASC, FECHA"
        GridView1.DataBind()
    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs)
        If TextBox6.Text = "" Or Not IsNumeric(TextBox6.Text) Then
            TextBox6.Text = "Ingresá un importe"
            Exit Sub
        End If

        TextBox6.Text = TextBox6.Text.Replace(".", ",")

        For Each gvrow As GridViewRow In GridView1.Rows
            Dim chk As CheckBox = CType(gvrow.FindControl("SelectRow"), CheckBox)

            If chk IsNot Nothing And chk.Checked Then

                Dim ID As String = gvrow.Cells(11).Text

                If gvrow.Cells(6).Text = "NO" Then
                    'Validar pago
                    SqlDataSource1.UpdateCommand = "UPDATE [PAGOS] SET MONTO = '" & TextBox6.Text & "' WHERE ID = " & ID & ""
                    SqlDataSource1.UpdateParameters.Add("ID", ID)
                    SqlDataSource1.Update()
                    GridView1.DataBind()
                End If

            End If
        Next

        SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS] ORDER BY VALIDADO ASC, FECHA"
        GridView1.DataBind()

    End Sub
End Class