<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAsignatura.aspx.cs" Inherits="CapaPresentacion.frmAsignatura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Mantenimiento de la tabla de Asignatura</h2>
        <div class="form-group">
            <label for="txtCodAsignatura">Código de Asignatura</label>
            <asp:TextBox runat="server" ID="txtCodAsignatura" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtNombre">Nombre</label>
            <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtCodRequisito">Código de Requisito</label>
            <asp:TextBox runat="server" ID="txtCodRequisito" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button Text="Agregar" runat="server" ID="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click"/>
            <asp:Button Text="Eliminar" runat="server" ID="btnEliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Está seguro de que desea eliminar esta asignatura?');"/>
            <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click"/>
        </div>
        <div class="form-group">
            <label for="txtNombreBuscar">Nombre</label>
            <asp:TextBox runat="server" ID="txtNombreBuscar" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button Text="Buscar" runat="server" ID="btnBuscar" CssClass="btn btn-info" OnClick="btnBuscar_Click"/>
        <asp:Button Text="Ver Todas las Asignaturas" runat="server" ID="btnVerTodas" CssClass="btn btn-primary" OnClick="btnVerTodas_Click" />
        <div class="form-group">
            <asp:GridView runat="server" ID="gvAsignaturas" CssClass="table table-striped" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvAsignaturas_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="CodAsignatura" HeaderText="Código" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="CodRequisito" HeaderText="Código de Requisito" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="form-group">
            <asp:Label Text="Mensaje" runat="server" ID="lblMensaje" CssClass="alert alert-info"/>
        </div>
    </div>
</asp:Content>
