<%@ Page Title="" Language="C#" MasterPageFile="~/SALUD_CDMX.Master" AutoEventWireup="true" CodeBehind="GeneraCita.aspx.cs" Inherits="SALUD_CDMX.GeneraCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false"></script>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(success);
        } else {
            alert("debes de permitir la geolocalizacion");
        }
        function success(position) {
            var latitude = "<%=lblLatitud.Text%>";
            var longitude = "<%=lblLong.Text%>";
            //var latitude = position.coords.latitude;
            //var longitude = position.coords.longitude;
            var city = position.coords.locality;
            var myLatlng = new google.maps.LatLng(latitude, longitude);
            var myOptions = {
                center: myLatlng,
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
            var marker = new google.maps.Marker({
                position: myLatlng,
                title: "lat: " + latitude + " long: " + longitude
            });

            marker.setMap(map);
            var infowindow = new google.maps.InfoWindow({ content: "<b>Centro de Salud xxx</b>" });
            infowindow.open(map, marker);
        }
    </script>
    
    <style type="text/css">
    .auto-style1 {
        width: 109px;
    }
        .auto-style2 {
            width: 351px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1">Centro de Salud:</td>
            <td colspan="2">
                <asp:DropDownList ID="cboCentroSalud" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboCentroSalud_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Label ID="lblidCita" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidPersona" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Especialidad:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="cboEspecialidad" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboEspecialidad_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td rowspan="7"><div id="map_canvas" style="width: 500px; height: 400px"></div></td>
        </tr>
        <tr>
            <td class="auto-style1">Medico:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="cboMedico" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Fecha:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date" AutoPostBack="True" OnTextChanged="txtFecha_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Hora:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="cboHora" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Button ID="btnGuardaCita" runat="server" OnClick="btnGuardaCita_Click" Text="Agenda Cita" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Label ID="lblResultado" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Label ID="lblLatitud" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblLong" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblDia" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
