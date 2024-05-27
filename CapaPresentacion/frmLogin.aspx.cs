using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Usuario usuario = new Usuario
            {
                CodUsuario = Login1.UserName,  // Asegúrate de usar CodUsuario
                Contrasena = Login1.Password
            };

            UsuarioBL usuarioBL = new UsuarioBL();
            if (usuarioBL.Login(usuario))
            {
                // Verificar el tipo de usuario y redirigir en consecuencia
                Session["TipoUsuario"] = usuarioBL.Mensaje;
                Session["CodUsuario"] = usuario.CodUsuario;  // Usa usuario.CodUsuario

                switch (usuarioBL.Mensaje)
                {
                    case "Alumno":
                        Response.Redirect("frmSistemaAlumno.aspx");
                        break;
                    case "Docente":
                        Response.Redirect("frmSistemaDocente.aspx");
                        break;
                    case "Administrador":
                        Response.Redirect("frmSistemaAdministracion.aspx");
                        break;
                    default:
                        Login1.FailureText = "Tipo de usuario no reconocido. Consulte al administrador.";
                        break;
                }
            }
            else
            {
                Login1.FailureText = usuarioBL.Mensaje;
            }
        }
    }
}
