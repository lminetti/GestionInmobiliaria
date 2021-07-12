<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetalleIngresos.aspx.vb" Inherits="GestionInmobiliaria.DetalleIngresos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

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

            document.getElementById("Button2").click();
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
            <asp:TextBox ID="TextBox3" runat="server" Text="DETALLE DE INGRESOS" ReadOnly="true" CssClass="titulo1"></asp:TextBox>

            <div class="filtros">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="date_calendar1" TextMode="Date" onclick="RemoveReadOnly()"></asp:TextBox>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="date_calendar2" TextMode="Date" onclick="RemoveReadOnly()"></asp:TextBox>
                <div class="boton_aplicar_filtro" onclick="AplicarFiltro()"><a>Aplicar filtro</a></div>
                <asp:Button ID="Button2" runat="server" Text="Aplicar filtro" CssClass="boton_aplicar_filtro" Style="display:none" OnClick="Button2_Click1" />
            </div>

            <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PAGOS] WHERE VALIDADO = 'SI' AND TIPO = 'Alquiler'" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" Visible="false"></asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT PAGO, Sum(MONTO) AS MONTO FROM [PAGOS] WHERE VALIDADO = 'SI' AND TIPO = 'Alquiler' GROUP BY PAGO" runat="server"></asp:SqlDataSource>
            
            <div class="chart_container">
                <asp:Chart runat="server" DataSourceID="SqlDataSource1" CssClass="chart" ID="Chart1" BackImageTransparentColor="White" BackSecondaryColor="White" BorderlineWidth="0" Width="500px" Height="250px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="PAGO" YValueMembers="MONTO" LabelAngle="-90" LabelFormat="0,0" Font="Segoe UI"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY>
                                <MajorGrid Enabled="False" />
                                <LabelStyle Format="0,0" />
                            </AxisY>
                            <AxisX>
                                <MajorGrid Enabled="False" />
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <asp:TextBox ID="TextBox2" runat="server" Text="Aplicación desarrollada por Mills, Compañía de Software" ReadOnly="true" CssClass="footer_login"></asp:TextBox>

        </div>
    </form>
</body>
</html>
