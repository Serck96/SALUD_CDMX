using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;
using System.Xml.Linq;

namespace SALUD_CDMX
{
    /// <summary>
    /// Summary description for Salud
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Salud : System.Web.Services.WebService
    {

        [WebMethod]
        public XmlDocument IniciaSesion(String user, String pass)
        {
            Datos sql = new Datos();
            DataTable tbl = sql.TraeDataTable("sp_IniciaSesion", user, pass);
            int cont = 0;
            String resultado = "<xml>";
            foreach (DataRow row in tbl.Rows)
            {
                resultado += "<usuario>";
                foreach (var item in row.ItemArray)
                {
                    if (cont == 0)
                    {
                        XElement result = new XElement("idRol", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }
                    else if (cont == 1)
                    {

                        XElement result = new XElement("rol", Convert.ToString(item));
                        resultado += Convert.ToString(result);

                    }
                    else if (cont == 2)
                    {

                        XElement result = new XElement("idEstatus", Convert.ToString(item));
                        resultado += Convert.ToString(result);

                    }

                    cont++;
                }
                resultado += "</usuario>";
                cont = 0;
            }
            resultado += "</xml>";
            XmlDocument xm = new XmlDocument();
            xm.LoadXml(resultado);
            return xm;
        }
        [WebMethod]
        public XmlDocument RegistraPaciente(String usuario, String pass, String nombre, String apPaterno, String apMaterno,
            String genero, String fechaNac, String curp, String nombreTutor, String apPaternoTutor, String apMaternoTutor,
            String generoTutor, String fechaNacTutor, String curpTutor, String idPer, String mail, String mailTutor)
        {
            Datos sql = new Datos();
            DataTable tbl = sql.TraeDataTable("sp_GuardaPaciente", usuario, pass, nombre, apPaterno, apMaterno,
                genero, fechaNac, curp, nombreTutor, apPaternoTutor, apMaternoTutor, generoTutor,fechaNacTutor,
                curpTutor,idPer, mail, mailTutor);
            int cont = 0;
            String resultado = "<xml>";
            foreach (DataRow row in tbl.Rows)
            {
                resultado += "<usuario>";
                foreach (var item in row.ItemArray)
                {
                    if (cont == 0)
                    {
                        XElement result = new XElement("id", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }

                    cont++;
                }
                resultado += "</usuario>";
                cont = 0;
            }
            resultado += "</xml>";
            XmlDocument xm = new XmlDocument();
            xm.LoadXml(resultado);
            return xm;
        }
        [WebMethod]
        public XmlDocument ValidaDatos(String Curp)
        {
            Datos sql = new Datos();
            DataTable tbl = sql.TraeDataTable("sp_ValidaDatos", Curp);
            int cont = 0;
            String resultado = "<xml>";
            foreach (DataRow row in tbl.Rows)
            {
                resultado += "<usuario>";
                foreach (var item in row.ItemArray)
                {
                    if (cont == 0)
                    {
                        XElement result = new XElement("id", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }
                    if (cont == 1)
                    {
                        XElement result = new XElement("nombre", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }
                    if (cont == 2)
                    {
                        XElement result = new XElement("apPaterno", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }
                    if (cont == 3)
                    {
                        XElement result = new XElement("apMaterno", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }
                    if (cont == 4)
                    {
                        XElement result = new XElement("genero", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }
                    if (cont == 5)
                    {
                        XElement result = new XElement("fechanacimiento", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }
                    if (cont == 6)
                    {
                        XElement result = new XElement("curp", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }

                    cont++;
                }
                resultado += "</usuario>";
                cont = 0;
            }
            resultado += "</xml>";
            XmlDocument xm = new XmlDocument();
            xm.LoadXml(resultado);
            return xm; 
        }
        [WebMethod]
        public void ValidaCita(String idCita, String idPersona)
        {
            Datos sql = new Datos();
            sql.Ejecutar("sp_GuardaValidacionCita", idCita, idPersona);
        }
        [WebMethod]
        public void VerificaCuentaMail(String id)
        {
            Datos sql = new Datos();
            sql.Ejecutar("sp_GuardaVerificacionEmail", id);
        }
        [WebMethod]
        public void VerificaCuentaTelefono(String curp)
        {
            Datos sql = new Datos();
            sql.Ejecutar("sp_GuardaVerificacionTelefono", curp);
        }
    }
}
