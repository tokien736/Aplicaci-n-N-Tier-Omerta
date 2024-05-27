<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAlumno.aspx.cs" Inherits="CapaPresentacion.frmAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Mantenimiento de la tabla alumno</h2>
        <div class="form-group">
            <label for="txtCodAlumno" class="control-label">CodAlumno</label>
            <asp:TextBox runat="server" ID="txtCodAlumno" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCodAlumno" runat="server" ControlToValidate="txtCodAlumno" ErrorMessage="CodAlumno obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvCodAlumnoEliminar" runat="server" ErrorMessage="CodAlumno para eliminar" ValidationGroup="Eliminar" ControlToValidate="txtCodAlumno">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group" id="rfvAPaterno">
            <label for="txtAPaterno" class="control-label">APaterno</label>
            <asp:TextBox runat="server" ID="txtAPaterno" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAPaterno" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="APaterno obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvAPaternoActualizar" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Se requier apellido Paterno para actulizar" ValidationGroup="Actualizar">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="txtAMaterno" class="control-label">AMaterno</label>
            <asp:TextBox runat="server" ID="txtAMaterno" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAMaterno" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="AMaterno obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rvfAMaternoActulizar" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="Se requiere apellido materno para actulizar" ValidationGroup="Actualizar">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="txtNombres" class="control-label">Nombres</label>
            <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="txtNombres" ErrorMessage="Nombres obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvNombresActulizar" runat="server" ControlToValidate="txtNombres" ErrorMessage="Se requiere nombres para actulizar" ValidationGroup="Actualizar">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="txtCodUsuario" class="control-label">CodUsuario</label>
            <asp:TextBox runat="server" ID="txtCodUsuario" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCodUsuario" runat="server" ControlToValidate="txtCodUsuario" ErrorMessage="CodUsuario obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group" id="rfvContasena">
            <label for="txtContrasena" class="control-label">Contraseña</label>
            <asp:TextBox runat="server" ID="txtContrasena" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvContasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="Contaseña Obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="txtConfirmarContrasena" class="control-label">Confirmar Contraseña</label>
            <asp:TextBox runat="server" ID="txtConfirmarContrasena" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvConfirmarContasena" runat="server" ControlToValidate="txtConfirmarContrasena" ErrorMessage="ConfirmarContrasena obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvContrasenas" runat="server" ControlToCompare="txtContrasena" ControlToValidate="txtConfirmarContrasena" ErrorMessage="Contraseña y confirmar contraseña tienen que ser iguales" ValidationGroup="Agregar">*</asp:CompareValidator>
        </div>

        <div class="form-group">
            <label for="txtCodEscuela" class="control-label">CodEscuela</label>
            <asp:TextBox runat="server" ID="txtCodEscuela" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCodEscuela" runat="server" ControlToValidate="txtCodEscuela" ErrorMessage="CodEscuela obligatorio" ValidationGroup="Agregar">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button Text="Agregar" runat="server" Id="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" ValidationGroup="Agregar"/>
            <asp:Button Text="Eliminar" runat="server" Id="btnEliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Está seguro de que desea eliminar este alumno?');" ValidationGroup="Eliminar"/>
            <asp:Button Text="Actualizar" runat="server" Id="btnActualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" ValidationGroup="Actualizar"/>
            <br />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Eliminar" />
            <asp:ValidationSummary ID="ValidationSummary4" runat="server" ValidationGroup="Actualizar" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Agregar" />
        </div>
        <div class="form-group">
            <label for="txtAPaternoBuscar" class="control-label">APaterno</label>
            <asp:TextBox runat="server" ID="txtAPaternoBuscar" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBuscar" runat="server" ControlToValidate="txtAPaternoBuscar" ErrorMessage="ApellidoPaterno para buscar" ValidationGroup="Buscar">*</asp:RequiredFieldValidator>
        </div>
        <asp:Button Text="Buscar" runat="server" Id="btnBuscar" CssClass="btn btn-info" OnClick="btnBuscar_Click" ValidationGroup="Buscar"/>
        <asp:Button Text="Ver Todos los Alumnos" runat="server" ID="btnVerTodos" CssClass="btn btn-primary" OnClick="btnVerTodos_Click" />
        <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="Buscar" />
        <div class="form-group">
            <asp:GridView runat="server" ID="gvAlumno" CssClass="table table-striped" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvAlumno_SelectedIndexChanged"></asp:GridView>
        </div>
        <div class="form-group">
            <asp:Label Text="Mensaje" runat="server" ID="lblMensaje" CssClass="alert alert-info"/>
        </div>
    </div>
    </asp:Content>