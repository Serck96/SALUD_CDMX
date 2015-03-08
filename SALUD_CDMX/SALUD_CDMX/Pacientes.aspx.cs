using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SALUD_CDMX
{
    public partial class Pacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String idPersona = "5";

            if (Request.QueryString["iP"] != null)
            {
                if (Request.QueryString["iP"].ToString() != "")
                {
                    Extras ext = new Extras();
                    idPersona = ext.decriptaB64(Request.QueryString["iP"].ToString());
                }
                else
                {
                    Response.Redirect(".");
                }
            }
            else
            {
                Response.Redirect(".");
            }

            lblidPaciente.Text = idPersona;

            if (!IsPostBack)
            {
                traeCitasMedicas(lblidPaciente.Text);
            }
        }
        private void traeCitasMedicas(String idPersona)
        {
            Datos sql = new Datos();
            DataTable tbl = new DataTable();

            tbl = sql.TraeDataTable("sp_traeCitasPaciente", idPersona);

            gvCitas.DataSource = tbl;
            gvCitas.DataBind();
        }

        protected void gvCitas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String cmd = e.CommandName;
            String valor = e.CommandArgument.ToString();
            

            switch (cmd)
            {
                case "Cancelar":
                    cancelaCita(lblidPaciente.Text, valor);
                    break;
                case "Modificar":
                    Extras Ext = new Extras();
                    String iP = Ext.encriptaB64(lblidPaciente.Text);
                    String iC = Ext.encriptaB64(valor);
                    Response.Redirect("GeneraCita.aspx?iP=" + iP + "&iC=" + iC);

                    break;
                case "Confirmar":
                    confirmaCita(lblidPaciente.Text, valor);
                    break;
            }
        }
        private void cancelaCita(String idPaciente, String idCita)
        {
            Datos sql = new Datos();
            sql.Ejecutar("sp_CancelaCitaPaciente", idCita, idPaciente);

            traeCitasMedicas(lblidPaciente.Text);
        }
        private void confirmaCita(String idPaciente, String idCita)
        {
            Datos sql = new Datos();
            sql.Ejecutar("sp_ConfirmaCitaPaciente", idCita, idPaciente);

            traeCitasMedicas(lblidPaciente.Text);
        }
        protected void lnkBtnNuevaCita_Click(object sender, EventArgs e)
        {
            Extras Ext = new Extras();
            String iP = Ext.encriptaB64(lblidPaciente.Text);
            Response.Redirect("GeneraCita.aspx?iP=" + iP);
        }
    }
}