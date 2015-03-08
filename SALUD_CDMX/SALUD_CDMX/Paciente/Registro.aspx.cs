using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace SALUD_CDMX.Paciente
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtCURP_TextChanged(object sender, EventArgs e)
        {
            wsSalud.SaludSoapClient ws = new wsSalud.SaludSoapClient();
            String datos = Convert.ToString(ws.ValidaDatos(txtCURP.Text));
            XmlDocument docX = new XmlDocument();
            docX.LoadXml(datos);
            XmlNodeList nID, nNombre, nApPaterno, nApMaterno, nGenero, nFecha;
            XmlNodeList resultado = docX.GetElementsByTagName("usuario");
            if (resultado.Count >= 1)
            {
                foreach (XmlElement nodoTipos in resultado)
                {
                    int z = 0;
                    nID = nodoTipos.GetElementsByTagName("id");
                    nNombre = nodoTipos.GetElementsByTagName("nombre");
                    nApPaterno = nodoTipos.GetElementsByTagName("apPaterno");
                    nApMaterno = nodoTipos.GetElementsByTagName("apMaterno");
                    nGenero = nodoTipos.GetElementsByTagName("genero");
                    nFecha = nodoTipos.GetElementsByTagName("fechanacimiento");
                    Session["id"] = nID[z].InnerText;
                }
            }

        }

        protected void textFecha_TextChanged(object sender, EventArgs e)
        {
            if (textFecha.Text != "")
            {
                DateTime fecha1 = Convert.ToDateTime(textFecha.Text);
                DateTime fecha2 = Convert.ToDateTime(DateTime.Today);

                TimeSpan dias;
                dias = fecha2.Subtract(fecha1);
                int años = dias.Days / 365;
                if (años < 18)
                {
                    pnTutor.Visible = true;
                }
                else 
                {
                    pnTutor.Visible = false;
                }
            }
        }

        protected void btnGuardaPaciente_Click(object sender, EventArgs e)
        {
            if(Session["id"] != null)
            { 
            wsSalud.SaludSoapClient ws = new wsSalud.SaludSoapClient();
            String id = Convert.ToString(ws.RegistraPaciente(txtUser.Text, txtContraseña.Text, txtNombre.Text, txtApPaterno.Text, txtApMAterno.Text, rlGenero.SelectedValue,
                textFecha.Text, txtCURP.Text, txtNombreTutor.Text, txtApPaternoTutor.Text, txtApMaternoTutor.Text, rlGeneroTutor.SelectedValue,
                txtFechaTutor.Text, txtCUrpTutor.Text, Convert.ToString(Session["id"])));
            Response.Redirect("~/GeneraCita.aspx?iP=" + id + "");
            }
            else
            {
                wsSalud.SaludSoapClient ws = new wsSalud.SaludSoapClient();
                String id = Convert.ToString(ws.RegistraPaciente(txtUser.Text, txtContraseña.Text, txtNombre.Text, txtApPaterno.Text, txtApMAterno.Text, rlGenero.SelectedValue,
                    textFecha.Text, txtCURP.Text, txtNombreTutor.Text, txtApPaternoTutor.Text, txtApMaternoTutor.Text, rlGeneroTutor.SelectedValue,
                    txtFechaTutor.Text, txtCUrpTutor.Text, ""));
                XmlDocument docX = new XmlDocument();
                docX.LoadXml(id);
                XmlNodeList nID, nNombre, nApPaterno, nApMaterno, nGenero, nFecha;
                XmlNodeList resultado = docX.GetElementsByTagName("usuario");
                if (resultado.Count >= 1)
                {
                    foreach (XmlElement nodoTipos in resultado)
                    {
                        int z = 0;
                        nID = nodoTipos.GetElementsByTagName("id");
                        id = nID[z].InnerText;
                    }
                }
                Response.Redirect("~/GeneraCita.aspx?iP=" + id + "");
            }
        }
    }
}
