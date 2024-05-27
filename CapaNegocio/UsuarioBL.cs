using System;
using System.Data;
using System.Data.SqlClient;
using CapaDato;
using CapaEntidad;
using CapaNegocio.Interface;

namespace CapaNegocio
{
    public class UsuarioBL: Interface.IUsuario
    {
        private Datos datos = new DatosSQL();
        public string Mensaje { get; set; }

        public bool Login(Usuario usuario)
        {
            DataRow fila = datos.TraerDataRow("spLogin", usuario.CodUsuario, usuario.Contrasena);
            byte i = Convert.ToByte(fila["CodError"]);
            Mensaje = fila["Mensaje"].ToString();
            if (i == 0) return true;
            else return false;
        }
    }
}
