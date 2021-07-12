Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Page.IsPostBack Then
            If DirectCast(Session("user"), String) = "NoExiste" Then
                TextBox1.Text = ""
                TextBox1.Attributes.Add("placeholder", "Número inexistente.")
            End If
        End If

    End Sub

    Private Sub Login()
        Dim Numero As String = String.Format("{0}", Request.Form("Text1"))
        If TextBox1.Text = "" Then
            Exit Sub
        Else
            Session("numero") = Numero
            SqlDataSource1.SelectCommand = "SELECT * FROM [Hoja1$] WHERE NUMERO = '" & Numero & "'"
            GridView1.DataBind()
            If GridView1.Rows.Count = 0 Then
                Session.Clear()
            Else
                If GridView1.Rows(0).Cells(0).Text = Numero Then
                    If GridView1.Rows(0).Cells(4).Text = "Inquilino" Then
                        Session("tipo") = "Inquilino"
                    ElseIf GridView1.Rows(0).Cells(4).Text = "Administrador" Then
                        Session("tipo") = "Administrador"
                    End If
                    Session("propiedad") = HttpUtility.HtmlDecode(GridView1.Rows(0).Cells(1).Text)
                    Session("locatario") = HttpUtility.HtmlDecode(GridView1.Rows(0).Cells(2).Text)
                    Session("locador") = HttpUtility.HtmlDecode(GridView1.Rows(0).Cells(3).Text)
                    Session("contrato") = HttpUtility.HtmlDecode(GridView1.Rows(0).Cells(5).Text)
                    Response.Redirect("Landing.aspx")
                Else
                    Session("user") = "NoExiste"
                End If
            End If
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)

        Login()

    End Sub

End Class