<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GrillaPersona.aspx.cs" Inherits="Cl.Tool.Test.AspNet.WebForm.GrillaPersona" %>

<table id="TblPersona" class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Cedula</th>
            <th>Cargo</th>            
            <th style="text-align:center">Editar</th>
            <th style="text-align:center">Eliminar</th>
        </tr>
    </thead>
    <tbody>
    <%
        if (PersonaLst != null)
        {
            foreach (var item in PersonaLst)
            {
                Response.Write("<tr>");
                Response.Write("<td>" + item.Id + "</td>");
                Response.Write("<td>" + item.Nombres + "</td>");
                Response.Write("<td>" + item.Email + "</td>");                
                Response.Write("<td>" + item.Cedula + "</td>");                
                Response.Write("<td>" + item.NombreCargo + "</td>");                
                Response.Write("<td style=\"text-align:center;\"><input type=\"button\" class=\"btn btn-primary\" value=\"...\" onclick=\"EditarPersona(" + item.Id + ", '" + item.Nombres + "', '" + item.Email + "', " + item.Cedula + ", " + item.IdCargo + ", '" + item.NombreCargo + "');\"/></td>");
                Response.Write("<td style=\"text-align:center;\"><input type=\"button\" class=\"btn btn-danger\" value=\"...\" onclick=\"EliminarPersona(" + item.Id + ", '" + item.Nombres + "');\" /></td>");
                Response.Write("</tr>");
            }
        }
    %>
    </tbody>
</table>

<script>
    $(function () {
        $("#TblPersona").DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "language": {
                "emptyTable": "No existen personas"
            }
        });
    });


    function EliminarPersona(id, nombre) {
        Persona_Era(id, nombre);        
    }

    function EditarPersona(id, nombres, email, cedula, idcargo, cargo) {
        Persona_Upd(id, nombres, email, cedula, idcargo, cargo);
    }

</script>
