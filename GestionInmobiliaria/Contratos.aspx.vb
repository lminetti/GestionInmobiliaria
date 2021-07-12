Public Class Contratos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session("tipo"), String) = "" Or DirectCast(Session("tipo"), String) = "Inquilino" Then
            Response.Redirect("Default.aspx")
        ElseIf DirectCast(Session("tipo"), String) = "Administrador" Then
            TextBox1.Text = "Bienvenido/a, Administrador"
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Session("tipo") = "Administrador"
        Response.Redirect("Panel.aspx")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)
        Dim rowId As String = row.Cells(0).Text
        SqlDataSource1.DeleteCommand = "DELETE FROM [Hoja1$] WHERE NUMERO = '" & rowId & "'"
    End Sub

    Protected Sub GridView1_RowDeleted(sender As Object, e As GridViewDeletedEventArgs)
        GridView1.DataBind()
    End Sub
End Class