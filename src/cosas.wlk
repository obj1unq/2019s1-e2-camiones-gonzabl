object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	
	method bulto() = 1
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto() = 2
}

object paqueteDeLadrillos {
	var property cantDeLadrillos
	
	method peso(){return 2 * cantDeLadrillos} 
	
	method nivelPeligrosidad()= 2
	
	method bulto(){
		return if(self.cantDeLadrillos().between(1,100)){1}
				else{ if(self.cantDeLadrillos().between(101,300)){2}
						else{3}
				}
	}
}

object arenaGranel{
	var property peso=0
	
	method nivelPeligrosidad()= 1
	
	method bulto() = 1
}

object bateriaAntiarea{
	var tieneMisiles = true
	
	method peso(){
		return if (tieneMisiles){300}else{200}
	}
	
	method nivelPeligrosidad(){
		
		return if(tieneMisiles){100}else{0}
	}
	
	method modificarMisiles(){ tieneMisiles = not tieneMisiles }
	
	method bulto(){
		return if(tieneMisiles){1}else{2}
	}
}

object contenedorPortuario{
	
	var contenedor = []
	
	method anadir(unCosa){
		contenedor.add(unCosa)
	}
	
	method quitar(unCosa){
		contenedor.remove(unCosa)
	}
	
	method peso(){
		return 100 + contenedor.map({cosa => cosa.peso()}).sum()
	}
	
	method nivelPeligrosidad(){
		return if(contenedor.isEmpty()){0}else{contenedor.map({cosa=> cosa.nivelPeligrosidad()}).max()}
	}
	
	method bulto(){
		return 1 + contenedor.map({cosa => cosa.bulto()}).sum()
	}
}
object  residuosRadioactivos{
	var property peso 
	
	method nivelPeligrosidad()= 200
	
	method bulto() = 1
}

object embalajeDeSeguridad{
	var property cosa
	
	method peso(){
		return cosa.peso()
	}
	
	method nivelPeligrosidad(){
		return cosa.nivelPeligrosidad() / 2
	}
	
	method bulto() = 2
}