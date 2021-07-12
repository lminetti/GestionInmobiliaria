<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Landing.aspx.vb" Inherits="GestionInmobiliaria.Landing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Gestión Inmobiliaria</title>
    <link rel="stylesheet" href="Estilos.css" />
    <link rel="stylesheet" href="Mobile.css" />
    <script>

        function CheckOnlyOneCheckBox(checkbox) {
            var checkBoxList = checkbox.parentNode.parentNode.parentNode;
            var list = checkBoxList.getElementsByTagName("input");
            for (var i = 0; i < list.length; i++) {
                if (list[i] != checkbox && checkbox.checked) {
                    list[i].checked = false;
                }
            }
        }

        function ShowMonth() {

            var DropDownListValue = document.getElementById('DropDownList1').value;
            if (DropDownListValue == "0") {
                document.getElementById('DropDownList2').style.display = "block";
                document.getElementById('TextBox7').style.display = "block";
            }
            else {
                document.getElementById('DropDownList2').style.display = "none";
                document.getElementById('TextBox7').style.display = "none";
            }

        }

        function IngresarPago() {
            var newValue1 = document.getElementById('TextBox4').value;
            var newValue2 = document.getElementById('DropDownList1').value;
            var checkBox1 = document.getElementById("CheckBox1");
            var checkBox2 = document.getElementById("CheckBox2");
            var checkBox3 = document.getElementById("CheckBox3");
            var newValue5 = document.getElementById('DropDownList2').value;
            var newValue6 = document.getElementById("TextBox7").value;
            var newValue3 = "";

            if (checkBox1.checked == true) {
                checkBox2.checked == false;
                checkBox3.checked == false;
                newValue3 = "EFECTIVO";
            }
            if (checkBox2.checked == true) {
                checkBox1.checked == false;
                checkBox3.checked == false;
                newValue3 = "TRANSFERENCIA";
            }
            if (checkBox3.checked == true) {
                checkBox1.checked == false;
                checkBox2.checked == false;
                newValue3 = "OTROS";
            }
            var newValue4 = document.getElementById('TextBox5').value;

            document.getElementById("Text1").value = newValue1;
            document.getElementById("Text2").value = newValue2;
            document.getElementById("Text3").value = newValue3;
            document.getElementById("Text4").value = newValue4;
            document.getElementById("Text5").value = newValue5;
            document.getElementById("Text6").value = newValue6;

            document.getElementById("Button2").click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cuadro_general">
            <asp:Button ID="Button3" runat="server" Text="Volver a panel" CssClass="backtopanel" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="Salir" CssClass="cerrar_sesion" OnClick="Button4_Click" />
            <div class="logo"></div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_bienvenida" ReadOnly="true"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Estado de cuenta" CssClass="boton_estado" OnClick="Button1_Click" />
            <asp:TextBox ID="TextBox3" runat="server" Text="INGRESO DE PAGOS" ReadOnly="true" CssClass="titulo1"></asp:TextBox>

            <div class="cuadro_pago">
                <div class="sub_cuadro">
                    <asp:Label ID="Label1" runat="server" Text="Fecha de pago" CssClass="label_titulo" Font-Size="14px"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Date" CssClass="textbox_date" Placeholder="dd/MM/yyyy"></asp:TextBox>
                    <input id="Text1" type="text" name="Text1" style="display: none" />
                </div>
                <div class="sub_cuadro">
                    <asp:Label ID="Label2" runat="server" Text="Tipo de pago" CssClass="label_titulo"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddl" onchange="ShowMonth();">
                        <asp:ListItem Text="Alquiler" Value="0" />
                        <asp:ListItem Text="Expensas" Value="1" />
                        <asp:ListItem Text="Servicio de agua" Value="2" />
                        <asp:ListItem Text="Servicio de gas" Value="3" />
                        <asp:ListItem Text="Servicio de electricidad" Value="4" />
                        <asp:ListItem Text="Impuestos" Value="5" />
                    </asp:DropDownList>
                    <input id="Text2" type="text" name="Text2" style="display: none" />
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="ddl">
                        <asp:ListItem Text="Enero" Value="1" />
                        <asp:ListItem Text="Febrero" Value="2" />
                        <asp:ListItem Text="Marzo" Value="3" />
                        <asp:ListItem Text="Abril" Value="4" />
                        <asp:ListItem Text="Mayo" Value="5" />
                        <asp:ListItem Text="Junio" Value="6" />
                        <asp:ListItem Text="Julio" Value="7" />
                        <asp:ListItem Text="Agosto" Value="8" />
                        <asp:ListItem Text="Septiembre" Value="9" />
                        <asp:ListItem Text="Octubre" Value="10" />
                        <asp:ListItem Text="Noviembre" Value="11" />
                        <asp:ListItem Text="Diciembre" Value="12" />
                    </asp:DropDownList>
                    <asp:TextBox ID="TextBox7" runat="server" Placeholder="Ingrese año (yyyy)" CssClass="textbox_monto"></asp:TextBox>
                    <input id="Text5" type="text" name="Text5" style="display: none" />
                    <input id="Text6" type="text" name="Text6" style="display: none" />
                </div>
                <div class="sub_cuadro">
                    <asp:Label ID="Label3" runat="server" Text="Monto" CssClass="label_titulo"></asp:Label>
                    <div class="div_chkbx">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Efectivo" CssClass="chkbx" onclick="CheckOnlyOneCheckBox(this);" />
                        <br />
                        <asp:CheckBox ID="CheckBox2" runat="server" Text="Transferencia" CssClass="chkbx" onclick="CheckOnlyOneCheckBox(this);" />
                        <br />
                        <asp:CheckBox ID="CheckBox3" runat="server" Text="Otros" CssClass="chkbx" onclick="CheckOnlyOneCheckBox(this);" />
                        <br />
                    </div>
                    <asp:TextBox ID="TextBox5" runat="server" Placeholder="Ingrese monto $" CssClass="textbox_monto"></asp:TextBox>
                    <input id="Text3" type="text" name="Text3" style="display: none" />
                    <input id="Text4" type="text" name="Text4" style="display: none" />
                </div>
                <div class="sub_cuadro1">
                    <asp:Label ID="Label4" runat="server" Text="Adjuntar compte. (máx. 10mb)" CssClass="label_titulo"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="input_image" />
                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="input_image" />
                    <div class="button_ingreso_pago" onclick="IngresarPago()"><a>Ingresar pago</a></div>
                    <asp:Button ID="Button2" runat="server" Text="Ingresar pago" Style="display: none" OnClick="Button2_Click" />
                    <asp:TextBox ID="TextBox6" runat="server" CssClass="textbox_ingresado" ReadOnly="true" Visible="false"></asp:TextBox>
                </div>
            </div>

            <asp:TextBox ID="TextBox2" runat="server" Text="Aplicación desarrollada por Mills, Compañía de Software" ReadOnly="true" CssClass="footer_login"></asp:TextBox>
        </div>

        <%-- GRID CON PAGOS --%>

        <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:PagosConnectionString %>" ProviderName="<%$ ConnectionStrings:PagosConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PAGOS]" runat="server"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Visible="false"></asp:GridView>

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

    </form>
</body>
</html>
