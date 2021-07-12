Public Class DetalleContratos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If DirectCast(Session("tipo"), String) = "" Or DirectCast(Session("tipo"), String) = "Inquilino" Then
            Response.Redirect("Default.aspx")
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

    Protected Sub TextBox4_TextChanged(sender As Object, e As EventArgs)
        Buscar()
    End Sub

    Protected Sub TextBox5_TextChanged(sender As Object, e As EventArgs)
        Buscar()
    End Sub

    Protected Sub Buscar()

        If Text1.Value = "agua" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "CallMyFunction", "MostrarAgua()", True)
        ElseIf Text1.Value = "alquiler" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "CallMyFunction", "MostrarAlquiler()", True)
        ElseIf Text1.Value = "electricidad" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "CallMyFunction", "MostrarElectricidad()", True)
        ElseIf Text1.Value = "expensas" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "CallMyFunction", "MostrarExpensas()", True)
        ElseIf Text1.Value = "gas" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "CallMyFunction", "MostrarGas()", True)
        ElseIf Text1.Value = "impuestos" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "CallMyFunction", "MostrarImpuestos()", True)
        End If

        If TextBox4.Text.Length = 0 Then
            If TextBox5.Text.Length = 0 Then
                SqlDataSource1.SelectCommand = "SELECT * FROM [AGUA]"
                SqlDataSource2.SelectCommand = "SELECT * FROM [ALQUILER]"
                SqlDataSource3.SelectCommand = "SELECT * FROM [ELECTRICIDAD]"
                SqlDataSource4.SelectCommand = "SELECT * FROM [EXPENSAS]"
                SqlDataSource5.SelectCommand = "SELECT * FROM [GAS]"
                SqlDataSource6.SelectCommand = "SELECT * FROM [IMPUESTOS]"
            Else
                SqlDataSource1.SelectCommand = "SELECT * FROM [AGUA] WHERE AÑO = " & TextBox5.Text & ""
                SqlDataSource2.SelectCommand = "SELECT * FROM [ALQUILER] WHERE AÑO = " & TextBox5.Text & ""
                SqlDataSource3.SelectCommand = "SELECT * FROM [ELECTRICIDAD] WHERE AÑO = " & TextBox5.Text & ""
                SqlDataSource4.SelectCommand = "SELECT * FROM [EXPENSAS] WHERE AÑO = " & TextBox5.Text & ""
                SqlDataSource5.SelectCommand = "SELECT * FROM [GAS] WHERE AÑO = " & TextBox5.Text & ""
                SqlDataSource6.SelectCommand = "SELECT * FROM [IMPUESTOS] WHERE AÑO = " & TextBox5.Text & ""
            End If
        Else
            If TextBox5.Text.Length = 0 Then
                SqlDataSource1.SelectCommand = "SELECT * FROM [AGUA] WHERE NUMERO = '" & TextBox4.Text & "' OR CONTRATO = '" & TextBox4.Text & "' OR PROPIEDAD LIKE '%" & TextBox4.Text & "%'"
                SqlDataSource2.SelectCommand = "SELECT * FROM [ALQUILER] WHERE NUMERO = '" & TextBox4.Text & "' OR CONTRATO = '" & TextBox4.Text & "' OR PROPIEDAD LIKE '%" & TextBox4.Text & "%'"
                SqlDataSource3.SelectCommand = "SELECT * FROM [ELECTRICIDAD] WHERE NUMERO = '" & TextBox4.Text & "' OR CONTRATO = '" & TextBox4.Text & "' OR PROPIEDAD LIKE '%" & TextBox4.Text & "%'"
                SqlDataSource4.SelectCommand = "SELECT * FROM [EXPENSAS] WHERE NUMERO = '" & TextBox4.Text & "' OR CONTRATO = '" & TextBox4.Text & "' OR PROPIEDAD LIKE '%" & TextBox4.Text & "%'"
                SqlDataSource5.SelectCommand = "SELECT * FROM [GAS] WHERE NUMERO = '" & TextBox4.Text & "' OR CONTRATO = '" & TextBox4.Text & "' OR PROPIEDAD LIKE '%" & TextBox4.Text & "%'"
                SqlDataSource6.SelectCommand = "SELECT * FROM [IMPUESTOS] WHERE NUMERO = '" & TextBox4.Text & "' OR CONTRATO = '" & TextBox4.Text & "' OR PROPIEDAD LIKE '%" & TextBox4.Text & "%'"
            Else
                SqlDataSource1.SelectCommand = "SELECT * FROM [AGUA] WHERE NUMERO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR CONTRATO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR PROPIEDAD LIKE '%" & TextBox4.Text & "%' AND AÑO = " & TextBox5.Text & " "
                SqlDataSource2.SelectCommand = "SELECT * FROM [ALQUILER] WHERE NUMERO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR CONTRATO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR PROPIEDAD LIKE '%" & TextBox4.Text & "%' AND AÑO = " & TextBox5.Text & " "
                SqlDataSource3.SelectCommand = "SELECT * FROM [ELECTRICIDAD] WHERE NUMERO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR CONTRATO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR PROPIEDAD LIKE '%" & TextBox4.Text & "%' AND AÑO = " & TextBox5.Text & " "
                SqlDataSource4.SelectCommand = "SELECT * FROM [EXPENSAS] WHERE NUMERO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR CONTRATO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR PROPIEDAD LIKE '%" & TextBox4.Text & "%' AND AÑO = " & TextBox5.Text & " "
                SqlDataSource5.SelectCommand = "SELECT * FROM [GAS] WHERE NUMERO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR CONTRATO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR PROPIEDAD LIKE '%" & TextBox4.Text & "%' AND AÑO = " & TextBox5.Text & " "
                SqlDataSource6.SelectCommand = "SELECT * FROM [IMPUESTOS] WHERE NUMERO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR CONTRATO = '" & TextBox4.Text & "' AND AÑO = " & TextBox5.Text & " OR PROPIEDAD LIKE '%" & TextBox4.Text & "%' AND AÑO = " & TextBox5.Text & " "
            End If
        End If

        GridView1.DataBind()
        GridView2.DataBind()
        GridView3.DataBind()
        GridView4.DataBind()
        GridView5.DataBind()
        GridView6.DataBind()

    End Sub
End Class