using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SALUD_CDMX
{
    public partial class GeneraCita : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String idCita = "0";
            String idPersona = "0";
            if (Request.QueryString["iC"] != null)
            {
                if (Request.QueryString["iC"].ToString() != "")
                {
                    Extras ext = new Extras();
                    idCita = ext.decriptaB64(Request.QueryString["iC"].ToString());
                }
            }

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

            lblidPersona.Text = idPersona;
            lblidCita.Text = idCita;
            if (!IsPostBack)
            {
                traeCentrosSalud();
            }
        }
        private void traeCentrosSalud()
        {
            Datos sql = new Datos();
            DataTable tbl = new DataTable();

            tbl = sql.TraeDataTable("sp_traeCentrosSalud");

            cboCentroSalud.DataSource = tbl;
            cboCentroSalud.DataValueField = "idCentroSalud";
            cboCentroSalud.DataTextField = "CentroSalud";
            cboCentroSalud.DataBind();


        }
        private void traeEspecialidad(String idCentroSalud)
        {
            Datos sql = new Datos();
            DataTable tbl = new DataTable();

            tbl = sql.TraeDataTable("sp_traeServicioCentroSalud", idCentroSalud);

            cboEspecialidad.DataSource = tbl;
            cboEspecialidad.DataValueField = "idServicio";
            cboEspecialidad.DataTextField = "Servicio";
            cboEspecialidad.DataBind();
        }
        private void traeCentroSaludID(String idCentroSalud)
        {//
            Datos sql = new Datos();
            DataTable tbl = new DataTable();

            tbl = sql.TraeDataTable("sp_TraeCentroSaludID", idCentroSalud);

            lblLatitud.Text = tbl.Rows[0]["long"].ToString();
            lblLong.Text = tbl.Rows[0]["lat"].ToString();
        }
        protected void cboCentroSalud_SelectedIndexChanged(object sender, EventArgs e)
        {
            traeCentroSaludID(cboCentroSalud.SelectedValue);
            traeEspecialidad(cboCentroSalud.SelectedValue);
        }

        protected void cboEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            traeMedicosCentroServicio(cboCentroSalud.SelectedValue, cboEspecialidad.SelectedValue);
        }
        private void traeMedicosCentroServicio(String idCentroSalud, String idServicio)
        {
            //
            Datos sql = new Datos();
            DataTable tbl = new DataTable();

            tbl = sql.TraeDataTable("sp_TraeMedicoEspecialidadCentro", idCentroSalud, idServicio);

            cboMedico.DataSource = tbl;
            cboMedico.DataValueField = "idPersona";
            cboMedico.DataTextField = "nombreC";
            cboMedico.DataBind();
        }

        protected void txtFecha_TextChanged(object sender, EventArgs e)
        {
            String fecha = txtFecha.Text;
            int dia = 0;
            
            dia = (int) Convert.ToDateTime(fecha).DayOfWeek;
            lblDia.Text = dia.ToString();

            traeHorasMedico(cboCentroSalud.SelectedValue, cboMedico.SelectedValue, dia.ToString());
        }
        private void traeHorasMedico(String idCentroSalud, String  idMedico, String idDia)
        {
            //
            Datos sql = new Datos();
            DataTable tbl = new DataTable();

            tbl = sql.TraeDataTable("sp_traeHorasMedicoCentro", idCentroSalud, idDia, idMedico);

            cboHora.DataSource = tbl;
            cboHora.DataValueField = "idHora";
            cboHora.DataTextField = "Hora";
            cboHora.DataBind();
        }
        protected void btnGuardaCita_Click(object sender, EventArgs e)
        {
            Datos sql = new Datos();
            DataTable tbl = new DataTable();

            String idPErsona = lblidPersona.Text;
            tbl = sql.TraeDataTable("sp_GuardaCita", idPErsona, cboMedico.SelectedValue, cboCentroSalud.SelectedValue, lblDia.Text, cboHora.SelectedValue, txtFecha.Text, lblidCita.Text);

            lblResultado.Text = tbl.Rows[0]["msj"].ToString();
            if (tbl.Rows[0]["estatus"].ToString() == "1")
            {

                if (tbl.Rows[0]["mail"].ToString() != "")
                {
                    Extras Ext = new Extras();

                    String para = tbl.Rows[0]["mail"].ToString();
                    String msg = "--: Cita Médica :--<br />Fecha y Hora: " + txtFecha.Text + " " + cboHora.Text + " <br />Centro de Salud: " + cboCentroSalud.Text + " <br />Especialidad o Servicio: " + cboEspecialidad.Text + "<br />Médico tratante:" + cboMedico.Text + "<br />Por favor regrese al sistema de citas e ingrese con el usuario y contraseña que registro para confirmar su cita de lo contrario se cancelara 3 hrs antes, gracias.";
                    String titulo = "--: Cita Médica :--";
                    String subject = "--: Cita Médica :--";

                    Ext.EnviaMail(para, msg, titulo, subject);
                }
            }

        }
    }
}