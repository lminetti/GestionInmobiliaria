<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Contratos.aspx.vb" Inherits="GestionInmobiliaria.Contratos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gestión Inmobiliaria</title>
    <link rel="stylesheet" href="Estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="cuadro_general">
            <asp:Button ID="Button4" runat="server" Text="Salir" CssClass="cerrar_sesion" OnClick="Button4_Click" />
            <div class="logo"></div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_bienvenida" ReadOnly="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Volver al panel" CssClass="boton_estado" OnClick="Button1_Click" />
            <asp:TextBox ID="TextBox3" runat="server" Text="ALTA, BAJA Y MODIFICACIÓN DE CONTRATOS" ReadOnly="true" CssClass="titulo1"></asp:TextBox>

            <div class="cuadro_grid_estado">
                <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:UsuariosConnectionString %>" ProviderName="<%$ ConnectionStrings:UsuariosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Hoja1$]" runat="server"></asp:SqlDataSource>
                <asp:GridView OnRowDeleting="GridView1_RowDeleting" OnRowDeleted="GridView1_RowDeleted" ID="GridView1" AutoGenerateColumns="false" runat="server" DataSourceID="SqlDataSource1" Visible="true" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="false" DataField="LOCATARIO" HeaderText="LOCATARIO" Visible="True" ItemStyle-CssClass="grid_row" HtmlEncode="false">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="LOCADOR" HeaderText="LOCADOR" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                            <asp:CommandField ControlStyle-CssClass="grid_deletebutton" ShowDeleteButton="true" DeleteText="BORRAR" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:TextBox ID="TextBox2" runat="server" Text="Aplicación desarrollada por Mills, Compañía de Software" ReadOnly="true" CssClass="footer_login"></asp:TextBox>

        </div>
    </form>
</body>
</html>
