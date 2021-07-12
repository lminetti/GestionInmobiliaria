Public Class DetalleIngresos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session("tipo"), String) = "" Or DirectCast(Session("tipo"), String) = "Inquilino" Then
            Response.Redirect("Default.aspx")
        End If
        Chart1.Series("Series1").IsValueShownAsLabel = True
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Session("tipo") = "Administrador"
        Response.Redirect("Panel.aspx")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button2_Click1(sender As Object, e As EventArgs)

        SqlDataSource2.SelectCommand = "SELECT * FROM [PAGOS] WHERE FECHA >= #" & TextBox4.Text & "# AND FECHA <= #" & TextBox5.Text & "# AND VALIDADO = 'SI' AND TIPO = 'Alquiler'"
        SqlDataSource1.SelectCommand = "SELECT PAGO, Sum(MONTO) AS MONTO FROM [PAGOS] WHERE FECHA >= #" & TextBox4.Text & "# AND FECHA <= #" & TextBox5.Text & "# AND VALIDADO = 'SI' AND TIPO = 'Alquiler' GROUP BY PAGO"

        GridView1.DataBind()
        Chart1.DataBind()

    End Sub
End Class