<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSistemaDocente.aspx.cs" Inherits="CapaPresentacion.frmSistemaDocente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h1 class="text-center">Bienvenido Docente al sistema</h1>

        <div class="text-center mt-4">
            <asp:Label ID="lblDocente" runat="server" CssClass="form-label d-block"></asp:Label>
            <asp:Button runat="server" ID="btnCerrar" Text="Cerrar sesión" OnClick="btnCerrar_Click" CssClass="btn btn-danger" />
        </div>

        <div class="mt-5">
            <h2>Cambiar Contraseña</h2>
            <div class="form-group">
                <asp:Label ID="lblContrasenaActual" runat="server" Text="Contraseña Actual:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtContrasenaActual" runat="server" TextMode="Password" CssClass="form-control" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblNuevaContrasena" runat="server" Text="Nueva Contraseña:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtNuevaContrasena" runat="server" TextMode="Password" CssClass="form-control" />
            </div>
            <asp:Button ID="btnCambiarContrasena" runat="server" Text="Cambiar Contraseña" OnClick="btnCambiarContrasena_Click" CssClass="btn btn-primary mt-2" />
            <asp:Label ID="lblMensajeContrasena" runat="server" Text="" CssClass="form-text text-danger mt-2 d-block"></asp:Label>
        </div>

        <div class="mt-5">
            <h2>Cursos Dictados</h2>
            <div class="form-group">
                <asp:Label ID="lblSemestre" runat="server" Text="Semestre:" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlSemestres" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <asp:Button ID="btnVerCursos" runat="server" Text="Ver Cursos" OnClick="btnVerCursos_Click" CssClass="btn btn-primary mt-2" />
            <asp:GridView ID="gvCursos" runat="server" CssClass="table table-striped table-bordered mt-4"></asp:GridView>
        </div>
    </div>
</asp:Content>
