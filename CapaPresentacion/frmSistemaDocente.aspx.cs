using System;
using System.Data;
using System.Web.UI;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmSistemaDocente : System.Web.UI.Page
    {
        DocenteBL docenteBL = new DocenteBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in when the page loads
                if (Session["TipoUsuario"] != null)
                {
                    lblDocente.Text = "Bienvenido Docente: " + Session["CodUsuario"];
                    LlenarSemestres();
                }
                else
                {
                    // Redirect to login page if the user is not logged in
                    Response.Redirect("frmLogin.aspx");
                }
            }
        }

        private void LlenarSemestres()
        {
            try
            {
                DataTable dtSemestres = docenteBL.ObtenerSemestres();
                ddlSemestres.DataSource = dtSemestres;
                ddlSemestres.DataTextField = "Semestre";
                ddlSemestres.DataValueField = "Semestre";
                ddlSemestres.DataBind();
            }
            catch (Exception ex)
            {
                // Mostrar mensaje de error
                lblDocente.Text = "Error al cargar semestres: " + ex.Message;
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            // Remove session variables and redirect to login page
            Session.Remove("TipoUsuario");
            Session.Remove("CodUsuario");
            Response.Redirect("frmLogin.aspx");
        }

        protected void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            string codUsuario = Session["CodUsuario"].ToString();
            string contrasenaActual = txtContrasenaActual.Text;
            string nuevaContrasena = txtNuevaContrasena.Text;

            bool resultado = docenteBL.CambiarContrasena(codUsuario, contrasenaActual, nuevaContrasena);
            lblMensajeContrasena.Text = docenteBL.Mensaje;
        }

        protected void btnVerCursos_Click(object sender, EventArgs e)
        {
            try
            {
                string codUsuario = Session["CodUsuario"].ToString();
                string semestre = ddlSemestres.SelectedValue;

                // Depuración: verifica los valores
                lblDocente.Text = $"Verificando cursos para CodUsuario: {codUsuario} en el semestre: {semestre}";

                // Obtén el CodDocente correspondiente al CodUsuario
                DataTable dtDocente = docenteBL.BuscarDocentePorUsuario(codUsuario);
                if (dtDocente.Rows.Count > 0)
                {
                    string codDocente = dtDocente.Rows[0]["CodDocente"].ToString();

                    DataTable dtCursos = docenteBL.CursosDictados(codDocente, semestre);
                    if (dtCursos.Rows.Count > 0)
                    {
                        gvCursos.DataSource = dtCursos;
                        gvCursos.DataBind();
                    }
                    else
                    {
                        gvCursos.DataSource = null;
                        gvCursos.DataBind();  // Para limpiar el GridView
                        lblDocente.Text = "No se encontraron cursos para el docente en el semestre seleccionado.";
                    }
                }
                else
                {
                    gvCursos.DataSource = null;
                    gvCursos.DataBind();  // Para limpiar el GridView
                    lblDocente.Text = "No se encontró el código del docente correspondiente al usuario.";
                }
            }
            catch (Exception ex)
            {
                gvCursos.DataSource = null;
                gvCursos.DataBind();  // Para limpiar el GridView en caso de error
                lblDocente.Text = "Error al cargar cursos: " + ex.Message;
            }
        }
    }
}
