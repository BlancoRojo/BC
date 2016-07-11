$(document).ready(function(){
  
  //var nom=$('#LblnomJugador').text();
  //if(!nom.length){
    //$("#mostrarmodal").modal("show");
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

  $('#main-tab1').click(function(){
        if ($('#sugB1').hasClass('hidden')){
          if ($('#side-menu').css('right')!='0px'){
       $('#side-menu').css({ 'right' : '0px'});}
      else{
       $('#side-menu').css({ 'right' : '-318px' });
          }
        }
        else{
                  if ($('#side-menu').css('right')!='-318px'){
          $('#side-menu').css({ 'right' : '-318px' });
          setTimeout(function(){$('#side-menu').css({ 'right' : '0px'})
            $("#menuB1").removeClass("hidden");
          $("#menuB2").removeClass("hidden");
          $("#logB1").removeClass("hidden");
          $("#logB2").removeClass("hidden");
          $("#regB1").removeClass("hidden");
          $("#regB2").removeClass("hidden");
          $("#rankingB").removeClass("hidden");
          $("#valorB1").addClass("hidden");
          $("#valorB2").addClass("hidden");
          $("#recomend1").addClass("hidden");
          $("#recomend2").addClass("hidden");
          $("#sugB1").addClass("hidden");
          $("#sugB2").addClass("hidden");
          $("#nosotrosB1").addClass("hidden");
          $("#nosotrosB2").addClass("hidden");

          },1300);
        }
        else{
          $('#side-menu').css({ 'right' : '0px'});

            $("#menuB1").removeClass("hidden");
          $("#menuB2").removeClass("hidden");
          $("#logB1").removeClass("hidden");
          $("#logB2").removeClass("hidden");
          $("#regB1").removeClass("hidden");
          $("#regB2").removeClass("hidden");
          $("#rankingB").removeClass("hidden");
          $("#valorB1").addClass("hidden");
          $("#valorB2").addClass("hidden");
          $("#recomend1").addClass("hidden");
          $("#recomend2").addClass("hidden");
          $("#sugB1").addClass("hidden");
          $("#sugB2").addClass("hidden");
          $("#nosotrosB1").addClass("hidden");
          $("#nosotrosB2").addClass("hidden");
          
        } 
        }
  });

    $('#mas-tab').click(function(){
        if ($('#menuB2').hasClass('hidden')){
          if ($('#side-menu').css('right')!='0px'){
       $('#side-menu').css({ 'right' : '0px'});}
      else{
       $('#side-menu').css({ 'right' : '-318px' });
          }
        }
        else{
                  if ($('#side-menu').css('right')!='-318px'){
          $('#side-menu').css({ 'right' : '-318px' });
          setTimeout(function(){$('#side-menu').css({ 'right' : '0px'})
            $("#menuB1").addClass("hidden");
          $("#menuB2").addClass("hidden");
          $("#logB1").addClass("hidden");
          $("#logB2").addClass("hidden");
          $("#regB1").addClass("hidden");
          $("#regB2").addClass("hidden");
          $("#rankingB").addClass("hidden");
          $("#valorB1").removeClass("hidden");
          $("#valorB2").removeClass("hidden");
          $("#recomend1").removeClass("hidden");
          $("#recomend2").removeClass("hidden");
          $("#sugB1").removeClass("hidden");
          $("#sugB2").removeClass("hidden");
          $("#nosotrosB1").removeClass("hidden");
          $("#nosotrosB2").removeClass("hidden");

          },1300);
        }
        else{
          $('#side-menu').css({ 'right' : '0px'});

            $("#menuB1").addClass("hidden");
          $("#menuB2").addClass("hidden");
          $("#logB1").addClass("hidden");
          $("#logB2").addClass("hidden");
          $("#regB1").addClass("hidden");
          $("#regB2").addClass("hidden");
          $("#rankingB").addClass("hidden");
          $("#valorB1").removeClass("hidden");
          $("#valorB2").removeClass("hidden");
          $("#recomend1").removeClass("hidden");
          $("#recomend2").removeClass("hidden");
          $("#sugB1").removeClass("hidden");
          $("#sugB2").removeClass("hidden");
          $("#nosotrosB1").removeClass("hidden");
          $("#nosotrosB2").removeClass("hidden");
          
        } 
        }
       
          
           
    
    
  });
    
    
  $('#ranking-pregunta').DataTable();
  $('#ranking-memoria').DataTable();
  



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