using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

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
        public bool EnviaMail(String para, String msg, String titulo, String Subject)
        {
            bool salida = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;
            //smtp.Timeout = 50;
            smtp.Host = "smtp.momentum-ti.com";
            smtp.EnableSsl = false;
            smtp.Credentials = new System.Net.NetworkCredential("mailer@momentum-ti.com", "abcd1234");

            MailAddress from = new MailAddress("citasSEDESA@labcd.mx", titulo);

            using (MailMessage mensaje = new MailMessage())
            {
                mensaje.From = from;
                mensaje.Subject = Subject;
                mensaje.Body = msg;
                mensaje.IsBodyHtml = true;
                mensaje.Priority = MailPriority.Normal;
                mensaje.To.Add(para);

                try
                {
                    smtp.Send(mensaje);
                    salida = true;
                }
                catch
                {
                    salida = false;
                }
                return salida;
            }
        }

    }
}