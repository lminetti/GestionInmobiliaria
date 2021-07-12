<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EstadoCuenta.aspx.vb" Inherits="GestionInmobiliaria.EstadoCuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gestión Inmobiliaria</title>
    <link rel="stylesheet" href="Estilos.css" />
    <link rel="stylesheet" href="Mobile.css" />

    <script>
        function RemoveReadOnly() {
            document.getElementById('TextBox4').readOnly = false;
            document.getElementById('TextBox5').readOnly = false;
            document.getElementById('TextBox4').readOnly = false;
            document.getElementById('TextBox5').readOnly = false;
        }
        function AplicarFiltro() {
            var newValue1 = document.getElementById('DropDownList1').value;

            document.getElementById("Text1").value = newValue1;

            document.getElementById("Button2").click();
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="cuadro_general">
            <asp:Button ID="Button4" runat="server" Text="Salir" CssClass="cerrar_sesion" OnClick="Button4_Click"/>
            <div class="logo"></div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_bienvenida" ReadOnly="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Ingreso de pagos" CssClass="boton_estado" OnClick="Button1_Click" />
            <asp:Button ID="Button3" runat="server" Text="Detalle de pagos" CssClass="boton_alta" OnClick="Button3_Click" />
            <asp:TextBox ID="TextBox3" runat="server" Text="ESTADO DE CUENTA" ReadOnly="true" CssClass="titulo1"></asp:TextBox>

            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddl2">
                <asp:ListItem Text="Todos" Value="ALL" />
                <asp:ListItem Text="Alquiler" Value="0" />
                <asp:ListItem Text="Expensas" Value="1" />
                <asp:ListItem Text="Servicio de agua" Value="2" />
                <asp:ListItem Text="Servicio de gas" Value="3" />
                <asp:ListItem Text="Servicio de electricidad" Value="4" />
                <asp:ListItem Text="Impuestos" Value="5" />
            </asp:DropDownList>
            <input id="Text1" type="text" name="Text1" style="display: none" />

            <div class="filtros">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="date_calendar1" TextMode="Date" onclick="RemoveReadOnly()"></asp:TextBox>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="date_calendar2" TextMode="Date" onclick="RemoveReadOnly()"></asp:TextBox>
                <div class="boton_aplicar_filtro" onclick="AplicarFiltro()"><a>Aplicar filtro</a></div>
                <asp:Button ID="Button2" runat="server" Text="Aplicar filtro" CssClass="boton_aplicar_filtro" Style="display:none" OnClick="Button2_Click" />
            </div>

            <div class="cuadro_grid_estado">
                <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PAGOS]" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" DataSourceID="SqlDataSource1" Visible="true" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="FECHA" HeaderText="FECHA" DataFormatString="{0:dd/MM/yyyy}" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="TIPO" HeaderText="TIPO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="false" DataField="MONTO" HeaderText="MONTO" Visible="True" ItemStyle-CssClass="grid_row" HtmlEncode="false">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PAGO" HeaderText="PAGO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="LOCATARIO" HeaderText="LOCATARIO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="VALIDADO" HeaderText="VALIDADO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>

            <asp:TextBox ID="TextBox2" runat="server" Text="Aplicación desarrollada por Mills, Compañía de Software" ReadOnly="true" CssClass="footer_login"></asp:TextBox>

        </div>
    </form>
</body>
</html>
