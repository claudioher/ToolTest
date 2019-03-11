<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cargos.aspx.cs" Inherits="Cl.Tool.Test.AspNet.WebForm.Cargos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content-header">
        <h1>
            Cargos
            <small> lista de cargos </small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="Cargos.aspx">Grilla Cargos</a></li>            
        </ol>
    </section>
    
    <section class="content">
        
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title"> </h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
            </div>
            <div class="box-body">
                <div class="row">                    
                    <div class="col-lg-12 col-md-6">
                        <table id="TblCargos" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            if (CargosLst != null)
                            {
                                foreach (var item in CargosLst)
                                {
                                    Response.Write("<tr>");
                                    Response.Write("<td>" + item.Id + "</td>");
                                    Response.Write("<td>" + item.Nombre + "</td>");
                                    Response.Write("</tr>");
                                }
                            }
                        %>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>                        
        </div>
    </section>

    <script src="Content/plugins/jQuery/jquery-2.2.3.min.js"></script> 


    <script>
    $(function () {
        $("#TblCargos").DataTable({
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
    </script>
</asp:Content>
