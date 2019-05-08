object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var property cantDeLadrillos
	
	method peso(){return 2 * cantDeLadrillos} 
	
	method nivelPeligrosidad()= 2
}

object arenaGranel{
	var property peso=0
	
	method nivelPeligrosidad()= 1
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
	
	
	
}
object  residuosRadioactivos{
	var property peso 
	
	method nivelPeligrosidad()= 200
}

object embalajeDeSeguridad{
	var property cosa
	
	method peso(){
		return cosa.peso()
	}
	
	method nivelPeligrosidad(){
		return cosa.nivelPeligrosidad() / 2
	}
}