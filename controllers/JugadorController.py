# -*- coding: utf-8 -*-
# intente algo como
import smtplib

#get
def login(): 
    response.view = "JugadorController/login.html"
    return dict(LError='',LNom='',LPsw='')

#post
def loginCompleto():
	form = request.post_vars
	
	row = db((db.usuarios.nombre == form.LNom) & (db.usuarios.password == form.LPsw)).select()
	if len(row)== 0:
		response.view = "JugadorController/login.html"
		return dict(LNom=form.LNom,LPsw=form.LPsw,LError='Usuario no registrado / Ingreso mal sus datos')
	else:
		response.view = "JugadorController/login.html"
		session.id=row[0].id
   		session.jugador=row[0].nombre
   		return dict(LNom=form.LNom,LPsw=form.LPsw,LError='Bienvenido')

def registro(): 
    response.view = "JugadorController/registro.html"
    return dict(nombre='',email='',psw='',Error='',EError='')

def registroCompleto():
	form = request.post_vars
	nick = db(db.usuarios.nombre == form.Nom).select()
	corr = db(db.usuarios.correo == form.Eml).select()
	if (len(nick) == 0) and (len(corr) == 0):
		db.usuarios.insert(nombre=form.Nom,correo=form.Eml,password=form.Pas)
		response.view = "JugadorController/registro.html"
   		session.jugador=form.Nom
		return dict(nombre='',email='',psw='',Error='Registro Exitoso!',EError='')
	elif (len(corr) == 0):
		response.view = "JugadorController/registro.html"
		return dict(nombre=form.Nom,email=form.Eml,psw=form.psw,Error='Nombre ya existe',EError='')
	elif (len(nick) == 0):
		response.view = "JugadorController/registro.html"
		return dict(nombre=form.Nom,email=form.Eml,psw=form.psw,Error='',EError='Correo ya esta registrado')

	else:
		response.view = "JugadorController/registro.html"
		return dict(nombre=form.Nom,email=form.Eml,psw=form.psw,Error='El Nombre ya existe',EError='el Correo ya esta registrado')	


def recuperar():
	response.view= "JugadorController/recuperar.html"
	return dict(nombre='',Error='')

def mensaje():
	datos = request.post_vars
	row = db(db.usuarios.correo == datos.rEm).select()
	if len(row)==0:
		response.view= "JugadorController/recuperar.html"
		return dict(nombre='',Error='Correo Erroneo')
	else:
		response.view= "JugadorController/login.html"
		usuario = dict(row=row)
		for dato in row:
			contra = dato.password
			email = dato.correo
		sender = 'projectonepm@gmail.com'
		login = 'projectonepm@gmail.com:demos2016'
		send_test_to = email
		mail.settings.tls = True
		server = '{0}{1}{2}'.format('smtp.', 'gmail.com', ':465')
		mail.settings.server = server
		mail.settings.sender = sender
		mail.settings.login = login
		mail.send(to=[send_test_to],
            subject='Recuperar Contraseña',
            
            message='Su contraseña es: ' + contra)     
		return dict(nombre='',Error='',LError='',LNom='',LPsw='')


def registrarPuntaje():
	puntaje= request.vars.puntaje
	descJuego=request.vars.juego
	fecha_actual=request.vars.fecha
	if session.id!=None:
		row=db.puntaje.insert(idUser=session.id,descJuego=descJuego,puntaje=puntaje,tiempo=0,fecha=fecha_actual)
	
	return(fecha_actual)

def ranking():

	row=db.executesql("SELECT usuarios.nombre,SUM(puntaje) AS 'puntaje',tiempo FROM puntaje INNER JOIN usuarios ON puntaje.idUser=usuarios.id GROUP BY idUser ORDER by puntaje DESC LIMIT 10")
	return dict(ranking=row)

def perfil():
	row=db.executesql("SELECT nombre,correo FROM USUARIOS WHERE id="+str(session.id))
	return dict(usuario=row)

def cerrar():
	session.jugador=None
	redirect(URL('HomeController','index'))
	return dict()