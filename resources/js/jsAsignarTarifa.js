$("#txtFechaIngreso").datetimepicker({
    //format: "LT",
    format: 'yyyy-mm-dd',
    forceParse: true,
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    language: 'es',
    startView: 4,
    minView: 2
});
$("#show").click(function () {
    $('#txtFechaIngreso').datetimepicker('show');
});
$("#remove").click(function () {
    $("#txtFechaIngreso").val('');
});

//modificar
$("#modificar").click(function () {
    $("#txtCodigo").val($(this).parents("tr").find("td").eq(0).html());
    $("#txtNombre").val($(this).parents("tr").find("td").eq(1).html());
    $("#txtDireccion").val($(this).parents("tr").find("td").eq(2).html());
    $("#txtDpi").val($(this).parents("tr").find("td").eq(3).html());
    $("#txtFechaIngreso").val($(this).parents("tr").find("td").eq(4).html());
    $("#txtNit").val($(this).parents("tr").find("td").eq(5).html());
})

//modal
$("#modalArriba").click(function () {
    $("body").addClass("modal-open");
}).on("hidden", function () {
    $("body").removeClass("modal-open")
});
$(".close").click(function () {
    limpiarCampos();
})
$("#guardar").click(function () {

})

//funciones
function limpiarCampos() {
    $("#txtCodigo").val('');
    $("#txtNombre").val('');
    $("#txtDireccion").val('');
    $("#txtDpi").val('');
    $("#txtFechaIngreso").val('');
    $("#txtNit").val('');
};

function AgregarTarifaComunidad()
{
    var tabla = document.getElementById("tblTarifaComunidad");
    var fila = document.createElement("tr");
    var tdTarifa = document.createElement("td");
    var tdEliminar = document.createElement("td");
    tdTarifa.innerHTML = document.getElementById("cmbTarifaComunidad").value;
    tdEliminar.innerHTML = '<button type="button" class="btn btn-danger m-0 waves-effect my-2 px-2 py-1 fa-2x rounded-lg" onclick="EliminarFila(this);"> <i class="fas fa-minus-circle"></i></button>';
    fila.appendChild(tdTarifa);
    fila.appendChild(tdEliminar);
    tabla.appendChild(fila);

};

function AgregarTarifaProducto()
{
    var tabla = document.getElementById("tblTarifaProducto");
    var fila = document.createElement("tr");
    var tdTarifa = document.createElement("td");
    var tdEliminar = document.createElement("td");
    tdTarifa.innerHTML = document.getElementById("cmbTarifaProducto").value;
    tdEliminar.innerHTML = '<button type="button" class="btn btn-danger m-0 waves-effect my-2 px-2 py-1 fa-2x rounded-lg" onclick="EliminarFila(this);"> <i class="fas fa-minus-circle"></i></button>';
    fila.appendChild(tdTarifa);
    fila.appendChild(tdEliminar);
    tabla.appendChild(fila);

};

function AgregarTarifaTipoAfiliado()
{
    var tabla = document.getElementById("tblTarifaTipoAfiliado");
    var fila = document.createElement("tr");
    var tdTarifa = document.createElement("td");
    var tdEliminar = document.createElement("td");
    tdTarifa.innerHTML = document.getElementById("cmbTarifaTipoAfiliado").value;
    tdEliminar.innerHTML = '<button type="button" class="btn btn-danger m-0 waves-effect my-2 px-2 py-1 fa-2x rounded-lg" onclick="EliminarFila(this);"> <i class="fas fa-minus-circle"></i></button>';
    fila.appendChild(tdTarifa);
    fila.appendChild(tdEliminar);
    tabla.appendChild(fila);

};
function EliminarFila(objeto){
    objeto.parentNode.parentNode.parentNode.removeChild(objeto.parentNode.parentNode);
}