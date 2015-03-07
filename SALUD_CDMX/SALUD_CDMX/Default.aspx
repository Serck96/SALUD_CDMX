<%@ Page Title="" Language="C#" MasterPageFile="~/Salud_CDMX.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SALUD_CDMX.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-8">
            <h3>
                <p>Mapa</p>
            </h3>
            <div class="container">

                <div id="cbp-fwslider" class="cbp-fwslider">
                    <ul>
                        <li><a href="#">
                            <img src="Imagenes/1.jpg" alt="img01" /></a></li>
                        <li><a href="#">
                            <img src="Imagenes/2.jpg" alt="img02" /></a></li>
                        <li><a href="#">
                            <img src="Imagenes/3.jpg" alt="img03" /></a></li>
                        <li><a href="#">
                            <img src="Imagenes/4.jpg" alt="img04" /></a></li>
                        <li><a href="#">
                            <img src="Imagenes/5.jpg" alt="img05" /></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <form class="form-signin">

                <h2 class="form-signin-heading">Iniciar sesion</h2>
                <div style="margin-bottom: 25px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="login-username" type="text" class="form-control" name="Usuario" value="" placeholder="Usuario" autofocus="">
                </div>

                <div style="margin-bottom: 25px" class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input id="login-username" type="text" class="form-control" name="Contraseña" value="" placeholder="Contraseña">
                </div>

                <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>

            </form>

            <div class="g6">
                <h2 class="h4">Calendario</h2>
                <div id="eventCalendarCustomDate"></div>
               
                <script>
                    /*
                    $(document).ready(function () {
                        $("#eventCalendarCustomDate").eventCalendar({
                            eventsjson: 'json/events.json.php',
                            dateFormat: 'dddd MM-D-YYYY'
                        });
                    });  */
				</script>
            
            </div>


        </div>
    </div>
</asp:Content>
