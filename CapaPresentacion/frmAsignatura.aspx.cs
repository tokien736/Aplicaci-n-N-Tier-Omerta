using System;
using System.Data;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmAsignatura : System.Web.UI.Page
    {
        private AsignaturaBL asignaturaBL = new AsignaturaBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (VerificarCodRequisito(txtCodRequisito.Text.Trim()))
            {
                bool resultado = asignaturaBL.AgregarAsignatura(txtCodAsignatura.Text.Trim(), txtNombre.Text.Trim(), txtCodRequisito.Text.Trim());
                lblMensaje.Text = asignaturaBL.Mensaje;
                if (resultado)
                {
                    Listar();
                    LimpiarFormulario();
                }
            }
            else
            {
                lblMensaje.Text = "El código de requisito no existe.";
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            bool resultado = asignaturaBL.EliminarAsignatura(txtCodAsignatura.Text.Trim());
            lblMensaje.Text = asignaturaBL.Mensaje;
            if (resultado)
            {
                Listar();
                LimpiarFormulario();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (VerificarCodRequisito(txtCodRequisito.Text.Trim()))
            {
                bool resultado = asignaturaBL.ActualizarAsignatura(txtCodAsignatura.Text.Trim(), txtNombre.Text.Trim(), txtCodRequisito.Text.Trim());
                lblMensaje.Text = asignaturaBL.Mensaje;
                if (resultado)
                {
                    Listar();
                    LimpiarFormulario();
                }
            }
            else
            {
                lblMensaje.Text = "El código de requisito no existe.";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable resultadoBusqueda = asignaturaBL.BuscarAsignatura(txtNombreBuscar.Text.Trim());
            if (resultadoBusqueda != null && resultadoBusqueda.Rows.Count > 0)
            {
                gvAsignaturas.DataSource = resultadoBusqueda;
                gvAsignaturas.DataBind();
                lblMensaje.Text = "";
            }
            else
            {
                lblMensaje.Text = "No se encontraron asignaturas con el nombre proporcionado.";
                gvAsignaturas.DataSource = null;
                gvAsignaturas.DataBind();
            }
        }

        protected void btnVerTodas_Click(object sender, EventArgs e)
        {
            Listar();
            lblMensaje.Text = "";
        }

        protected void gvAsignaturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvAsignaturas.SelectedRow != null)
            {
                GridViewRow row = gvAsignaturas.SelectedRow;
                txtCodAsignatura.Text = row.Cells[1].Text;
                txtNombre.Text = row.Cells[2].Text;
                txtCodRequisito.Text = row.Cells[3].Text;

                btnActualizar.Visible = true;
                txtCodAsignatura.Enabled = false;
            }
        }

        private void Listar()
        {
            gvAsignaturas.DataSource = asignaturaBL.ListarAsignaturas();
            gvAsignaturas.DataBind();
            btnActualizar.Visible = false;
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtCodAsignatura.Text = "";
            txtNombre.Text = "";
            txtCodRequisito.Text = "";
            txtCodAsignatura.Enabled = true;
        }

        private bool VerificarCodRequisito(string codRequisito)
        {
            DataTable dt = asignaturaBL.ObtenerAsignaturaPorCodigo(codRequisito);
            return dt != null && dt.Rows.Count > 0;
        }
    }
}
