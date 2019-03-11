<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Cl.Tool.Test.AspNet.WebForm.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <input type="hidden" id="TxtHiddenId" value="0"/>

    <section class="content-header">
        <h1>
            Nómina de Personas
            <small> lista de personas </small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="index.aspx">Grilla Personas</a></li>            
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
                        <button type="button" class="btn btn-primary pull-right" id="BtnPersonaAdd"> Agregar Persona </button>                                                
                    </div>
                    <br />
                    <div class="col-lg-12 col-md-6">
                        <div id="PersonaGrilla">
                        </div>
                    </div>
                </div>
            </div>                        
        </div>
    </section>



    <div class="modal fade" id="MdlPersonaAdd" tabindex="-1" role="dialog" aria-labelledby="MdlPersona">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-lg">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span>X</button>
                    <h4 class="modal-title">Agregar Persona</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <form class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-2 control-label"> Cedula </label>
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control" id="TxtCedula">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label"> Nombres </label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="TxtNombres" placeholder="Nombres">
                                        </div>
                                    </div>                                    
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label"> Email </label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="TxtEmail" placeholder="Email">
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label"> Cargo </label>
                                        <div class="col-sm-5">
                                            <select class="form-control" id="CboCargo">
                                                <option value="0">-- SELECCIONE --</option>
                                                <% 
                                                    foreach(var item in Cargos)
                                                    {
                                                        Response.Write("<option value='" + item.Id + "'>" + item.Nombre + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div id="DivGrillaEmpresas">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success pull-left" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary pull-right" id="BtnPersonaGrabar"> Grabar </button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="MdlPersonaUpd" tabindex="-1" role="dialog" aria-labelledby="MdlPersona">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-lg">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span>X</button>
                    <h4 class="modal-title">Actualizar Persona</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <form class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-2 control-label"> Cedula </label>
                                        <div class="col-sm-6">
                                            <input type="number" class="form-control" id="TxtUpdCedula">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label"> Nombres </label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="TxtUpdNombres" placeholder="Nombres">
                                        </div>
                                    </div>                                    
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label"> Email </label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="TxtUpdEmail" placeholder="Email">
                                        </div>
                                    </div>    
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-2 control-label"> Cargo </label>
                                        <div class="col-sm-5">
                                            <select class="form-control" id="CboUpdCargo">
                                                <option value="0">-- SELECCIONE --</option>
                                                <% 
                                                    foreach(var item in Cargos)
                                                    {                                                        
                                                        Response.Write("<option value='" + item.Id + "'>" + item.Nombre + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>                   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success pull-left" data-dismiss="modal"> Cerrar </button>
                    <button type="button" class="btn btn-primary pull-right" id="BtnPersonaUpd"> Actualizar </button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="MdlPersonaAddFaltanDatos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-danger" role="document">
            <div class="modal-content modal-lg">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span>X</button>
                    <h4 class="modal-title"> Faltan datos Necesarios </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" id="TxtHiddenOrigenPoliza"/>
                        <div class="col-lg-12 col-xs-12">
                            <div id="DivDatosFaltantes">
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="MdlPersonaCedulaExiste" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-danger" role="document">
            <div class="modal-content modal-lg">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span>X</button>
                    <h4 class="modal-title"> Faltan datos Necesarios </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden"/>
                        <div class="col-lg-12 col-xs-12">
                            <span>El numero de cedula ya existe en los registros</span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="MdlPersonaEra" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span>X</button>
                    <h4 class="modal-title"> Eliminar Persona</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden"/>
                        <div class="col-lg-12 col-xs-12">
                            <span id="LblElimina"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-success pull-right" id="BtnEliminarPersona">Eliminar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="Content/plugins/jQuery/jquery-2.2.3.min.js"></script>        
    <script src="Script/index.js"></script>

</asp:Content>
