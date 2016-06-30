$(document).ready(function(){
   	var nombreJug;
  	var nomSesion=$('.jugador').text();
 
   	vidas=2;
   	puntaje=0;
   	resp_correctas=0;
   	resp_incorrectas=0
   	contador_s =0;
    contador_m =0;
    s = document.getElementById("segundos");
    m = document.getElementById("minutos");


   	setTimeout(mostrarPrimPantalla,3000);

   	//funcion que luego de un delay elimina la presentacion y carga la segunda pantalla del juego
   	function mostrarPrimPantalla(){

   		$('#cuadro-preguntas').addClass("hidden");//ocultar
		$('#segunda-pantalla').removeClass("hidden");//mostrar
   	}

   	//cuando se hace click empezar se oculta la segunda pantalla y se pasa a mostrar la tercer
   	//pantalla en donde se mostrarian, la categoria, la pregunta y las respuesta a esa pregunta
   	//luego se invoca a una funcion elegir_preguntas 
   	$("#jugar-preguntas").click(function(){
   		
   	 	$('#segunda-pantalla').addClass("hidden");//ocultar
   	 	$("#tercer-pantalla").removeClass("hidden");//mostrar
   	 	cronometro();
   	 	elegir_preguntas();		
   	 });

   	//en el caso que no le quede mas intento al jugador se oculta la pantalla en la cual se interactua
   	//con las preguntas y se muestra una pantalla donde le indica que perdio, donde la misma tambien
   	//le da la posibilidad para que vuelva a intentar, aca tambien se reincicia las vidas, el puntaje,
   	//y el cronometro y luego se muestra en la vista
   	$("#reintentar").click(function(){
   		clearInterval(cronometro);
   		$("#tercer-pantalla").removeClass("hidden");
   		$("#looser-pantalla").addClass("hidden");
   		vidas=2;
   		puntaje=0;
   		resp_incorrectas=0;
   		resp_correctas=0
   		$("#numPuntos").text(puntaje);
		$("#intentos").text(vidas);
		$("#vidas").removeClass("hidden");
		$("#segunda-pantalla").removeClass("hidden");
		$("#tercer-pantalla").addClass("hidden");		

   	});


   	function elegir_preguntas(){
   		
   		if (vidas>0){
	   		 $.getJSON("../PreguntasController/seleccionar_pregunta",
				function(data){

					$("#categoria").text(data[0].descCat);
			    	$('#categoria').addClass("animated zoomInLeft");

			    	$("#tercer-pantalla h2").text(data[1].descPreg);
			    	$("#idPregunta").text(data[1].idPreg);
			    	
			    	$("#respuesta1").val(data[2].descResp0);//valores a los radiobutton
			    	$("#respuesta2").val(data[2].descResp1);//valores a los radiobutton
			    	$("#respuesta3").val(data[2].descResp2);//valores a los radiobutton
			    	
			    	$("#lblrespuesta1").text(data[2].descResp0);//valores de los label
			    	$("#lblrespuesta2").text(data[2].descResp1);//valores de los label
			    	$("#lblrespuesta3").text(data[2].descResp2);//valores de los label
					
	   			}
			);
	   	}else{
	   			registrarPuntaje();
	   			$("#tercer-pantalla").addClass("hidden");	
	   			$("#looser-pantalla").removeClass("hidden");
	   			$("#resp_correctas").text(resp_correctas);
	   			$("#resp_incorrectas").text(resp_incorrectas);
	   			$("#puntajetotal").text(puntaje);
	   			$("#total-minutos").text(contador_m);
	    		$("#total-segundos").text(contador_s);	   			
	   			document.getElementById('looser').play();
	   					
	   	}
   	}

   	$( "input" ).on( "click", function() {
   		var idPregunta=$('#idPregunta').text();
   		var respuesta=( $( "input:checked" ).val() );

		//idRadioB=$('input[name=pk_inicial]:checked')
		//idRadioButton=($("input:checked").attr("id"));


   		$.ajax({
			    // la URL para la petición
			    url : '/BrainChaco/PreguntasController/verificar_respuesta',
 				
			    // la información a enviar
			    // (también es posible utilizar una cadena de datos)
			    data : { idPreg : idPregunta,resp: respuesta },
 
			    // especifica si será una petición POST o GET
			    type : 'post',
 
			    // el tipo de información que se espera de respuesta
			    //dataType : 'json',
 
			    // código a ejecutar si la petición es satisfactoria;
			    // la respuesta es pasada como argumento a la función
			    success : function(respuesta) {
			        if (respuesta=='V'){
			        	//$("radio input:checked").attr("id").addClass("alert alert-info");
			        	//$("label").addClass("alert alert-danger");
						document.getElementById('correcto').play()
						alert('CORRECTO');
						resp_correctas=resp_correctas+1;
						limpiarRB();
						elegir_preguntas();
						puntaje=puntaje + 5;
						$("#numPuntos").text(puntaje);
			        }else{
			        	//$("radio input:checked").attr("id").addClass("alert alert-danger");
			        	document.getElementById('incorrecto').play()
			        	alert('INCORRECTO');
			        	//var thissound=document.getElementById("incorrecto");			
  						//thissound.Play();
			        	resp_incorrectas=resp_incorrectas+1
			        	vidas= vidas -1;
			        	$("#vidas").addClass("hidden");

			        	//$("#intentos").text(vidas);
			        	limpiarRB();
			        	elegir_preguntas();			   
			        }
			    },
 
			});
  		
		});

   		function limpiarRB(){
			
			$("#respuesta1").prop('checked', false);
			$("#respuesta2").prop('checked', false);
			$("#respuesta3").prop('checked', false); 

   		}

   		function cronometro(){

	   		cronometro = setInterval(

	       		function(){

	        	 	if(contador_s==60)
					{
		                contador_s=0;
		                contador_m++;
		                m.innerHTML = contador_m;
	                	if(contador_m==60)
	                	{
	                  		contador_m=0;
	                	}
	             	}
	             s.innerHTML = contador_s ;
	             contador_s++;
	 
	        	},1000);
   		}

   		function registrarPuntaje(){
   			var f = new Date();
			var fecha_actual=(f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear());
   			$.ajax({
			    // la URL para la petición
			    url : '/BrainChaco/JugadorController/registrarPuntaje',
 				
			    // la información a enviar
			    // (también es posible utilizar una cadena de datos)
			    data : { puntaje : puntaje,juego:'preguntas',fecha:fecha_actual },
 
			    // especifica si será una petición POST o GET
			    type : 'post',
 
			    // el tipo de información que se espera de respuesta
			    //dataType : 'json',
 
			    // código a ejecutar si la petición es satisfactoria;
			    // la respuesta es pasada como argumento a la función
			    success : function(data) {
			      alert(data)
			    },
 
			});


   		}


});//fin document

