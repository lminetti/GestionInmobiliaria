<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Panel.aspx.vb" Inherits="GestionInmobiliaria.Panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gestión Inmobiliaria</title>
    <link rel="stylesheet" href="Estilos.css" />

    <script>
        function AccesoInq() {
            document.getElementById("Button6").click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cuadro_general">
            <asp:Button ID="Button4" runat="server" Text="Salir" CssClass="cerrar_sesion" OnClick="Button4_Click" />
            <div class="logo"></div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_bienvenida" ReadOnly="true"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" Text="PANEL DE ADMINISTRACIÓN" ReadOnly="true" CssClass="titulo1"></asp:TextBox>

            <div class="cuadro_pago">
                <asp:Button ID="Button3" runat="server" Text="ALTA DE CONTRATOS" CssClass="boton_panel" OnClick="Button3_Click" />
                <asp:Button ID="Button1" runat="server" Text="DETALLE DE PAGOS" CssClass="boton_panel" OnClick="Button1_Click1" />
                <asp:Button ID="Button2" runat="server" Text="DETALLE DE INGRESOS" CssClass="boton_panel" OnClick="Button2_Click" />
                <asp:Button ID="Button5" runat="server" Text="DETALLE DE CONTRATOS" CssClass="boton_panel" OnClick="Button5_Click" />
            </div>

            <%-- GRID CON USUARIOS --%>

            <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:UsuariosConnectionString %>" ProviderName="<%$ ConnectionStrings:UsuariosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Hoja1$]" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Visible="false"></asp:GridView>

            <asp:TextBox ID="TextBox4" Placeholder="Número de inquilino" runat="server" CssClass="accesp_inq_text"></asp:TextBox>
            <div class="acceso_inq" onclick="AccesoInq()"><a>Acceso inquilino</a></div>
            <asp:Button ID="Button6" runat="server" Text="Button" Style="display: none" OnClick="Button6_Click" />

            <asp:TextBox ID="TextBox2" runat="server" Text="Aplicación desarrollada por Mills, Compañía de Software" ReadOnly="true" CssClass="footer_login"></asp:TextBox>
        </div>
    </form>
</body>
</html>
