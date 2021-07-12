Public Class Panel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session("tipo"), String) = "" Or DirectCast(Session("tipo"), String) = "Inquilino" Then
            Response.Redirect("Default.aspx")
        ElseIf DirectCast(Session("tipo"), String) = "Administrador" Then
            TextBox1.Text = "Bienvenido/a, Administrador"
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button1_Click1(sender As Object, e As EventArgs)
        Response.Redirect("DetallePagos.aspx")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("DetalleIngresos.aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Response.Redirect("AltaContratos.aspx")
    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs)
        Response.Redirect("DetalleContratos.aspx")
    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs)
        Dim Numero As String = TextBox4.Text
        If TextBox4.Text = "" Then
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
                    Session("panel_admin") = "SI"
                    Response.Redirect("Landing.aspx")
                Else
                    Session("user") = "NoExiste"
                End If
            End If
        End If
    End Sub
End Class