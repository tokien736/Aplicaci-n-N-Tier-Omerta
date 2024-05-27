using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class frmSistemaAdministracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in when the page loads
            if (Session["TipoUsuario"] != null)
            {
                lblAdministrador.Text = "Bienvenido Admin: " + Session["CodUsuario"];
            }
            else
            {
                // Redirect to login page if the user is not logged in
                Response.Redirect("frmLogin");
            }

        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            // Remove session variables and redirect to login page
            Session.Remove("TipoUsuario");
            Session.Remove("CodUsuario");
            Response.Redirect("frmLogin");
        }

        protected void btnCrudDocente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/frmDocente.aspx");

        }

        protected void btnCrudAsignatura_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/frmAsignatura.aspx");
        }

        protected void btnCrudAlumno_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/frmAlumno.aspx");
        }
    }
}