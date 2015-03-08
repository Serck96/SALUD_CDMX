<%@ Page Title="" Language="C#" MasterPageFile="~/Salud_CDMX.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SALUD_CDMX.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-8">

            <div class="container">
                
            </div>
        </div>
        <div class="col-md-4">
            <form class="form-signin">

                <h2 class="form-signin-heading">Iniciar sesion</h2>
                <div style="margin-bottom: 25px" class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div style="margin-bottom: 25px" class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnIngresa" runat="server" Text="Entrar" CssClass="btn btn-lg btn-primary btn-block" OnClick="btnIngresa_Click"/>
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
            </form>

            <div class="g6">
                

            </div>


        </div>
    </div>
</asp:Content>
