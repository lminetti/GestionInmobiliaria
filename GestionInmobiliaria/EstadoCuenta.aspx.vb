Public Class EstadoCuenta
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session("numero"), String) = "" Then
            Response.Redirect("Default.aspx")
        Else
            TextBox1.Text = "Cuenta de inquilino nro.: " & DirectCast(Session("numero"), String)
            SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS] WHERE NUMERO = '" & DirectCast(Session("numero"), String) & "' ORDER BY FECHA DESC"
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Session("numero") = DirectCast(Session("numero"), String)
        Session("tipo") = DirectCast(Session("tipo"), String)
        Response.Redirect("Landing.aspx")
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
            SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS] WHERE FECHA >= #" & TextBox4.Text & "# AND FECHA <= #" & TextBox5.Text & "# AND NUMERO = '" & DirectCast(Session("numero"), String) & "'"
        Else
            SqlDataSource1.SelectCommand = "SELECT * FROM [PAGOS] WHERE FECHA >= #" & TextBox4.Text & "# AND FECHA <= #" & TextBox5.Text & "# AND TIPO = '" & Tipo & "' AND NUMERO = '" & DirectCast(Session("numero"), String) & "'"
        End If

        GridView1.DataBind()

    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Session("numero") = DirectCast(Session("numero"), String)
        Session("tipo") = DirectCast(Session("tipo"), String)
        Response.Redirect("DetallePagosInq.aspx")
    End Sub
End Class