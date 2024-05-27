using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio.Interface
{
    interface IAsignatura
    {
        DataTable ListarAsignaturas();
        bool AgregarAsignatura(string codAsignatura, string nombre, string codRequisito);
        bool ActualizarAsignatura(string codAsignatura, string nuevoNombre, string nuevoCodRequisito);
        bool EliminarAsignatura(string codAsignatura);
        DataTable BuscarAsignatura(string nombre);
        DataTable ObtenerAsignaturaPorCodigo(string codAsignatura);

    }
}
