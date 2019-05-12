import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(cosa){
		cosas.remove(cosa)
	}
	
	method pesoTotal(){
		return 1000 + cosas.map({unaCosa => unaCosa.peso()}).sum()
	}
	
	method excedidoDePeso(){
		return self.pesoTotal() > 2500
	}
	
	method objetosPeligrosos(nivel){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all({unaCosa => unaCosa.nivelPeligrosidad() < nivelMaximoPeligrosidad})
	}
	
// AGREGADOS AL CAMION

	method tieneAlgoQuePesaEntre(min,max){
		return cosas.any({unaCosa=> unaCosa.peso().between(min,max)})
	}
	
	method cosaMasPesada(){
		return cosas.max({unaCosa => unaCosa.peso()})
	}
	
	method totalBultos(){
		return cosas.sum({unaCosa => unaCosa.bulto()})
	}
	
	method pesos(){
		return cosas.map({unaCosa => unaCosa.peso()})
	}
}
