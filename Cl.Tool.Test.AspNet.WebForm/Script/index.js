$(document).ready(function () {

    CargaPersona();

    $("#TxtCedula").focusout(function () {
        if ($("#TxtCedula").val().trim() !== ''){
            PersonaFnd_Cedula();
        }
    });

    $("#BtnPersonaAdd").click(function () {
        LimpiarPersona();
        $("#MdlPersonaAdd").modal("show");
    });

    $("#BtnPersonaGrabar").click(function () {
        if (($("#TxtCedula").val().trim() == '') && ($("#TxtNombres").val().trim() == '') && ($("#TxtEmail").val().trim() == '')) {
            $("#DivDatosFaltantes").html("<span>Falta Nro de Cedula</span> <br/> <span>Falta Nombres </span> <br/> <span>Falta Email </span>" )
            $("#MdlPersonaAddFaltanDatos").modal("show");
        } else {
            GrabarPersona();            
        }
    });

    $("#BtnEliminarPersona").click(function () {
        var data = "{";
        data += "'id' : " + $("#TxtHiddenId").val();
        data += "}";

        console.log(data);

        $.ajax({
            type: "POST",
            url: "./index.aspx/Persona_Era",
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#MdlPersonaEra").modal("hide");
                CargaPersona();
            }
        });
    });

    $("#BtnPersonaUpd").click(function () {
        var data = "{";
        data += "'id' : " + $("#TxtHiddenId").val() + ", ";
        data += "'cedula' : " + $("#TxtUpdCedula").val() + ", ";
        data += "'nombres': '" + $("#TxtUpdNombres").val() + "', ";
        data += "'email': '" + $("#TxtUpdEmail").val() + "', ";
        data += "'idCargo': " + $("#CboUpdCargo").val() + "";
        data += "}";

        console.log(data);

        $.ajax({
            type: "POST",
            url: "./index.aspx/Persona_Upd",
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $("#MdlPersonaUpd").modal("hide");
                CargaPersona();
            }
        });
    });
});

function CargaPersona() {
    $("#PersonaGrilla").load("./GrillaPersona.aspx");
}

function GrabarPersona() {
    var data = "{";
    data += "'cedula' : " + $("#TxtCedula").val() + ", ";
    data += "'nombres': '" + $("#TxtNombres").val() + "', ";
    data += "'email': '" + $("#TxtEmail").val() + "', ";
    data += "'idCargo': " + $("#CboCargo").val() + "";
    data += "}";
    
    $.ajax({
        type: "POST",
        url: "./index.aspx/Persona_Add",
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $("#MdlPersonaAdd").modal("hide");
            CargaPersona();
        }
    });
}

function PersonaFnd_Cedula() {
    var data = "{";
    data += "'cedula' : " + $("#TxtCedula").val();
    data += "}";
    $.ajax({
        type: "POST",
        url: "./index.aspx/Persona_Fnd_Cedula",
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            console.log(data.d);
            if (data.d === '1') {
                $("#MdlPersonaCedulaExiste").modal("show");
                $("#MdlPersonaAdd").modal("hide");
            }            
        }
    });
}

function Persona_Era(id, nombre) {
    $("#LblElimina").text(nombre);
    $("#TxtHiddenId").val(id);
    $("#MdlPersonaEra").modal("show");
}

function Persona_Upd(id, nombres, email, cedula, idcargo, cargo) {
    LimpiarPersonaUpd();
    $("#TxtHiddenId").val(id);
    $("#TxtUpdCedula").val(cedula);
    $("#TxtUpdNombres").val(nombres);
    $("#TxtUpdEmail").val(email);
    $("#MdlPersonaUpd").modal("show");    
}

function LimpiarPersona() {
    $("#TxtCedula").val(0);
    $("#TxtNombres").val('');
    $("#TxtEmail").val('');
    $("#CboCargo").val(0);
}

function LimpiarPersonaUpd() {
    $("#TxtHiddenId").val(0);
    $("#TxtUpdCedula").val(0);
    $("#TxtUpdNombres").val('');
    $("#TxtUpdEmail").val('');
    $("#CboUpdCargo").val(0);
}
