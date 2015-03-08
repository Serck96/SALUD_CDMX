<%@ Page Title="" Language="C#" MasterPageFile="~/SALUD_CDMX.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="SALUD_CDMX.Paciente.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="//code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css"/>
    <script>
        $(function () {
            var anio = (new Date).getFullYear();
            $("#ContentPlaceHolder1_textFecha").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: anio - 16 + ':' + anio,
                dateFormat: 'yy-mm-dd'
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td>
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:" Width="150"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblApPaterno" runat="server" Text="Apellido Paterno:" Width="150"></asp:Label>
                <asp:TextBox ID="txtApPaterno" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblApMaterno" runat="server" Text="Apellido Materno:" Width="150"></asp:Label>
                <asp:TextBox ID="txtApMAterno" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGenero" runat="server" Text="Genero:" Width="120"></asp:Label>
                <asp:RadioButtonList ID="rlGenero" runat="server">
                    <asp:ListItem>F</asp:ListItem>
                    <asp:ListItem>M</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFecha" runat="server" Text="Fecha de Nacimiento:" Width="150"></asp:Label>
                <asp:TextBox ID="textFecha" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
