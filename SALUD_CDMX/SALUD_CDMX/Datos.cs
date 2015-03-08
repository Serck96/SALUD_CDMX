using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SALUD_CDMX
{
    public class Datos
    {
        String _cadenaConex = "";
        SqlConnection _conectarBD = new SqlConnection();

        public Datos()
        {
            this._cadenaConex = System.Configuration.ConfigurationManager.AppSettings["cadena_conex"].ToString();
            this._conectarBD.ConnectionString = this._cadenaConex;
        }

        public Datos(String cadenaConex)
        {
            this._cadenaConex = cadenaConex;
            this._conectarBD.ConnectionString = this._cadenaConex;
        }

        public void Ejecutar(String StoredProcedure, params Object[] parametros)
        {
            SqlCommand sql = new SqlCommand(StoredProcedure + " " + cargaParametros(parametros), this._conectarBD);
            this._conectarBD.Open();
            sql.ExecuteNonQuery();

            if (this._conectarBD.State == ConnectionState.Open)
            {
                this._conectarBD.Close();
            }
        }

        public DataTable TraeDataTable(String StoredProcedure, params Object[] parametros)
        {
            DataTable tblResultado = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(StoredProcedure + cargaParametros(parametros), this._conectarBD);
            da.Fill(tblResultado);

            if (this._conectarBD.State == ConnectionState.Open)
            {
                this._conectarBD.Close();
            }

            return tblResultado;
        }
        public String dataTableAxml(DataTable tabla)
        {
            String SalidaXML = "";

            System.IO.StringWriter writer = new System.IO.StringWriter();
            tabla.WriteXml(writer, XmlWriteMode.WriteSchema, false);
            SalidaXML = writer.ToString();

            return SalidaXML;

        }

        private String cargaParametros(params Object[] parametros)
        {
            String salida = " ";

            foreach (String parametro in parametros)
            {
                salida += "'" + parametro + "',";
            }

            salida = salida.Substring(0, salida.Length - 1);
            return salida;
        }

    }
}
