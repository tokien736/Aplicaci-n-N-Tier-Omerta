<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSistemaAlumno.aspx.cs" Inherits="CapaPresentacion.frmSistemaAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h1 class="text-center">Bienvenido alumno al sistema</h1>
        
        <div class="d-flex justify-content-end mb-3">
            <asp:Label ID="lblAlumno" runat="server" CssClass="mr-2 font-weight-bold"></asp:Label>
            <asp:Button runat="server" ID="btnCerrar" Text="Cerrar sesión" OnClick="btnCerrar_Click" CssClass="btn btn-danger" />
        </div>
        
        <h2 class="mt-4">Cursos Matriculados</h2>
        <div class="table-responsive">
            <asp:GridView ID="gvCursosMatriculados" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover">
                <Columns>
                    <asp:BoundField DataField="CodAsignatura" HeaderText="Código Asignatura" />
                    <asp:BoundField DataField="Asignatura" HeaderText="Asignatura" />
                    <asp:BoundField DataField="Semestre" HeaderText="Semestre" />
                </Columns>
            </asp:GridView>
        </div>
        
        <h2 class="mt-4">Notas por Semestre</h2>
        <div class="form-group">
           <asp:DropDownList ID="ddlSemestres" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSemestres_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="gvNotasSemestre" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover">
                <Columns>
                    <asp:BoundField DataField="CodAsignatura" HeaderText="Código Asignatura" />
                    <asp:BoundField DataField="Asignatura" HeaderText="Asignatura" />
                    <asp:BoundField DataField="Parcial1" HeaderText="Parcial 1" />
                    <asp:BoundField DataField="Parcial2" HeaderText="Parcial 2" />
                    <asp:BoundField DataField="NotaFinal" HeaderText="Nota Final" />
                </Columns>
            </asp:GridView>
        </div>
        
        <h2 class="mt-4">Histórico de Notas</h2>
        <div class="table-responsive">
            <asp:GridView ID="gvHistoricoNotas" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover">
                <Columns>
                    <asp:BoundField DataField="CodAsignatura" HeaderText="Código Asignatura" />
                    <asp:BoundField DataField="Asignatura" HeaderText="Asignatura" />
                    <asp:BoundField DataField="Semestre" HeaderText="Semestre" />
                    <asp:BoundField DataField="Parcial1" HeaderText="Parcial 1" />
                    <asp:BoundField DataField="Parcial2" HeaderText="Parcial 2" />
                    <asp:BoundField DataField="NotaFinal" HeaderText="Nota Final" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
