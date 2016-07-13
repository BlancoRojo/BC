$(document).ready(function(){
   	var nombreJug;
  	var nomSesion=$('.jugador').text();
	var timeout=0;
 	var inicio;
   	var result;
  
   	vidas=2;
   	puntaje=0;
   	resp_correctas=0;
   	resp_incorrectas=0
	
	
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

 		inicio=new Date().getTime();
   	 	 	
   	 	timeout=setInterval(funcionando,1000);
   	 	elegir_preguntas();		
   	 });

   	//en el caso que no le quede mas intento al jugador se oculta la pantalla en la cual se interactua
   	//con las preguntas y se muestra una pantalla donde le indica que perdio, donde la misma tambien
   	//le da la posibilidad para que vuelva a intentar, aca tambien se reincicia las vidas, el puntaje,
   	//y el cronometro y luego se muestra en la vista
   	$("#reintentar").click(function(){
   		
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

		var timeout=0;


   	});


   	function elegir_preguntas(){
   		$(".respuesta").removeClass("btn btn-success");
   		$(".respuesta").removeClass("btn btn-danger");
   		$(".respuesta").addClass("btn btn-info");
   		$("#imagen-escultura").addClass("hidden");
   		$("#categoria").removeClass("hidden");
   		$(".respuesta").removeClass("disabled");
  
   		if (vidas>0){
	   		 $.getJSON("../PreguntasController/seleccionar_pregunta",
				function(data){

					$("#categoria").text(data[0].descCat);
			    	$('#categoria').addClass("animated zoomInLeft");	
			    	//Tratado de imagenes
			    	var dirImg= ("../static/images/EsculturasFotos/" + data[1].imagen);
			    	
			    	if (data[0].idCat == 4){
			    		$("#imagen-escultura").attr("src", dirImg);
			    		
			    		$("#imagen-escultura").removeClass("hidden");
			    		$("#categoria").addClass("hidden");
			    	}
			    	//  -- fer edito -- 
			    	$("#tercer-pantalla h2").text(data[1].descPreg);
			    	$("#idPregunta").text(data[1].idPreg);
			    	
			    	//$("#respuesta1").val(data[2].descResp0);//valores a los radiobutton
			    	//$("#respuesta2").val(data[2].descResp1);//valores a los radiobutton
			    	//$("#respuesta3").val(data[2].descResp2);//valores a los radiobutton
			    	
			    	$("#respuesta1").text(data[2].descResp0);//valores de los label
			    	$("#respuesta2").text(data[2].descResp1);//valores de los label
			    	$("#respuesta3").text(data[2].descResp2);//valores de los label
			    	
					
	   			}
			);
	   	}else{
	   			registrarPuntaje();
	   			$("#tercer-pantalla").addClass("hidden");	
	   			$("#looser-pantalla").removeClass("hidden");
	   			$("#resp_correctas").text(resp_correctas);
	   			$("#resp_incorrectas").text(resp_incorrectas);
	   			$("#tiempo").text(result);		   			
	   			$("#total").text(puntaje);	   			   			  	
	   					
	   	}
   	}

   	$( ".respuesta" ).on( "click", function() {
   		event.preventDefault();
   		var idPregunta=$('#idPregunta').text();
   		var respuesta=( $( this ).text() );
   		var idButton=($(this).attr("id"));//obtengo el id del button seleccionado
		//idRadioB=$('input[name=pk_inicial]:checked')
		//idRadioButton=($("input:checked").attr("id"));
		$(".respuesta").addClass("disabled");

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
			        	
						//document.getElementById('correcto').play()//sonido
						
						resp_correctas=resp_correctas+1;//contador de aciertos
						correcto(idButton);//llama a una funcion que agrega estilos a la respuesta elegida						
						puntaje=puntaje + 5;//acumulador de puntajes
						$("#numPuntos").text(puntaje);//muestro puntaje
						setTimeout(elegir_preguntas,2000);//seleccion de la proxima pregunta
						
			        }else{
			        	
			        	//document.getElementById('incorrecto').play()//sonido
			        	incorrecto(idButton);	//llama a una funcion que agrega estilos a la respuesta elegida		        	
			        	resp_incorrectas=resp_incorrectas+1;//contador de preg incorrectas
			        	vidas= vidas -1; //vidas
			        	$("#vidas").addClass("hidden");//quito el img de vidas			        
			        	setTimeout(elegir_preguntas,2000);//seleccion de la proxima pregunta			   
			        }
			    },
 
			});
  		
		});

   		function correcto(id){
  		
			$("#"+id).removeClass("btn btn-info");
			$("#"+id).addClass("btn btn-success");

   		}


   		function incorrecto(id){
		  			
			$("#"+id).removeClass("btn btn-info");	
			$("#"+id).addClass("btn btn-danger");
   		}

   		function funcionando()
		{
			// obteneos la fecha actual
			var actual = new Date().getTime();
	 		
			// obtenemos la diferencia entre la fecha actual y la de inicio
			var diff=new Date(actual-inicio);
	 
			// mostramos la diferencia entre la fecha actual y la inicial
			result=LeadingZero(diff.getUTCHours())+":"+LeadingZero(diff.getUTCMinutes())+":"+LeadingZero(diff.getUTCSeconds());
			
			//$("#crono").addClass("animated pulse");
			
			//setTimeout("eliminar()",1000);
			
			document.getElementById('crono').innerHTML = result;
			setInterval(anamiacionCrono,1000);
	 
			// Indicamos que se ejecute esta función nuevamente dentro de 1 segundo
			
		}

		function anamiacionCrono(){
			$("#crono").addClass("animated bounceIn");
			setTimeout(function(){$("#crono").removeClass("animated bounceIn");},500);	
				
		}
 	
		/* Funcion que pone un 0 delante de un valor si es necesario */
		function LeadingZero(Time) {
			return (Time < 10) ? "0" + Time : + Time;
		}

   		function registrarPuntaje(){
   			var f = new Date();
			var fecha_actual=(f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear());
			
   			$.ajax({
			    // la URL para la petición
			    url : '/BrainChaco/JugadorController/registrarPuntaje',
 				
			    // la información a enviar
			    // (también es posible utilizar una cadena de datos)
			    data : { puntaje : puntaje,juego:'preguntas',fecha:fecha_actual,tiempo :result},
 
			    // especifica si será una petición POST o GET
			    type : 'post',
 
			    // el tipo de información que se espera de respuesta
			    //dataType : 'json',
 					
			    // código a ejecutar si la petición es satisfactoria;
			    // la respuesta es pasada como argumento a la función
			    success : function(data) {
			     	
			    },
 
			});


   		}


});//fin document

