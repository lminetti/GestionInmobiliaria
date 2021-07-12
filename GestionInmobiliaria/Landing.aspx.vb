Public Class Landing
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session("tipo"), String) = "" Then
            Response.Redirect("Default.aspx")
        ElseIf DirectCast(Session("tipo"), String) = "Administrador" Then
            Response.Redirect("Panel.aspx")
        ElseIf DirectCast(Session("tipo"), String) = "Inquilino" Then
            TextBox1.Text = "Bienvenido/a, " & DirectCast(Session("locatario"), String) & "."
        End If

        If DirectCast(Session("panel_admin"), String) = "SI" Then
            Button3.Visible = True
        Else
            Button3.Visible = False
        End If

        SqlDataSource3.SelectCommand = "SELECT * FROM [ALQUILER] WHERE NUMERO = '" & DirectCast(Session("numero"), String) & "'"
        GridView3.DataBind()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        IngresoPago()
    End Sub

    Protected Sub IngresoPago()

        If String.Format("{0}", Request.Form("Text1")) = "" Then
            TextBox6.Visible = True
            TextBox6.Text = "Completar fecha de pago."
            TextBox6.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If
        If String.Format("{0}", Request.Form("Text2")) = "" Then
            TextBox6.Visible = True
            TextBox6.Text = "Elegir tipo de pago."
            TextBox6.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If
        If String.Format("{0}", Request.Form("Text3")) = "" Then
            TextBox6.Visible = True
            TextBox6.Text = "Marcar forma de pago."
            TextBox6.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If
        If String.Format("{0}", Request.Form("Text4")) = "" Then
            TextBox6.Visible = True
            TextBox6.Text = "Completar monto."
            TextBox6.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(String.Format("{0}", Request.Form("Text4"))) Then
            TextBox6.Visible = True
            TextBox6.Text = "El monto tiene que ser numérico."
            TextBox6.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If

        Dim Fecha As String = CDate(String.Format("{0}", Request.Form("Text1"))).ToString("dd/MM/yyyy")
        Dim Tipo As String = String.Format("{0}", Request.Form("Text2"))
        If Tipo = "0" Then

            If String.Format("{0}", Request.Form("Text6")) = "" Then
                TextBox7.Visible = True
                TextBox7.Text = "Completar año."
                TextBox7.ForeColor = System.Drawing.Color.Red
            End If

            Tipo = "Alquiler"
            Dim MesAlquiler As String = String.Format("{0}", Request.Form("Text5"))
            If MesAlquiler = "1" Then
                Fecha = "01/01/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "2" Then
                Fecha = "01/02/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "3" Then
                Fecha = "01/03/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "4" Then
                Fecha = "01/04/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "5" Then
                Fecha = "01/05/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "6" Then
                Fecha = "01/06/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "7" Then
                Fecha = "01/07/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "8" Then
                Fecha = "01/08/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "9" Then
                Fecha = "01/09/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "10" Then
                Fecha = "01/10/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "11" Then
                Fecha = "01/11/" & String.Format("{0}", Request.Form("Text6"))
            ElseIf MesAlquiler = "12" Then
                Fecha = "01/12/" & String.Format("{0}", Request.Form("Text6"))
            End If
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
        Dim Monto As String = String.Format("{0}", Request.Form("Text4"))
        Monto = Monto.Replace(".", ",")
        Monto = CDbl(Monto).ToString("F2")
        Dim Pago As String = String.Format("{0}", Request.Form("Text3"))
        Dim Locatario As String = DirectCast(Session("locatario"), String)
        Dim Numero As String = DirectCast(Session("numero"), String)
        Dim Propiedad As String = DirectCast(Session("propiedad"), String)
        Dim Locador As String = DirectCast(Session("locador"), String)
        Dim Contrato As String = DirectCast(Session("contrato"), String)
        Dim NroMes As Integer
        Dim NroAño As Integer
        Dim MontoOriginal As String = ""
        Dim Pagado As String = ""
        Dim Saldo As String = ""

        Monto = Monto.Replace(".", ",")

        NroMes = Month(CDate(Fecha))
        NroAño = Year(CDate(Fecha))

        'Si es ALQUILER va a calcular el saldo según valor de la cuota filtrando mes y año del contrato
        'If Tipo = "Alquiler" Then
        '    SqlDataSource3.SelectCommand = "SELECT * FROM [ALQUILER] WHERE NUMERO = '" & DirectCast(Session("numero"), String) & "' AND MES = " & NroMes & " AND AÑO = " & NroAño & ""
        '    GridView3.DataBind()

        '    If GridView3.Rows(0).Cells(6).Text = "0,00" Then
        '        MontoOriginal = GridView3.Rows(0).Cells(5).Text
        '        Pagado = CDbl(Monto).ToString("F2")
        '        Saldo = CDbl(CDbl(MontoOriginal) - CDbl(Pagado)).ToString("F2")
        '    Else
        '        MontoOriginal = GridView3.Rows(0).Cells(5).Text
        '        Pagado = CDbl(CDbl(GridView3.Rows(0).Cells(6).Text) + CDbl(Monto)).ToString("F2")
        '        Saldo = CDbl(CDbl(MontoOriginal) - CDbl(Pagado)).ToString("F2")
        '    End If

        'End If

        'Ingresar comprobante
        Dim DateNow As Date = Date.Now
        DateNow = DateNow.AddHours(5)
        Dim Ahora As String = DateNow.ToString("ddMMyyyy HHmmss")
        If FileUpload1.HasFile Then
            Dim NombreCarpeta As String = DirectCast(Session("propiedad"), String) & " - " & DirectCast(Session("numero"), String)
            System.IO.Directory.CreateDirectory("C:\Users\Public\Public Dropbox\Dropbox\Virmach\mills.com.ar\GestionInmobiliaria\Convivencia\Comprobantes\" & NombreCarpeta)
            Dim archivo As String = ""
            archivo = FileUpload1.FileName
            FileUpload1.SaveAs("C:\Users\Public\Public Dropbox\Dropbox\Virmach\mills.com.ar\GestionInmobiliaria\Convivencia\Comprobantes\" & NombreCarpeta & "\" & Propiedad & " - " & NroAño & " - " & Tipo & " - " & NroMes & " - " & Ahora & " - " & Numero & " - (1) " & archivo)
        Else
            TextBox6.Visible = True
            TextBox6.Text = "Adjuntar comprobante."
            TextBox6.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If

        If FileUpload2.HasFile Then
            Dim NombreCarpeta As String = DirectCast(Session("propiedad"), String) & " - " & DirectCast(Session("numero"), String)
            System.IO.Directory.CreateDirectory("C:\Users\Public\Public Dropbox\Dropbox\Virmach\mills.com.ar\GestionInmobiliaria\Convivencia\Comprobantes\" & NombreCarpeta)
            Dim archivo As String = ""
            archivo = FileUpload2.FileName
            FileUpload2.SaveAs("C:\Users\Public\Public Dropbox\Dropbox\Virmach\mills.com.ar\GestionInmobiliaria\Convivencia\Comprobantes\" & NombreCarpeta & "\" & Propiedad & " - " & NroAño & " - " & Tipo & " - " & NroMes & " - " & Ahora & " - " & Numero & " - (2) " & archivo)
        End If

        'Insertar datos
        SqlDataSource1.InsertCommand = "INSERT INTO [PAGOS] ([FECHA], [TIPO], [MONTO], [PAGO], [LOCATARIO], [NUMERO], [PROPIEDAD], [LOCADOR], [VALIDADO], [CONTRATO]) VALUES (@FECHA, @TIPO, @MONTO, @PAGO, @LOCATARIO, @NUMERO, @PROPIEDAD, @LOCADOR, @VALIDADO, @CONTRATO)"
        SqlDataSource1.InsertParameters.Add("FECHA", Fecha)
        SqlDataSource1.InsertParameters.Add("TIPO", Tipo)
        SqlDataSource1.InsertParameters.Add("MONTO", Monto)
        SqlDataSource1.InsertParameters.Add("PAGO", Pago)
        SqlDataSource1.InsertParameters.Add("LOCATARIO", Locatario)
        SqlDataSource1.InsertParameters.Add("NUMERO", Numero)
        SqlDataSource1.InsertParameters.Add("PROPIEDAD", Propiedad)
        SqlDataSource1.InsertParameters.Add("LOCADOR", Locador)
        SqlDataSource1.InsertParameters.Add("VALIDADO", "NO")
        SqlDataSource1.InsertParameters.Add("CONTRATO", Contrato)

        SqlDataSource1.Insert()

        'Según tipo de pago ingresa registro en la base de datos correspondiente
        'If Tipo = "Servicio de agua" Then
        '    SqlDataSource2.InsertCommand = "INSERT INTO [AGUA] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
        '    SqlDataSource2.InsertParameters.Add("NUMERO", Numero)
        '    SqlDataSource2.InsertParameters.Add("CONTRATO", Contrato)
        '    SqlDataSource2.InsertParameters.Add("MES", NroMes)
        '    SqlDataSource2.InsertParameters.Add("AÑO", NroAño)
        '    SqlDataSource2.InsertParameters.Add("MONTO", Monto)
        '    SqlDataSource2.InsertParameters.Add("PROPIEDAD", Propiedad)
        '    SqlDataSource2.Insert()
        'ElseIf Tipo = "Alquiler" Then
        '    SqlDataSource3.UpdateCommand = "UPDATE [ALQUILER] SET [PAGADO] = '" & Pagado & "', [SALDO] = '" & Saldo & "' WHERE NUMERO = '" & DirectCast(Session("numero"), String) & "' AND MES = " & NroMes & " AND AÑO = " & NroAño & ""
        '    SqlDataSource3.UpdateParameters.Add("PAGADO", Pagado)
        '    SqlDataSource3.UpdateParameters.Add("SALDO", Saldo)
        '    SqlDataSource3.UpdateParameters.Add("NUMERO", Numero)
        '    SqlDataSource3.UpdateParameters.Add("MES", NroMes)
        '    SqlDataSource2.UpdateParameters.Add("AÑO", NroAño)
        '    SqlDataSource3.Update()
        'ElseIf Tipo = "Servicio de electricidad" Then
        '    SqlDataSource4.InsertCommand = "INSERT INTO [ELECTRICIDAD] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
        '    SqlDataSource4.InsertParameters.Add("NUMERO", Numero)
        '    SqlDataSource4.InsertParameters.Add("CONTRATO", Contrato)
        '    SqlDataSource4.InsertParameters.Add("MES", NroMes)
        '    SqlDataSource2.InsertParameters.Add("AÑO", NroAño)
        '    SqlDataSource4.InsertParameters.Add("MONTO", Monto)
        '    SqlDataSource2.InsertParameters.Add("PROPIEDAD", Propiedad)
        '    SqlDataSource4.Insert()
        'ElseIf Tipo = "Expensas" Then
        '    SqlDataSource5.InsertCommand = "INSERT INTO [EXPENSAS] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
        '    SqlDataSource5.InsertParameters.Add("NUMERO", Numero)
        '    SqlDataSource5.InsertParameters.Add("CONTRATO", Contrato)
        '    SqlDataSource5.InsertParameters.Add("MES", NroMes)
        '    SqlDataSource2.InsertParameters.Add("AÑO", NroAño)
        '    SqlDataSource5.InsertParameters.Add("MONTO", Monto)
        '    SqlDataSource2.InsertParameters.Add("PROPIEDAD", Propiedad)
        '    SqlDataSource5.Insert()
        'ElseIf Tipo = "Servicio de gas" Then
        '    SqlDataSource6.InsertCommand = "INSERT INTO [AGUA] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
        '    SqlDataSource6.InsertParameters.Add("NUMERO", Numero)
        '    SqlDataSource6.InsertParameters.Add("CONTRATO", Contrato)
        '    SqlDataSource6.InsertParameters.Add("MES", NroMes)
        '    SqlDataSource2.InsertParameters.Add("AÑO", NroAño)
        '    SqlDataSource6.InsertParameters.Add("MONTO", Monto)
        '    SqlDataSource2.InsertParameters.Add("PROPIEDAD", Propiedad)
        '    SqlDataSource6.Insert()
        'ElseIf Tipo = "Impuestos" Then
        '    SqlDataSource7.InsertCommand = "INSERT INTO [AGUA] ([NUMERO], [CONTRATO], [MES], [AÑO], [MONTO], [PROPIEDAD]) VALUES (@NUMERO, @CONTRATO, @MES, @AÑO, @MONTO, @PROPIEDAD)"
        '    SqlDataSource7.InsertParameters.Add("NUMERO", Numero)
        '    SqlDataSource7.InsertParameters.Add("CONTRATO", Contrato)
        '    SqlDataSource7.InsertParameters.Add("MES", NroMes)
        '    SqlDataSource2.InsertParameters.Add("AÑO", NroAño)
        '    SqlDataSource7.InsertParameters.Add("MONTO", Monto)
        '    SqlDataSource2.InsertParameters.Add("PROPIEDAD", Propiedad)
        '    SqlDataSource7.Insert()
        'End If

        SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS]"
        GridView1.DataBind()

        TextBox6.Visible = True
        TextBox6.Text = "¡Pago ingresado correctamente!"
        TextBox6.ForeColor = System.Drawing.Color.DarkGreen

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Session("numero") = DirectCast(Session("numero"), String)
        Response.Redirect("EstadoCuenta.aspx")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Session("tipo") = "Administrador"
        Response.Redirect("Panel.aspx")
    End Sub
End Class