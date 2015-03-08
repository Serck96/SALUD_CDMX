using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SALUD_CDMX
{
    public class Extras
    {
        public Extras()
        {
            //
            // TODO: Agregar aquí la lógica del constructor
            //
        }
        public String encriptaB64(string texto)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(texto);
            return System.Convert.ToBase64String(plainTextBytes);
        }
        public String decriptaB64(string textoEncriptado)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(textoEncriptado);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
    }
}