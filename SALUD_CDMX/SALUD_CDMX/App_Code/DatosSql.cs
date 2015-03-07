using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Descripción breve de Datos
/// </summary>
public class DatosSql
{
    #region "Declaración de Variables"
    protected string mServidor = "";
    protected string mBase = "";
    protected string mCadenaConexion = "";
    protected SqlConnection mConexion;
    #endregion
    #region "Constructores"
    public DatosSql()
    {
        this.CadenaConexion = ConfigurationManager.AppSettings.Get("CADENA_CONEXION_SQL");
    }
    #endregion

    #region "Propiedades"
    public string Servidor
    {
        get
        {
            return mServidor;
        }
        set
        {
            mServidor = value;
        }
    }
    public string Base
    {
        get
        {
            return mBase;
        }
        set
        {
            mBase = value;
        }
    }
    public string CadenaConexion
    {
        get
        {
            if (this.mCadenaConexion.Length == 0)
            {
                if (this.mBase.Length != 0 && this.mServidor.Length != 0)
                {
                    System.Text.StringBuilder sCadena = new System.Text.StringBuilder("");
                    sCadena.Append("data source=<SERVIDOR>;");
                    sCadena.Append("initial catalog=<BASE>;password='sa';");
                    sCadena.Append("persist security info=True;");
                    sCadena.Append("user id=sa;packet size=4096");
                    sCadena.Replace("<SERVIDOR>", this.Servidor);
                    sCadena.Replace("<BASE>", this.Base);
                    return sCadena.ToString();
                }
                else
                {
                    System.Exception Ex = new System.Exception("No se puede establecer la cadena de conexión");
                    throw Ex;
                }
            }
            else
                return this.mCadenaConexion;
        }
        set
        {
            this.mCadenaConexion = value;
        }
    }

    #endregion
    #region "Privadas"
    protected SqlConnection Conexion
    {
        get
        {
            if (null == mConexion)
            {
                mConexion = CrearConexion(this.CadenaConexion);
            }
            if (mConexion.State != ConnectionState.Open)
                mConexion.Open();
            return mConexion;
        }
    }
    public void CerrarConexion()
    {
        if (mConexion.State != ConnectionState.Closed)
            mConexion.Close();
    }
    #endregion
    #region "Lecturas"
    public DataSet TraerDataset(string ProcedimientoAlmacenado)
    {
        DataSet mDataSet = new DataSet();
        this.CrearDataAdapter(ProcedimientoAlmacenado).Fill(mDataSet);
        return mDataSet;

    }
    /*dataset tare filas columnas de la tabla*/
    public DataSet TraerDataset(string ProcedimientoAlmacenado, params System.Object[] Args)
    {
        DataSet mDataSet = new DataSet();
        this.CrearDataAdapter(ProcedimientoAlmacenado, Args).Fill(mDataSet);
        return mDataSet;
    }

    public DataTable TraerDataTable(string ProcedimientoAlmacenado)
    {
        return TraerDataset(ProcedimientoAlmacenado).Tables[0].Copy();
    }
    public DataTable TraerDataTable(string ProcedimientoAlmacenado, params System.Object[] Args)
    {
        return TraerDataset(ProcedimientoAlmacenado, Args).Tables[0].Copy();
    }


    public System.Object TraerValor(string ProcedimientoAlmacenado)
    {
        SqlCommand Com = Comando(ProcedimientoAlmacenado);
        Com.ExecuteNonQuery();
        System.Object Resp = null;
        foreach (SqlParameter Par in Com.Parameters)
            if (Par.Direction == ParameterDirection.InputOutput || Par.Direction == ParameterDirection.Output)
                Resp = Par.Value;
        return Resp;
    }
    public System.Object TraerValor(string ProcedimientoAlmacenado, params System.Object[] Args)
    {
        SqlCommand Com = Comando(ProcedimientoAlmacenado);
        CargarParametros(Com, Args);
        Com.ExecuteNonQuery();
        System.Object Resp = null;
        foreach (SqlParameter Par in Com.Parameters)
            if (Par.Direction == ParameterDirection.InputOutput || Par.Direction == ParameterDirection.Output)
                Resp = Par.Value;
        return Resp;
    }

    public System.Object TraerValorRetornado(string ProcedimientoAlmacenado)
    {
        IDbCommand Com = Comando(ProcedimientoAlmacenado);
        Com.ExecuteNonQuery();
        System.Object Resp = null;
        foreach (SqlParameter Par in Com.Parameters)
        {
            //if (Par.Direction == ParameterDirection.InputOutput || Par.Direction == ParameterDirection.Output)
            Resp = Par.Value;
            break;
        }
        return Resp;
    }
    public System.Object TraerValorRetornado(string ProcedimientoAlmacenado, params System.Object[] Args)
    {
        SqlCommand Com = Comando(ProcedimientoAlmacenado);
        CargarParametros(Com, Args);
        Com.ExecuteNonQuery();
        System.Object Resp = null;
        foreach (SqlParameter Par in Com.Parameters)
        {
            //if (Par.Direction == ParameterDirection.InputOutput || Par.Direction == ParameterDirection.Output)
            Resp = Par.Value;
            break;
        }
        return Resp;
    }


    #endregion
    #region "Acciones"
    protected SqlConnection CrearConexion(string CadenaConexion)
    {
        return new SqlConnection(CadenaConexion);
    }

    public static System.Collections.Hashtable ColComandos = new System.Collections.Hashtable();
    protected SqlCommand Comando(string ProcedimientoAlmacenado)
    {
        SqlCommand Com;
        if (ColComandos.Contains(ProcedimientoAlmacenado))
            Com = (SqlCommand)ColComandos[ProcedimientoAlmacenado];
        else
        {
            SqlConnection Con2 = new SqlConnection(this.CadenaConexion);
            Con2.Open();
            Com = new SqlCommand(ProcedimientoAlmacenado, Con2);
            Com.CommandType = CommandType.StoredProcedure;
            SqlCommandBuilder.DeriveParameters(Com);
            Con2.Close();
            Con2.Dispose();
            ColComandos.Add(ProcedimientoAlmacenado, Com);

        }
        Com.Connection = this.Conexion;
        Com.Transaction = this.mTransaccion;
        return Com;
    }

    protected SqlDataAdapter CrearDataAdapter(string ProcedimientoAlmacenado, params System.Object[] Args)
    {
        SqlDataAdapter Da =
            new SqlDataAdapter(Comando(ProcedimientoAlmacenado));
        if (Args.Length != 0)
            CargarParametros(Da.SelectCommand, Args);
        return Da;
    }

    protected void CargarParametros(SqlCommand Com, System.Object[] Args)
    {
        int Limite = Com.Parameters.Count;
        for (int i = 1; i < Com.Parameters.Count; i++)
        {
            SqlParameter P = Com.Parameters[i];
            if (i <= Args.Length)
                P.Value = Args[i - 1];
            else
                P.Value = null;
        }
    }
    public int Ejecutar(string ProcedimientoAlmacenado)
    {
        return Comando(ProcedimientoAlmacenado).ExecuteNonQuery();
    }
    public int Ejecutar(string ProcedimientoAlmacenado, params  System.Object[] Args)
    {
        SqlCommand Com = Comando(ProcedimientoAlmacenado);
        CargarParametros(Com, Args);
        int Resp = Com.ExecuteNonQuery();
        for (int i = 0; i < Com.Parameters.Count; i++)
        {
            SqlParameter Par = Com.Parameters[i];
            if (Par.Direction == ParameterDirection.InputOutput || Par.Direction == ParameterDirection.Output)
                Args.SetValue(Par.Value, i - 1);
        }

        return Resp;
    }

    #endregion
    #region "Transacciones"
    protected SqlTransaction mTransaccion;
    protected bool EnTransaccion = false;
    public void IniciarTransaccion()
    {
        mTransaccion = this.Conexion.BeginTransaction();
        EnTransaccion = true;
    }
    public void TerminarTransaccion()
    {
        try
        {
            mTransaccion.Commit();
        }
        catch (System.Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            mTransaccion = null;
            EnTransaccion = false;
        }
    }
    public void AbortarTransaccion()
    {
        try
        {
            mTransaccion.Rollback();
        }
        catch (System.Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            mTransaccion = null;
            EnTransaccion = false;
        }
    }

    #endregion
}
