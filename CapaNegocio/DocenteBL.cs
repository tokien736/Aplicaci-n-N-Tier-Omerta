using System;
using System.Data;
using System.Data.SqlClient;
using CapaDato;
using CapaEntidad;
using CapaNegocio.Interface;

namespace CapaNegocio
{
    public class DocenteBL : IDocente
    {
        private Datos datos = new DatosSQL(); // Instancia de la capa de datos

        public string Mensaje { get; set; } // Mensaje del procedimiento almacenado

        // Método para listar docentes
        public DataTable Listar() => datos.TraerDataTable("spListarDocente");

        // Método para agregar un docente
        public bool Agregar(Docente docente)
        {
            DataRow fila = datos.TraerDataRow("spAgregarDocente", docente.CodDocente, docente.APaterno, docente.AMaterno, docente.Nombres, docente.CodUsuario, docente.Contrasena);
            Mensaje = fila["Mensaje"].ToString();
            return Convert.ToByte(fila["CodError"]) == 0;
        }

        // Método para eliminar un docente
        public bool Eliminar(string codDocente)
        {
            try
            {
                DataRow fila = datos.TraerDataRow("spEliminarDocente", codDocente);
                Mensaje = fila["Mensaje"].ToString();
                return true; // Opcionalmente, puedes devolver verdadero si el procedimiento se ejecuta sin errores.
            }
            catch (Exception ex)
            {
                Mensaje = "Error al eliminar el docente: " + ex.Message;
                return false;
            }
        }

        // Método para actualizar información de un docente
        public bool Actualizar(Docente docente)
        {
            DataRow fila = datos.TraerDataRow("spActualizarDocente", docente.CodDocente, docente.APaterno, docente.AMaterno, docente.Nombres);
            Mensaje = fila["Mensaje"].ToString();
            return fila["Mensaje"].ToString().Contains("exitosamente");
        }

        // Método para buscar docentes por apellido
        public DataTable Buscar(string APaterno) => datos.TraerDataTable("spBuscarDocentePorApellido", APaterno);

        // Método para cambiar la contraseña del docente
        public bool CambiarContrasena(string codUsuario, string contrasenaActual, string nuevaContrasena)
        {
            DataRow fila = datos.TraerDataRow("spCambiarContrasenaDocente", codUsuario, contrasenaActual, nuevaContrasena);
            Mensaje = fila["Mensaje"].ToString();
            return fila["Mensaje"].ToString().Contains("exitosamente");
        }

        // Método para obtener los cursos dictados por un docente en un semestre determinado
        public DataTable CursosDictados(string codDocente, string semestre) => datos.TraerDataTable("spCursosDictadosDocente", codDocente, semestre);

        // Método para obtener los semestres únicos
        public DataTable ObtenerSemestres() => datos.TraerDataTable("spObtenerSemestres");

        // Método para obtener CodDocente por CodUsuario
        public DataTable BuscarDocentePorUsuario(string codUsuario) => datos.TraerDataTable("spBuscarDocentePorUsuario", codUsuario);
    }
}
