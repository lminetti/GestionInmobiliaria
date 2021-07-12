Public Class DetallePagosInq
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If DirectCast(Session("numero"), String) = "" Then
            Response.Redirect("Default.aspx")
        Else
            TextBox1.Text = "Cuenta de inquilino nro.: " & DirectCast(Session("numero"), String)
            SqlDataSource1.SelectCommand = "SELECT * FROM [AGUA] WHERE [NUMERO] = '" & DirectCast(Session("numero"), String) & "'"
            SqlDataSource2.SelectCommand = "SELECT * FROM [ALQUILER] WHERE [NUMERO] = '" & DirectCast(Session("numero"), String) & "'"
            SqlDataSource3.SelectCommand = "SELECT * FROM [ELECTRICIDAD] WHERE [NUMERO] = '" & DirectCast(Session("numero"), String) & "'"
            SqlDataSource4.SelectCommand = "SELECT * FROM [EXPENSAS] WHERE [NUMERO] = '" & DirectCast(Session("numero"), String) & "'"
            SqlDataSource5.SelectCommand = "SELECT * FROM [GAS] WHERE [NUMERO] = '" & DirectCast(Session("numero"), String) & "'"
            SqlDataSource6.SelectCommand = "SELECT * FROM [IMPUESTOS] WHERE [NUMERO] = '" & DirectCast(Session("numero"), String) & "'"
            GridView1.DataBind()
            GridView2.DataBind()
            GridView3.DataBind()
            GridView4.DataBind()
            GridView5.DataBind()
            GridView6.DataBind()
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Session("numero") = DirectCast(Session("numero"), String)
        Session("tipo") = DirectCast(Session("tipo"), String)
        Response.Redirect("Landing.aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Session("numero") = DirectCast(Session("numero"), String)
        Session("tipo") = DirectCast(Session("tipo"), String)
        Response.Redirect("EstadoCuenta.aspx")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub
End Class