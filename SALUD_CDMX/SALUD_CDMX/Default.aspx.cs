using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace SALUD_CDMX
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresa_Click(object sender, EventArgs e)
        {
            wsSalud.SaludSoapClient ws = new wsSalud.SaludSoapClient();
            String usuario = Convert.ToString(ws.IniciaSesion(txtUser.Text, txtPass.Text));
            XmlDocument docX = new XmlDocument();
            docX.LoadXml(usuario);
            XmlNodeList nID, nRol, nIdEstatus, nIdPersona;
            XmlNodeList resultado = docX.GetElementsByTagName("usuario");
            if (resultado.Count >= 1)
            {
                foreach (XmlElement nodoTipos in resultado)
                {
                    int z = 0;
                    nID = nodoTipos.GetElementsByTagName("idRol");
                    nRol = nodoTipos.GetElementsByTagName("rol");
                    nIdEstatus = nodoTipos.GetElementsByTagName("idEstatus");
                    nIdPersona = nodoTipos.GetElementsByTagName("idPersona");
                    if (nID[z].InnerText == "")
                    {
                        lblError.Text = nRol[z].InnerText;
                    }
                    else
                    {
                        lblError.Text = "";
                        Session["idRol"] = nID[z].InnerText;
                        Session["Rol"] = nRol[z].InnerText;
                        if (nID[z].InnerText == "1")
                        {
                            Extras xt = new Extras();
                            
                            Response.Redirect("~/Pacientes.aspx?iP="+xt.encriptaB64(nIdPersona[z].InnerText));
                        }
                        else if (nID[z].InnerText == "2")
                        {
                            Response.Redirect("~/Doctor/index.aspx");
                        }
                        else if (nID[z].InnerText == "4")
                        {
                            Response.Redirect("~/Administrador/index.aspx");
                        }
                        

                    }
                }

            }
        }
    }
}