﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SALUD_CDMX.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="SALUD_CDMX.Pacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>Hola aqui podras ver tus citas&nbsp; Médicas y/o reprogramas alguna</td>
        </tr>
        <tr>
            <td>Citas Médicas<asp:Label ID="lblidPaciente" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:LinkButton ID="lnkBtnNuevaCita" runat="server" OnClick="lnkBtnNuevaCita_Click">+ Nueva Cita</asp:LinkButton>
                <br />
                <asp:GridView ID="gvCitas" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvCitas_RowCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("idCita") %>' CommandName="Cancelar" ImageUrl="~/Imagenes/cancelar.png" OnClientClick="return confirm('Esto cancelara la cita programada, ¿Esta seguro?');" Width="22px" />
                                &nbsp;&nbsp;
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("idCita") %>' CommandName="Modificar" ImageUrl="~/Imagenes/modificar.png" Width="22px" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="ImageButton3" runat="server" CommandArgument='<%# Eval("idCita") %>' CommandName="Confirmar" ImageUrl="~/Imagenes/palomita.jpg" OnClientClick="return confirm('va a confirmar su cita medica, el recordamos llegar 10 mintos antes de la hora');" Width="22px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CentroSalud" HeaderText="Unidad Médica" />
                        <asp:BoundField DataField="dia" HeaderText="Fecha" />
                        <asp:BoundField DataField="Fecha" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora" />
                        <asp:BoundField DataField="Medico" HeaderText="Médico" />
                        <asp:BoundField DataField="Estatus" HeaderText="Estatus de la Cita" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
