# -*- coding: utf-8 -*-
# intente algo como
import smtplib

def login(): 
    response.view = "JugadorController/login.html"
    return dict(LError='',LNom='',LPsw='')


def loginCompleto():
	form = request.post_vars
	row = db((db.usuarios.nombre == form.LNom) & (db.usuarios.password == form.LPsw)).select()
	if len(row)== 0:
		response.view = "JugadorController/login.html"
		return dict(LNom=form.LNom,LPsw=form.LPsw,LError='Usuario no registrado / Ingreso mal sus datos')
	else:
		response.view = "JugadorController/login.html"
   		session.puntaje=0
   		session.jugador=form.LNom
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
		session.puntaje=0
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

def cerrar():
	session.jugador=None
	redirect(URL('HomeController','index'))
	return dict()