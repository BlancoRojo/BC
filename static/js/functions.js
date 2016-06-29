$(document).ready(function(){
  
  

  //if(!nom.length){
    //
    //$( "#btn-nom" ).prop( "disabled", true);
  //}

  
  $("#nomJugador").keyup(function() {
  	var variable=$('#nomJugador').val();
  	if (variable!='') {
  		$( "#btn-nom" ).prop( "disabled", false);//habilitado
  	}else{
  		$( "#btn-nom" ).prop( "disabled", true);//inhabilitado
  	}
  });

  $('#side-menu').click(function(){
    if ($('#side-menu').css('right')!='0px'){
     $('#side-menu').css({ 'right' : '0px'});}
    else{
      $('#side-menu').css({ 'right' : '-318px' });
    }
  });




});


 //$.ajax({
          //url:'http://127.0.0.1:8000/BrainChaco/PreguntasController/seleccionar_categoria',//action del formulario, ej:
          //http://localhost/mi_proyecto/mi_controlador/mi_funcion
          //type: 'POST',//el método post o get del formulario
          //data: ,obtenemos todos los datos del formulario
          //error: function(){
          //si hay un error mostramos un mensaje
          //},
          //success:function(descripcion){
          //hacemos algo cuando finalice todo correctamente
          //$("#tercer-presentacion h1").text('LA CATEGORIA SELECCIONADA ES: ' + descripcion);
          //}
      //});