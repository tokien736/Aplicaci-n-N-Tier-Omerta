using CapaEntidad;
using CapaNegocio;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class frmSistemaAlumno : System.Web.UI.Page
    {
        AlumnoBL alumnoBL = new AlumnoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar si el usuario está logueado al cargar la página
                if (Session["TipoUsuario"] != null && Session["CodUsuario"] != null)
                {
                    string codUsuario = Session["CodUsuario"].ToString();
                    lblAlumno.Text = "Bienvenido Alumno: " + codUsuario;

                    // Obtener el código del alumno usando el codUsuario de la sesión
                    string codAlumno = ObtenerCodAlumnoPorUsuario(codUsuario);

                    if (!string.IsNullOrEmpty(codAlumno))
                    {
                        CargarDatosAlumno(codAlumno);
                    }
                    else
                    {
                        lblAlumno.Text = "Alumno no encontrado.";
                    }
                }
                else
                {
                    // Redirigir a la página de inicio de sesión si el usuario no está logueado
                    Response.Redirect("frmLogin.aspx");
                }
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            // Eliminar variables de sesión y redirigir a la página de inicio de sesión
            Session.Remove("TipoUsuario");
            Session.Remove("CodUsuario");
            Response.Redirect("frmLogin.aspx");
        }

        private string ObtenerCodAlumnoPorUsuario(string codUsuario)
        {
            DataTable dt = alumnoBL.ObtenerAlumnoPorUsuario(codUsuario);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0]["CodAlumno"].ToString();
            }
            return null;
        }

        private void CargarDatosAlumno(string codAlumno)
        {
            // Obtener el alumno basado en el codAlumno
            Alumno alumno = alumnoBL.ObtenerAlumnoPorCodigo(codAlumno);
            if (alumno != null)
            {
                lblAlumno.Text = $"Hola, {alumno.Nombres} {alumno.APaterno} {alumno.AMaterno}";
                CargarCursosMatriculados(alumno.CodAlumno);
                CargarSemestres(alumno.CodAlumno);
                CargarHistoricoNotas(alumno.CodAlumno);
            }
            else
            {
                lblAlumno.Text = "Alumno no encontrado.";
            }
        }

        private void CargarCursosMatriculados(string codAlumno)
        {
            DataTable dtCursos = alumnoBL.ObtenerCursosMatriculados(codAlumno);
            gvCursosMatriculados.DataSource = dtCursos;
            gvCursosMatriculados.DataBind();
        }

        private void CargarSemestres(string codAlumno)
        {
            DataTable dtSemestres = alumnoBL.ObtenerSemestres(codAlumno);
            ddlSemestres.DataSource = dtSemestres;
            ddlSemestres.DataTextField = "Semestre";
            ddlSemestres.DataValueField = "Semestre";
            ddlSemestres.DataBind();
        }

        private void CargarNotasPorSemestre(string codAlumno, string semestre)
        {
            DataTable dtNotas = alumnoBL.ObtenerNotasPorSemestre(codAlumno, semestre);
            gvNotasSemestre.DataSource = dtNotas;
            gvNotasSemestre.DataBind();
        }

        private void CargarHistoricoNotas(string codAlumno)
        {
            DataTable dtHistorico = alumnoBL.ObtenerHistoricoNotas(codAlumno);
            gvHistoricoNotas.DataSource = dtHistorico;
            gvHistoricoNotas.DataBind();
        }

        protected void ddlSemestres_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["CodUsuario"] != null)
            {
                string codUsuario = Session["CodUsuario"].ToString();
                string codAlumno = ObtenerCodAlumnoPorUsuario(codUsuario);
                if (!string.IsNullOrEmpty(codAlumno))
                {
                    string semestre = ddlSemestres.SelectedValue;
                    CargarNotasPorSemestre(codAlumno, semestre);
                }
            }
        }
    }
}
