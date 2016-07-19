def index():
	if session.jugador=='AdminPO':
		response.view='AdminController/index.html'
   		return dict()
   	else:
   		response.view='HomeController/index.html'
   		return dict()



# usuarios -------------------------------------------

def usuarios():
	if session.jugador=='AdminPO':
		users = db().select(db.usuario.ALL)
		response.view='AdminController/usuarios.html'
   		return dict(users=users)
   	else:
   		response.view='HomeController/index.html'
   		return dict()

# editando un usuario por id -------------------------

def editarUsuario():
	if session.jugador=='AdminPO':
		response.view='AdminController/editarUsuario.html'
   		return dict(msj="Ingrese ID del usuario")
   	else:
   		response.view='HomeController/index.html'
   		return dict()

def buscarUsuario():
	if session.jugador=='AdminPO':
		idUser = request.post_vars
		usuario = db(db.usuario.id == idUser.id).select()
		if len(usuario)!=0:
			response.view='AdminController/editarUsuario.html'
			return dict(msj="Edite Los Campos del usuario",usuario=usuario)
		else:
			response.view='AdminController/editarUsuario.html'
	   		return dict(msj="Error id de usuario inexistente")
	else:
		response.view='HomeController/index.html'
		return dict()

def enviarDatosUsuario():
	if session.jugador=='AdminPO':
		datos = request.post_vars
		db(db.usuario.id == datos.id).update(nombre=datos.nombre,correo=datos.correo,password=datos.password)
		response.view='AdminController/editarUsuario.html'
   		return dict(msj="Editado Correctamente")
   	else:
   		response.view='HomeController/index.html'
   		return dict()

# preguntas y respuestas -----------------------------

def pregResp():
	listado= db(db.preguntas.id == db.respuestapreguntas.idPreg).select()
	if session.jugador=='AdminPO':
		response.view='AdminController/pregResp.html'
   		return dict(listado=listado)
   	else:
   		response.view='HomeController/index.html'
   		return dict()

# editar una pregunta con respuesta por id -----------

def editarPregResp():
	if session.jugador=='AdminPO':
		response.view='AdminController/editarPregResp.html'
   		return dict(msj="Ingrese ID de la Pregunta")
   	else:
   		response.view='HomeController/index.html'
   		return dict()

def buscarPregunta():
	if session.jugador=='AdminPO':
		idPreg = request.post_vars
		pregunta = db(db.preguntas.id == db.respuestapreguntas.idPreg, db.preguntas.id==idPreg.id).select()
		if len(pregunta)!=0:
			response.view='AdminController/editarPregResp.html'
			return dict(msj="Edite Los Campos Correspondientes",pregunta=pregunta)
		else:
			response.view='AdminController/editarPregResp.html'
	   		return dict(msj="Error id de Pregunta inexistente")
	else:
		response.view='HomeController/index.html'
		return dict()

def enviarDatosPregunta():
	if session.jugador=='AdminPO':
		datos = request.post_vars
		db(db.preguntas.id == datos.id).update(descripcion=datos.pregunta,idCat=datos.idCat,imagen=datos.imagen)
		db(db.respuestapreguntas.id == 1,db.respuestapreguntas.idPreg == datos.id).update(descripcion=datos.respuesta1,opcion=datos.opcion1)
		db(db.respuestapreguntas.id == 2,db.respuestapreguntas.idPreg == datos.id).update(descripcion=datos.respuesta2,opcion=datos.opcion2)
		db(db.respuestapreguntas.id == 3,db.respuestapreguntas.idPreg == datos.id).update(descripcion=datos.respuesta3,opcion=datos.opcion3)
		response.view='AdminController/editarPregResp.html'
   		return dict(msj="Editado Correctamente")
   	else:
   		response.view='HomeController/index.html'
   		return dict()


# cargar una pregunta --------------------------------

def cargarPreg():
	if session.jugador=='AdminPO':
		response.view='AdminController/cargarPreg.html'
   		return dict()
   	else:
   		response.view='HomeController/index.html'
   		return dict()

def insertarPregunta():
	datos = request.post_vars
	response.view='AdminController/index.html'

	db.preguntas.insert(descripcion=datos.desc,idCat=datos.cat,imagen=datos.img)
	idpreg = db.executesql('SELECT max(id) from preguntas')
	for preg in idpreg:
		db.respuestapreguntas.insert(id=1,idPreg=preg[0],descripcion=datos.resp1,opcion=datos.opcion1)
		db.respuestapreguntas.insert(id=2,idPreg=preg[0],descripcion=datos.resp2,opcion=datos.opcion2)
		db.respuestapreguntas.insert(id=3,idPreg=preg[0],descripcion=datos.resp3,opcion=datos.opcion3)
	return dict()

# cargar una pregunta en una linea ---------------------

def cargarPregLine():
	if session.jugador=='AdminPO':
		response.view='AdminController/cargarPregLine.html'
   		return dict()
   	else:
   		response.view='HomeController/index.html'
   		return dict()

def insertarPreguntaLine():
	datos = request.post_vars
	db.preguntas.insert(descripcion=datos.desc,idCat=datos.cat,imagen=datos.img)
	idpreg = db.executesql('SELECT max(id) from preguntas')
	for preg in idpreg:
		db.respuestapreguntas.insert(id=1,idPreg=preg[0],descripcion=datos.resp1,opcion=datos.opcion1)
		db.respuestapreguntas.insert(id=2,idPreg=preg[0],descripcion=datos.resp2,opcion=datos.opcion2)
		db.respuestapreguntas.insert(id=3,idPreg=preg[0],descripcion=datos.resp3,opcion=datos.opcion3)
	return dict()