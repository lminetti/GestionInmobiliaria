<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallePagos.aspx.vb" Inherits="GestionInmobiliaria.DetallePagos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gestión Inmobiliaria</title>
    <link rel="stylesheet" href="Estilos.css" />

    <script>
        function RemoveReadOnly() {
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
        <div class="cuadro_general2">
            <asp:Button ID="Button4" runat="server" Text="Salir" CssClass="cerrar_sesion" OnClick="Button4_Click" />
            <div class="logo2"></div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_bienvenida" ReadOnly="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Volver al panel" CssClass="boton_estado" OnClick="Button1_Click" />

            <div class="Cuadro_DetallePagos">

                <asp:TextBox ID="TextBox3" runat="server" Text="DETALLE DE PAGOS" ReadOnly="true" CssClass="titulo2"></asp:TextBox>

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
                    <asp:Button ID="Button2" runat="server" Text="Aplicar filtro" CssClass="boton_aplicar_filtro" Style="display: none" OnClick="Button2_Click" />
                </div>

                <div class="cuadro_grid_estado2">
                    <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PAGOS] ORDER BY VALIDADO ASC, FECHA" runat="server"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" DataSourceID="SqlDataSource1" Visible="true" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="SelectRow" runat="server" AutoPostBack="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
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
                            <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
                                <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="true" DataField="VALIDADO" HeaderText="VALIDADO" Visible="True" ItemStyle-CssClass="grid_row">
                                <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                                <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="true" DataField="LOCATARIO" HeaderText="LOCATARIO" Visible="True" ItemStyle-CssClass="grid_row">
                                <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="true" DataField="LOCADOR" HeaderText="LOCADOR" Visible="True" ItemStyle-CssClass="grid_row">
                                <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="true" DataField="CONTRATO" HeaderText="CONTRATO" Visible="True" ItemStyle-CssClass="grid_row">
                                <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField ReadOnly="true" DataField="ID" HeaderText="ID" Visible="True" ItemStyle-CssClass="grid_row">
                                <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>

            <asp:TextBox ID="TextBox6" Placeholder="Importe..." CssClass="textbox_editar" runat="server"></asp:TextBox>
            <asp:Button ID="Button6" runat="server" Text="Editar importe" CssClass="boton_editar" OnClick="Button6_Click" />
            <asp:Button ID="Button3" runat="server" Text="Validar selección" CssClass="boton_validar" OnClick="Button3_Click" />
            <asp:Button ID="Button5" runat="server" Text="Borrar selección" CssClass="boton_borrar" OnClick="Button5_Click" />

            <asp:TextBox ID="TextBox2" runat="server" Text="Aplicación desarrollada por Mills, Compañía de Software" ReadOnly="true" CssClass="footer_login"></asp:TextBox>

            <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [AGUA]" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" Visible="false"></asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [ALQUILER]" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource3" Visible="false"></asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [ELECTRICIDAD]" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSource4" Visible="false"></asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource5" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [EXPENSAS]" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView5" runat="server" DataSourceID="SqlDataSource5" Visible="false"></asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource6" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [GAS]" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView6" runat="server" DataSourceID="SqlDataSource6" Visible="false"></asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource7" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [IMPUESTOS]" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView7" runat="server" DataSourceID="SqlDataSource7" Visible="false"></asp:GridView>

        </div>
    </form>
</body>
</html>
