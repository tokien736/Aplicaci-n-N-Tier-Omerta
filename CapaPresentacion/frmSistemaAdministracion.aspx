<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSistemaAdministracion.aspx.cs" Inherits="CapaPresentacion.frmSistemaAdministracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h1 class="text-center">Bienvenido Admin al sistema</h1>
        <div class="text-center mt-4">
            <asp:Label ID="lblAdministrador" runat="server" CssClass="form-label"></asp:Label>
            <div class="btn-group-vertical" role="group">
                <asp:Button runat="server" ID="btnCrudAlumno" Text="CRUD Alumno" OnClick="btnCrudAlumno_Click" CssClass="btn btn-primary mb-2" />
                <asp:Button runat="server" ID="btnCrudDocente" Text="CRUD Docente" OnClick="btnCrudDocente_Click" CssClass="btn btn-secondary mb-2" />
                <asp:Button runat="server" ID="btnCrudAsignatura" Text="CRUD Asignatura" OnClick="btnCrudAsignatura_Click" CssClass="btn btn-success mb-2" />
                <asp:Button runat="server" ID="btnCerrar" Text="Cerrar sesión" OnClick="btnCerrar_Click" CssClass="btn btn-danger" />
            </div>
        </div>
    </div>
</asp:Content>
