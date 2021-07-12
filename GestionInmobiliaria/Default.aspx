<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="GestionInmobiliaria._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gestión Inmobiliaria</title>
    <link rel="stylesheet" href="Estilos.css" />
    <link rel="stylesheet" href="Mobile.css" />
    <script>
        function runScript(e) {
            if (e.keyCode == 13) {
                var newValue1 = document.getElementById('TextBox1').value;
                document.getElementById("Text1").value = newValue1;
                document.getElementById("Button1").click();
            }
        }
        function IniciarSesion() {
            var newValue1 = document.getElementById('TextBox1').value;
            document.getElementById("Text1").value = newValue1;
            document.getElementById("Button1").click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="cuadro_login">
            <div class="logo"></div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_nro_inquilino" Placeholder="Usuario" onkeypress="return runScript(event)"></asp:TextBox>
            <input id="Text1" type="text" name="Text1" style="display: none" />
            <div class="boton_login" onclick="IniciarSesion()"><a>ACCEDER</a></div>
            <asp:Button ID="Button1" runat="server" Text="ACCEDER" Style="display: none" OnClick="Button1_Click" />
            <asp:TextBox ID="TextBox2" runat="server" Text="Aplicación desarrollada por Mills, Compañía de Software" ReadOnly="true" CssClass="footer_login"></asp:TextBox>
        </div>

        <%-- GRID CON USUARIOS --%>

        <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:UsuariosConnectionString %>" ProviderName="<%$ ConnectionStrings:UsuariosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Hoja1$]" runat="server"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Visible="false"></asp:GridView>

    </form>
</body>
</html>
