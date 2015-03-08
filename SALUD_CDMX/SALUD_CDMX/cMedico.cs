using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace SALUD_CDMX
{

    public class cMedico
    {
        private String _PersonaId;
        private String _NombreMedico;
        private String _APMedico;
        private String _AMMedico;
        private String _Email;
        private String _Contacto;
        private String _Especialidad;
        private String _Facultad;
        private String _Cedula;
        private String _FecNac;
        private String _Genero;
        private String _CURP;
        private String _Hospital;
        private String _HorarioHospital;
        private String _DiasLaborables;
        private String _Lugar;
        private String _Fecha;
        private String _HoraInicio;
        private String _HoraFin;
        private String _DEstado;
        private String _DMunicipio;
        private String _DCalle;
        private String _DExterior;
        private String _DInterior;
        private String _DColonia;
        private String _DCodigoPostal;

        public cMedico()
        {

        }
       
        public String[] cMedico(String idPersonaD,String NombreD,String ApPatD,String ApMatD,String GeneroD,String FecNacD,String CURPD,String CedulaD)
        {
            this.PersonaId = idPersonaD;
            this.NombreMedico = NombreD;
            this.APMedico = ApPatD;
            this.AMMedico = ApMatD;
            this.FecNac = FecNacD;
            this.Genero = GeneroD;
            this.CURP = CURPD;
            this.Cedula = CedulaD;

            return RegistroMedico();

        }
        #region Propiedades

            public String PersonaId
            {
                get { return _PersonaId; }
                set { _PersonaId = value; }
            }
            public String NombreMedico
            {
                get { return _NombreMedico; }
                set { _NombreMedico = value; }
            }
            public String APMedico
            {
                get { return _APMedico; }
                set { _APMedico = value; }
            }
            public String AMMedico
            {
                get { return _AMMedico; }
                set { _AMMedico = value; }
            }
            public String Email
            {
                get { return _Email; }
                set { _Email = value; }
            }
            public String Contacto
            {
                get { return _Contacto; }
                set { _Contacto = value; }
            }
            public String Especialidad
            {
                get { return _Especialidad; }
                set { _Especialidad = value; }
            }
            public String Facultad
            {
                get { return _Facultad; }
                set { _Facultad = value; }
            }
            public String Cedula
            {
                get { return _Cedula; }
                set { _Cedula = value; }
            }
            public String FecNac
            {
                get { return _FecNac; }
                set { _FecNac = value; }
            }
            public String Genero
            {
                get { return _Genero; }
                set { _Cedula = value; }
            }
            public String CURP
            {
                get { return _CURP; }
                set { _CURP = value; }
            }
            public String Hospital
            {
                get { return _Hospital; }
                set { _Hospital = value; }
            }
            public String HorarioHospital
            {
                get { return _HorarioHospital; }
                set { _HorarioHospital = value; }
            }
            public String DiasLaborables
            {
                get { return _DiasLaborables; }
                set { _DiasLaborables = value; }
            }
            public String Lugar
            {
                get { return _Lugar; }
                set { _Lugar = value; }
            }

            public String Fecha
            {
                get { return _Fecha; }
                set { _Fecha = value; }
            }
            public String HoraInicio
            {
                get { return _HoraInicio; }
                set { _HoraInicio = value; }
            }
            public String HoraFin
            {
                get { return _HoraFin; }
                set { _HoraFin = value; }
            }
            public String DEstado
            {
                get { return _DEstado; }
                set { _DEstado = value; }
            }
            public String DMunicipio
            {
                get { return _DMunicipio; }
                set { _DMunicipio = value; }
            }
            public String DCalle
            {
                get { return _DCalle; }
                set { _DCalle = value; }
            }
            public String DExterior
            {
                get { return _DExterior; }
                set { _DExterior = value; }
            }
            public String DInterior
            {
                get { return _DInterior; }
                set { _DInterior = value; }
            }
            public String DColonia
            {
                get { return _DColonia; }
                set { _DColonia = value; }
            }
            public String DCodigoPostal
            {
                get { return _DCodigoPostal; }
                set { _DCodigoPostal = value; }
            }
        #endregion

        #region Metodos

          private String[] RegistroMedico()
            {
               String[] Parametros = new String[2];
               Datos sql = new Datos();

               DataTable tblRegMed = sql.TraeDataTable("sp_GuardaMedico",_PersonaId,_NombreMedico,_APMedico,_AMMedico,_Genero,_FecNac,_CURP,_Cedula);
               
                if(tblRegMed.Rows.Count>0)
                {
                    Parametros[0] = tblRegMed.Rows[0][0].ToString();
                    Parametros[1] = tblRegMed.Rows[0][1].ToString();
                }

               return Parametros;
            }

            

           
        #endregion
    }
}