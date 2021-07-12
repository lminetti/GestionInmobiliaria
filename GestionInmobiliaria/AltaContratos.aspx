<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AltaContratos.aspx.vb" Inherits="GestionInmobiliaria.AltaContratos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gestión Inmobiliaria</title>
    <link rel="stylesheet" href="Estilos.css" />
    <script>
        function MostrarCuadroAltas() {
            document.getElementById('cuadro_altas').style.display = 'block';
            document.getElementById('cuadro_grid').style.display = 'none';
        }
        function EsconderCuadroAltas() {
            document.getElementById('cuadro_altas').style.display = 'none';
            document.getElementById('cuadro_grid').style.display = 'block';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cuadro_general">
            <asp:Button ID="Button4" runat="server" Text="Salir" CssClass="cerrar_sesion" OnClick="Button4_Click" />
            <div class="logo"></div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_bienvenida" ReadOnly="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Volver al panel" CssClass="boton_estado" OnClick="Button1_Click" />
            <div class="boton_alta" onclick="MostrarCuadroAltas()"><a>Alta de contrato</a></div>
            <asp:TextBox ID="TextBox3" runat="server" Text="ALTA DE CONTRATOS" ReadOnly="true" CssClass="titulo1"></asp:TextBox>

            <div id="cuadro_altas" runat="server" class="cuadro_alta">
                <div class="x_close" onclick="EsconderCuadroAltas()"><a>X</a></div>
                <div class="Alta_TextBox_Contenedor">
                    <asp:TextBox ID="TextBox5" Placeholder="Número" runat="server" CssClass="Alta_TextBox"></asp:TextBox>
                    <asp:TextBox ID="TextBox6" Placeholder="Fecha desde (dd/MM/yyyy)" runat="server" CssClass="Alta_TextBox"></asp:TextBox>
                    <asp:TextBox ID="TextBox7" Placeholder="Fecha hasta (dd/MM/yyyy)" runat="server" CssClass="Alta_TextBox"></asp:TextBox>
                    <asp:TextBox ID="TextBox8" Placeholder="Propiedad" runat="server" CssClass="Alta_TextBox"></asp:TextBox>
                    <asp:TextBox ID="TextBox9" Placeholder="Locatario" runat="server" CssClass="Alta_TextBox"></asp:TextBox>
                    <asp:TextBox ID="TextBox10" Placeholder="Locador" runat="server" CssClass="Alta_TextBox"></asp:TextBox>
                    <asp:TextBox ID="TextBox11" Placeholder="Valor" runat="server" CssClass="Alta_TextBox"></asp:TextBox>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="Alta_DropDownList">
                        <asp:ListItem Text="Selec. actualización" Value="999" />
                        <asp:ListItem Text="Cada 6 meses" Value="1" />
                        <asp:ListItem Text="Cada 12 meses" Value="2" />
                    </asp:DropDownList>
                    <asp:TextBox ID="TextBox12" Placeholder="% de actualización" runat="server" CssClass="Alta_TextBox"></asp:TextBox>
                </div>
                <asp:Button ID="Button2" runat="server" Text="Ingresar" CssClass="boton_alta2" OnClick="Button2_Click" />
            </div>

            <asp:TextBox ID="TextBox4" Placeholder="Buscar contrato..." runat="server" CssClass="TextBoxBuscador" OnTextChanged="TextBox4_TextChanged" AutoPostBack="True"></asp:TextBox>

            <div id="cuadro_grid" runat="server" class="cuadro_grid_altas">
                <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:UsuariosConnectionString %>" ProviderName="<%$ ConnectionStrings:UsuariosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Hoja1$]" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" DataSourceID="SqlDataSource1" Visible="true" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="LOCATARIO" HeaderText="LOCATARIO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="LOCADOR" HeaderText="LOCADOR" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="TIPO" HeaderText="TIPO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="CONTRATO" HeaderText="CONTRATO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource8" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [ALQUILER]" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView8" runat="server" DataSourceID="SqlDataSource8" Visible="false"></asp:GridView>

            <asp:TextBox ID="TextBox2" runat="server" Text="Aplicación desarrollada por Mills, Compañía de Software" ReadOnly="true" CssClass="footer_login"></asp:TextBox>

        </div>
    </form>
</body>
</html>
