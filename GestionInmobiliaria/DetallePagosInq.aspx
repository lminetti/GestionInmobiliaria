<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetallePagosInq.aspx.vb" Inherits="GestionInmobiliaria.DetallePagosInq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gestión Inmobiliaria</title>
    <link rel="stylesheet" href="Estilos.css" />
    <link rel="stylesheet" href="Mobile.css" />

    <script>
        function MostrarAgua() {
            document.getElementById('agua').style.display = 'block';
            document.getElementById('alquiler').style.display = 'none';
            document.getElementById('electricidad').style.display = 'none';
            document.getElementById('expensas').style.display = 'none';
            document.getElementById('gas').style.display = 'none';
            document.getElementById('impuestos').style.display = 'none';
            document.getElementById("Text1").value = "agua";
        }
        function MostrarAlquiler() {
            document.getElementById('agua').style.display = 'none';
            document.getElementById('alquiler').style.display = 'block';
            document.getElementById('electricidad').style.display = 'none';
            document.getElementById('expensas').style.display = 'none';
            document.getElementById('gas').style.display = 'none';
            document.getElementById('impuestos').style.display = 'none';
            document.getElementById("Text1").value = "alquiler";
        }
        function MostrarElectricidad() {
            document.getElementById('agua').style.display = 'none';
            document.getElementById('alquiler').style.display = 'none';
            document.getElementById('electricidad').style.display = 'block';
            document.getElementById('expensas').style.display = 'none';
            document.getElementById('gas').style.display = 'none';
            document.getElementById('impuestos').style.display = 'none';
            document.getElementById("Text1").value = "electricidad";
        }
        function MostrarExpensas() {
            document.getElementById('agua').style.display = 'none';
            document.getElementById('alquiler').style.display = 'none';
            document.getElementById('electricidad').style.display = 'none';
            document.getElementById('expensas').style.display = 'block';
            document.getElementById('gas').style.display = 'none';
            document.getElementById('impuestos').style.display = 'none';
            document.getElementById("Text1").value = "expensas";
        }
        function MostrarGas() {
            document.getElementById('agua').style.display = 'none';
            document.getElementById('alquiler').style.display = 'none';
            document.getElementById('electricidad').style.display = 'none';
            document.getElementById('expensas').style.display = 'none';
            document.getElementById('gas').style.display = 'block';
            document.getElementById('impuestos').style.display = 'none';
            document.getElementById("Text1").value = "gas";
        }
        function MostrarImpuestos() {
            document.getElementById('agua').style.display = 'none';
            document.getElementById('alquiler').style.display = 'none';
            document.getElementById('electricidad').style.display = 'none';
            document.getElementById('expensas').style.display = 'none';
            document.getElementById('gas').style.display = 'none';
            document.getElementById('impuestos').style.display = 'block';
            document.getElementById("Text1").value = "impuestos";
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="cuadro_general">
            <asp:Button ID="Button4" runat="server" Text="Salir" CssClass="cerrar_sesion" OnClick="Button4_Click" />
            <div class="logo"></div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_bienvenida" ReadOnly="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Ingreso de pagos" CssClass="boton_estado" OnClick="Button1_Click" />
            <asp:Button ID="Button3" runat="server" Text="Estado de cuenta" CssClass="boton_alta" OnClick="Button3_Click" />
            <asp:TextBox ID="TextBox3" runat="server" Text="DETALLE DE PAGOS" ReadOnly="true" CssClass="titulo1"></asp:TextBox>

            <div class="Contenedor_Botonera">
                <div class="Botonera" onclick="MostrarAgua()"><a>AGUA</a></div>
                <div class="Botonera" onclick="MostrarAlquiler()"><a>ALQUILER</a></div>
                <div class="Botonera" onclick="MostrarElectricidad()"><a>ELECTRICIDAD</a></div>
                <div class="Botonera" onclick="MostrarExpensas()"><a>EXPENSAS</a></div>
                <div class="Botonera" onclick="MostrarGas()"><a>GAS</a></div>
                <div class="Botonera" onclick="MostrarImpuestos()"><a>IMPUESTOS</a></div>

                <input id="Text1" type="text" value="" runat="server" style="display: none;" />
            </div>

            <div runat="server" id="agua" class="div_pagos1">
                <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [AGUA]" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Visible="true" AutoGenerateColumns="false" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="false" DataField="CONTRATO" HeaderText="CONTRATO" Visible="True" ItemStyle-CssClass="grid_row" HtmlEncode="false">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MES" HeaderText="MES" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="AÑO" HeaderText="AÑO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MONTO" HeaderText="MONTO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <div runat="server" id="alquiler" class="div_pagos2">
                <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [ALQUILER]" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" Visible="true" AutoGenerateColumns="false" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="false" DataField="CONTRATO" HeaderText="CONTRATO" Visible="True" ItemStyle-CssClass="grid_row" HtmlEncode="false">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MES" HeaderText="MES" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="AÑO" HeaderText="AÑO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MONTO" HeaderText="MONTO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PAGADO" HeaderText="PAGADO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="SALDO" HeaderText="SALDO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <div runat="server" id="electricidad" class="div_pagos3">
                <asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [ELECTRICIDAD]" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource3" Visible="true" AutoGenerateColumns="false" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="false" DataField="CONTRATO" HeaderText="CONTRATO" Visible="True" ItemStyle-CssClass="grid_row" HtmlEncode="false">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MES" HeaderText="MES" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="AÑO" HeaderText="AÑO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MONTO" HeaderText="MONTO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <div runat="server" id="expensas" class="div_pagos4">
                <asp:SqlDataSource ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [EXPENSAS]" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSource4" Visible="true" AutoGenerateColumns="false" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="false" DataField="CONTRATO" HeaderText="CONTRATO" Visible="True" ItemStyle-CssClass="grid_row" HtmlEncode="false">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MES" HeaderText="MES" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="AÑO" HeaderText="AÑO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MONTO" HeaderText="MONTO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <div runat="server" id="gas" class="div_pagos5">
                <asp:SqlDataSource ID="SqlDataSource5" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [GAS]" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView5" runat="server" DataSourceID="SqlDataSource5" Visible="true" AutoGenerateColumns="false" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="false" DataField="CONTRATO" HeaderText="CONTRATO" Visible="True" ItemStyle-CssClass="grid_row" HtmlEncode="false">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MES" HeaderText="MES" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="AÑO" HeaderText="AÑO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MONTO" HeaderText="MONTO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <div runat="server" id="impuestos" class="div_pagos6">
                <asp:SqlDataSource ID="SqlDataSource6" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [IMPUESTOS]" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView6" runat="server" DataSourceID="SqlDataSource6" Visible="true" AutoGenerateColumns="false" CssClass="pagos_grid" Width="100" HeaderStyle-CssClass="gridview_header" CellPadding="8" BorderColor="#e1e1e1">
                    <Columns>
                        <asp:BoundField ReadOnly="true" DataField="NUMERO" HeaderText="NUMERO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="false" DataField="CONTRATO" HeaderText="CONTRATO" Visible="True" ItemStyle-CssClass="grid_row" HtmlEncode="false">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MES" HeaderText="MES" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="AÑO" HeaderText="AÑO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="MONTO" HeaderText="MONTO" Visible="True" ItemStyle-CssClass="grid_row">
                            <ItemStyle CssClass="col" Wrap="false"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="true" DataField="PROPIEDAD" HeaderText="PROPIEDAD" Visible="True" ItemStyle-CssClass="grid_row">
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
