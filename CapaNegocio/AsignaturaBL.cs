using CapaDato;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaNegocio;
using CapaNegocio.Interface;

namespace CapaNegocio
{
    public class AsignaturaBL : IAsignatura
    {
        //Llamar a la CapaDato
        private Datos datos = new DatosSQL();

        // Mensaje del procedimiento almacenado
        public string Mensaje { get; set; }

        public bool ActualizarAsignatura(string codAsignatura, string nuevoNombre, string nuevoCodRequisito)
        {
            try
            {
                DataTable dt = datos.TraerDataTable("sp_ActualizarAsignatura", codAsignatura, nuevoNombre, nuevoCodRequisito);
                if (dt.Rows.Count > 0)
                {
                    Mensaje = dt.Rows[0]["Mensaje"].ToString();
                    return Convert.ToInt32(dt.Rows[0]["CodError"]) == 0;
                }
                return false;
            }
            catch (Exception ex)
            {
                Mensaje = ex.Message;
                return false;
            }
        }

        public bool AgregarAsignatura(string codAsignatura, string nombre, string codRequisito)
        {
            try
            {
                DataTable dt = datos.TraerDataTable("sp_InsertarAsignatura", codAsignatura, nombre, codRequisito);
                if (dt.Rows.Count > 0)
                {
                    Mensaje = dt.Rows[0]["Mensaje"].ToString();
                    return Convert.ToInt32(dt.Rows[0]["CodError"]) == 0;
                }
                return false;
            }
            catch (Exception ex)
            {
                Mensaje = ex.Message;
                return false;
            }
        }

        public DataTable BuscarAsignatura(string nombre)
        {
            try
            {
                return datos.TraerDataTable("sp_BuscarAsignatura", nombre);
            }
            catch (Exception ex)
            {
                Mensaje = ex.Message;
                return null;
            }
        }

        public bool EliminarAsignatura(string codAsignatura)
        {
            try
            {
                DataTable dt = datos.TraerDataTable("sp_EliminarAsignatura", codAsignatura);
                if (dt.Rows.Count > 0)
                {
                    Mensaje = dt.Rows[0]["Mensaje"].ToString();
                    return Convert.ToInt32(dt.Rows[0]["CodError"]) == 0;
                }
                return false;
            }
            catch (Exception ex)
            {
                Mensaje = ex.Message;
                return false;
            }
        }

        public DataTable ListarAsignaturas()
        {
            try
            {
                return datos.TraerDataTable("sp_ListarAsignatura");
            }
            catch (Exception ex)
            {
                Mensaje = ex.Message;
                return null;
            }
        }

        public DataTable ObtenerAsignaturaPorCodigo(string codAsignatura)
        {
            try
            {
                return datos.TraerDataTable("sp_ObtenerAsignaturaPorCodigo", codAsignatura);
            }
            catch (Exception ex)
            {
                Mensaje = ex.Message;
                return null;
            }
        }
    }
}
