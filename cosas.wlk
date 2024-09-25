object cosas {
    
}

// se usa Property si no me dicen como varia.
object knightRider{

    method peso() = 500

    method peligrosidad() = 10

    method bultos() = 1

    method consecuencia(){

    }
}

// - Es Valido usar dos return con IFELSE
// peso y peligrosidad DEPENDEN del atributo estaRobot
object bumblebee{

    var estaRobot = false

    method peso() = 800

    method estaRobot() = estaRobot

    method bultos() = 2

    method peligrosidad() {
        
        if (self.estaRobot())
            return 30
        else
            return 15
    }
    // - Para evitar el IF en caso de haber mas de 2
    // posibilidades, generalmente booleanas,
    // se pueden hacer 2 o mas objetos
    // que devuelvan el nivel de peligrosidad

    method transformar(){
        estaRobot = not estaRobot
    }

    method consecuencia(){
        self.transformar()
    }
}
// #####################
object paqueteLadrillos{

    var property cantidadLadrillos = 0

    method peso() = cantidadLadrillos * ladrillo.peso()

    method peligrosidad() = 2

    method bultos(){
        if (cantidadLadrillos.between(0, 100)) return 1
        if (cantidadLadrillos.between(101, 300)) return 2
        return 3
    }

    method consecuencia(){
        cantidadLadrillos += 12
    }

}
// #####################
object ladrillo{

    method peso() = 2

}
//  #####
object arenaAGranel{
    var property peso = 0 

    method peligrosidad() = 1
    
    method bultos() = 1

    method consecuencia(){
        peso = 0.max( self.peso() - 10 )
    }
}

object bateriaAntiAerea{
    var tieneMisiles = false

    method tieneMisiles() = tieneMisiles

    method cargaDescargaMisiles(){
        tieneMisiles = not tieneMisiles
    }

    // ALTERNATIVA aparte de los DOS RETURN
    // Operador ternario:
    method peso() = if(self.tieneMisiles()){300}else{200}
    

    method peligrosidad(){
        if (self.tieneMisiles())
            return 100
        else
            return 0
    }

    method bultos(){
        if (self.tieneMisiles()) return 2
        return 1
    }

    method consecuencia(){
        self.cargaDescargaMisiles()
    }
}

object contenedorPortuario{
    const cosas = []

    // Sumar todos los elementos si es lista de enteros
    // o tienen la posibilidad devuelven un entero
    //method peso() = 100 + cosas.fold({
    //    acum, cosa => acum + cosa.peso()
    //})

    method peso() = 100 + cosas.sum({c => c.peso()})


    method bultos() = 1 + cosas.sum({ c => c.bultos()})

    // max devuelve el objeto MAX que cumple condicion
    method peligrosidad() { 
        
        // Otra alternativa, como si fuese una exception
        // retorna solo una cosa
        if (cosas.isEmpty()) return 0 
        return cosas.max({cosa => cosa.peligrosidad()}).peligrosidad()

    }

    method consecuencia(){
        cosas.forEach({ c => c.consecuencia()})
    }
}

object residuosRadiactivos{
    var property peso = 0

    method peligrosidad() = 200

    method bultos() = 1
}

object embalajeDeSeguridad{
    // ES buena practica inicializarlo con un Objeto nuevo o existente
    var property interior = cosaAEnvolver

    method peso() = interior.peso()

    method peligrosidad() = interior.peso() * 0.5

    method bultos() = 2

}

object cosaAEnvolver{

    method peso() = 0

    method peligrosidad() = 0
}




