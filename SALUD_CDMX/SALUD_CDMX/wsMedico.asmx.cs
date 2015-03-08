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
    /// Summary description for wsMedico
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class wsMedico : System.Web.Services.WebService
    {
         [WebMethod]
        public XmlDocument RegistroMedico(String idPersonaD, String NombreD, String ApPatD, String ApMatD, String GeneroD, String FecNacD, String CURPD, String CedulaD)
        {
            cMedicos obj = new cMedicos(idPersonaD,NombreD,ApPatD, ApMatD,GeneroD,FecNacD, CURPD,CedulaD);
            String resultado = "<xml>";
            string[] Var = obj.RegistroMedico();
            resultado += "<mensaje>" + Var[0].ToString() + "</mensaje>";
            resultado += "<idpersona>" + Var[1].ToString() + "</idpersona>";
            resultado += "</xml>";
            XmlDocument xm = new XmlDocument();
            xm.LoadXml(resultado);
            return xm;
        }
        [WebMethod]
         public XmlDocument RegistroContacto(String idDatos, String idPersona, String idTipoContacto, String Contacto)
         {
             cMedicos obj = new cMedicos(idDatos,idPersona,idTipoContacto,Contacto);
             String resultado = "<xml>";
             DataTable tblContactos = new DataTable();
             tblContactos = obj.Contactos();
             
             foreach(DataRow dr in tblContactos.Rows)
             {
                 resultado += "<fila>";
                    foreach(DataColumn dc in tblContactos.Columns)
                    {
                        resultado += "<col>"+dr[dc]+"</col>";
                    }
                 resultado += "</fila>";
             }
             resultado += "</xml>";
             XmlDocument xm = new XmlDocument();
             xm.LoadXml(resultado);
             return xm;
         }
        [WebMethod]
        public XmlDocument RegistroDireccion(String idDireccion, String idPersona, String idEstado, String idMunicipio, String Calle, String NE, String NI, String Colonia, String CP)
        {
            cMedicos obj = new cMedicos(idDireccion,idPersona, idEstado,idMunicipio,Calle,NE,NI,Colonia,CP);
            String resultado = "<xml>";
            DataTable tblDireccion = new DataTable();
            tblDireccion = obj.Direccion();

            foreach (DataRow dr in tblDireccion.Rows)
            {
                resultado += "<fila>";
                foreach (DataColumn dc in tblDireccion.Columns)
                {
                    resultado += "<col>" + dr[dc] + "</col>";
                }
                resultado += "</fila>";
            }
            resultado += "</xml>";
            XmlDocument xm = new XmlDocument();
            xm.LoadXml(resultado);
            return xm;
        }
        [WebMethod]
        public XmlDocument TraerValores(String Actividad,String Identificador)
        {
            Datos sql = new Datos();
            String resultado = "<xml>";
            DataTable tblInformacion = new DataTable();
            tblInformacion = sql.TraeDataTable("sp_MuestraInformaciòn",Actividad,Identificador);

            foreach (DataRow dr in tblInformacion.Rows)
            {
                resultado += "<fila>";
                foreach (DataColumn dc in tblInformacion.Columns)
                {
                    resultado += "<col>" + dr[dc] + "</col>";
                }
                resultado += "</fila>";
            }
            resultado += "</xml>";
            XmlDocument xm = new XmlDocument();
            xm.LoadXml(resultado);
            return xm;
        }
        [WebMethod]
        public XmlDocument MuestraInformacion(String Actividad, String Identificador, String Identificador2)
        {
            Datos sql = new Datos();
            String resultado = "<xml>";
            DataTable tblInformacion = new DataTable();
            tblInformacion = sql.TraeDataTable("sp_TraeInformaciòn", Actividad, Identificador,Identificador2);

            foreach (DataRow dr in tblInformacion.Rows)
            {
                resultado += "<fila>";
                foreach (DataColumn dc in tblInformacion.Columns)
                {
                    resultado += "<col>" + dr[dc] + "</col>";
                }
                resultado += "</fila>";
            }
            resultado += "</xml>";
            XmlDocument xm = new XmlDocument();
            xm.LoadXml(resultado);
            return xm;
        }
        [WebMethod]
        public XmlDocument GuardaInformacion(String Actividad,String Persona ,String Centro ,String Horario ,  String Servicio)
        {
            Datos sql = new Datos();
            String resultado = "<xml>";
            DataTable tblInformacion = new DataTable();
            sql.Ejecutar("sp_GuardaInformaciòn", Actividad, Persona, Centro, Horario, Servicio);
            
            resultado += "Informacion Guardada con Exito</xml>";
            XmlDocument xm = new XmlDocument();
            xm.LoadXml(resultado);
            return xm;
        } 
    
    }
}
