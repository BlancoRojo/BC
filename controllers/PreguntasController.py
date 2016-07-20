# -*- coding: utf-8 -*-
# intente algo como
from gluon.serializers import json
import random

def index():
   	response.view='PreguntasController/index.html'
   	return dict()
	
def seleccionar_pregunta():
	respuesta={}
	resultado=[] 
	result_categoria = db().select(db.categorias.ALL)
	resul_categoria = []
	resul_categoria.append(result_categoria[random.randint(0,len(result_categoria)-1)])
	
 	categoria = {'idCat': resul_categoria[0].id, 'descCat': resul_categoria[0].descripcion}
 	
	result_pregunta = db(db.preguntas.idCat == resul_categoria[0].id ).select()
	resul_pregunta = []
	resul_pregunta.append(result_pregunta[random.randint(0,len(result_pregunta)-1)])
	
	pregunta = {'idPreg': resul_pregunta[0].id, 'descPreg': resul_pregunta[0].descripcion, 'imagen':resul_pregunta[0].imagen}
	resul_respuesta=db.executesql('SELECT id,descripcion FROM respuestapreguntas WHERE idPreg='+str(pregunta['idPreg']))
	x=0
	for row in resul_respuesta:
	 	respuesta['idResp'+str(x)] = row[0] 
	 	respuesta['descResp'+str(x)] = row[1]
	 	x=x+1

 	resultado.append(categoria)
 	resultado.append(pregunta)
 	resultado.append(respuesta)
 
 	return response.json(resultado)


def verificar_respuesta():
	idPreg= request.vars.idPreg
	resp_usuario= request.vars.resp

	opcion=db.executesql('SELECT descripcion from respuestapreguntas WHERE opcion="V" AND idPreg='+str(idPreg))
	for resp in opcion:
		if str(resp[0])==resp_usuario:
			respuesta='V'
		else:
			respuesta='F'

 	return (respuesta)




	









