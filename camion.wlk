object camion {
    const cosas = []

    method cargar(cosaACargar){
        cosas.add(cosaACargar)
    }

    method desacargar(cosaADesacargar){
        cosas.remove(cosaADesacargar)
    }

    method peso() = 1000 + cosas.sum({cosa => cosa.peso()})

    method todosPesosImpares(){
        return not cosas.any({ c => c.peso().even() })
      // Alternativa
     //   return cosas.all({ c => c.peso().odd() })  
    }

    method hayCosaConPeso( pesoABuscar ){
        return cosas.any({ cosa => cosa.peso() == pesoABuscar})

    }

    method primeraCosaConNivelDePeligrosidad( peligro ){
        return cosas.find({ c => c.peligrosidad() == peligro})
        // Sino encuentra tira Exception
    }

    method todasLasCosasConPeligro(peligro){
        return cosas.filter({c => c.peligrosidad() > peligro})
        // Devuelve un array vacio en caso de no encontrar
    }

    method todasLasCosasMasPeligrosasQue(unaCosa){
        return self.todasLasCosasConPeligro(unaCosa.peligrosidad())
    }

    method estaExcedido(){
        return self.peso() > 2500
    }

    method puedeCircularEnLaRuta(peligro){
        return not self.estaExcedido() and 
        self.hayCosaConPeligrosidad(peligro)
    }

    method hayCosaConPeligrosidad(peligro){
        return cosas.any({ cosa => cosa.peligrosidad() == peligro })
    }




}