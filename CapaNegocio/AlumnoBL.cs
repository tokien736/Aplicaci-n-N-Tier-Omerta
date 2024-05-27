using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDato;
using CapaEntidad;

namespace CapaNegocio
{
    public class AlumnoBL : Interface.IAlumno
    {
        //Llamar  a la CapaDato
        private Datos datos = new DatosSQL();

        //MEnsaje del procedmiento almacenado
        public string Mensaje { get; set; }

        public DataTable Listar()
        {
            return datos.TraerDataTable("spListarAlumno");
        }

        public bool Agregar(Alumno alumno)
        {
            DataRow fila = datos.TraerDataRow("spAgregarAlumno", alumno.CodAlumno, alumno.APaterno, alumno.AMaterno, alumno.Nombres, alumno.CodUsuario, alumno.Contrasena, alumno.CodEscuela);
            // Traer el mensaje del procedimiento almacenado para llevar al formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Eliminar(string codAlumno)
        {
            DataRow fila = datos.TraerDataRow("spEliminarAlumno", codAlumno);
            // Traer el mensaje del procedimiento almacenado para llevar al formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }


        public bool Actualizar(Alumno alumno)
        {
            DataRow fila = datos.TraerDataRow("spActualizarAlumno", alumno.CodAlumno, alumno.APaterno, alumno.AMaterno, alumno.Nombres, alumno.CodEscuela);
            // Traer el mensaje del procedimiento almacenado para llevar al formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public DataTable Buscar(string APaterno)
        {
            return datos.TraerDataTable("spBuscarAlumnoPorApellido", APaterno);
        }

        public DataTable ObtenerAlumnoPorUsuario(string codUsuario)
        {
            return datos.TraerDataTable("spObtenerCodAlumnoPorUsuario", codUsuario);
        }

        public Alumno ObtenerAlumnoPorCodigo(string codAlumno)
        {
            DataTable dt = datos.TraerDataTable("spObtenerAlumnoPorCodigo", codAlumno);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                Alumno alumno = new Alumno
                {
                    CodAlumno = row["CodAlumno"].ToString(),
                    APaterno = row["APaterno"].ToString(),
                    AMaterno = row["AMaterno"].ToString(),
                    Nombres = row["Nombres"].ToString(),
                    CodUsuario = row["CodUsuario"].ToString(),
                    CodEscuela = row["CodEscuela"].ToString()
                };
                return alumno;
            }
            return null;
        }

        public DataTable ObtenerCursosMatriculados(string codAlumno)
        {
            return datos.TraerDataTable("spCursosMatriculadosAlumno", codAlumno);
        }

        public DataTable ObtenerSemestres(string codAlumno)
        {
            return datos.TraerDataTable("spObtenerSemestresAlumno", codAlumno);
        }

        public DataTable ObtenerNotasPorSemestre(string codAlumno, string semestre)
        {
            return datos.TraerDataTable("spNotasPorSemestreAlumno", codAlumno, semestre);
        }

        public DataTable ObtenerHistoricoNotas(string codAlumno)
        {
            return datos.TraerDataTable("spHistorialNotasAlumno", codAlumno);
        }
        public DataTable ObtenerSemestres() => datos.TraerDataTable("spObtenerSemestres");


    }
}
