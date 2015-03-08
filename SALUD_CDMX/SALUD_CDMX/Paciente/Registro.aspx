<%@ Page Title="" Language="C#" MasterPageFile="~/SALUD_CDMX.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="SALUD_CDMX.Paciente.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/jquery-ui.css" rel="stylesheet" />
    <script src="../js/jquery-ui.js"></script>
    <script src="../js/jquery-1.10.2.js"></script>
    <script>
        $(function () {
            var anio = (new Date).getFullYear();
            $(function() {
                $( "#ContentPlaceHolder1_textFecha" ).datepicker(
                    {
                        hangeMonth: true,
                        changeYear: true,
                        yearRange: anio - 16 + ':' + anio,
                        dateFormat: 'yy-mm-dd'
                    });
            });
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
                <asp:TextBox ID="textFecha" runat="server" TextMode="Date" OnTextChanged="textFecha_TextChanged" AutoPostBack="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCurp" runat="server" Text="CURP:" Width="150"></asp:Label>
                <asp:TextBox ID="txtCURP" runat="server" OnTextChanged="txtCURP_TextChanged" AutoPostBack="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMail" runat="server" Text="Correo:" Width="150"></asp:Label>
                <asp:TextBox ID="txtMail" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <asp:Panel ID="pnTutor" runat="server" Visible="false">
            <tr>
                <td>
                    <h1>Datos Tutor</h1>
                    <br />
                    <asp:Label ID="lblNombreTutor" runat="server" Text="Nombre:" Width="150"></asp:Label>
                    <asp:TextBox ID="txtNombreTutor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblApPaternoTutor" runat="server" Text="Apellido Paterno:" Width="150"></asp:Label>
                    <asp:TextBox ID="txtApPaternoTutor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblApMaternoTutor" runat="server" Text="Apellido Materno:" Width="150"></asp:Label>
                    <asp:TextBox ID="txtApMaternoTutor" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblGeneroTutor" runat="server" Text="Genero:" Width="120"></asp:Label>
                    <asp:RadioButtonList ID="rlGeneroTutor" runat="server">
                        <asp:ListItem>F</asp:ListItem>
                        <asp:ListItem>M</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFechaTutor" runat="server" Text="Fecha de Nacimiento:" Width="150"></asp:Label>
                    <asp:TextBox ID="txtFechaTutor" runat="server" TextMode="Date" OnTextChanged="textFecha_TextChanged" AutoPostBack="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCurpTutor" runat="server" Text="CURP:" Width="150"></asp:Label>
                    <asp:TextBox ID="txtCUrpTutor" runat="server" OnTextChanged="txtCURP_TextChanged" AutoPostBack="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMailTUtor" runat="server" Text="Correo:" Width="150"></asp:Label>
                    <asp:TextBox ID="txtMailTutor" runat="server"></asp:TextBox>
                </td>
            </tr>
        </asp:Panel>
        <tr>
            <td>
                <asp:Label ID="lblUser" runat="server" Text="Usuario:" Width="150"></asp:Label>
                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPass" runat="server" Text="Contraseña:" Width="150"></asp:Label>
                <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnGuardaPaciente" runat="server" Text="GuardarDatos" OnClick="btnGuardaPaciente_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
