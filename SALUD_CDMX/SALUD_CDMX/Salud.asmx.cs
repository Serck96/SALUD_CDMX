﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
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
        public string IniciaSesion(String user, String pass)
        {
            Datos sql = new Datos();
            DataTable tbl = sql.TraeDataTable("sp_IniciaSesion", user, pass);
            int cont = 0;
            String resultado = "";
            foreach (DataRow row in tbl.Rows)
            {
                resultado += "<Usuario>";
                foreach (var item in row.ItemArray)
                {
                    if (cont == 0)
                    {
                        XElement result = new XElement("idRol", Convert.ToString(item));
                        resultado += Convert.ToString(result);
                    }
                    else if (cont == 1)
                    {

                        XElement result = new XElement("Rol", Convert.ToString(item));
                        resultado += Convert.ToString(result);

                    }

                    cont++;
                }
                resultado += "</Usuario>";
                cont = 0;
            }
            return resultado;
        }
    }
}
