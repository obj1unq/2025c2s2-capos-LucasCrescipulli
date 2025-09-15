import wollok.vm.*
object rolando {
    const property mochila = #{}
    var tamañoMaximoMochila = 2
    const historialDeEncuentros = []
    var property poderBase = 6
    var casa = castilloDePiedra
    method casa(_casa){
        casa = _casa
    }
    method encontrarArtefacto(artefacto){
        historialDeEncuentros.add(artefacto)
        if (mochila.size() < tamañoMaximoMochila){
            mochila.add(artefacto)
        }
    }
    method tamañoMochila(_tamañoMochila){
        tamañoMaximoMochila = _tamañoMochila
    }
    method llegarACasa(){
        casa.almacenar(mochila)
        mochila.clear()
    }
    method posesiones(){
        return mochila.union(casa.almacenamiento())
    }
    method tieneArtefacto(artefacto){
        return self.posesiones().contains(artefacto)
    }
    method poderDePelea(){
        return poderBase + self.poderDeArtefactos()
    }
    method poderDeArtefactos(){
        return mochila.sum({artefacto => artefacto.poderQueAportaA(self)})
    }
    method historialDeEncuentros() = historialDeEncuentros
    method pelearBatalla(){
        mochila.forEach({artefacto => artefacto.utilizar()})
        poderBase += 1
    }
}

object espadaDelDestino{
    var vecesQueSeUtilizo = 0
    method utilizar(){
        vecesQueSeUtilizo += 1
    }
    method poderQueAportaA(personaje){
        return if (vecesQueSeUtilizo == 0){
            personaje.poderBase() 
        } 
        else {
            personaje.poderBase() * 0.5
        }
    }
}

object libroDeHechizos{
    var vecesQueSeUtilizo = 0
    /* qué se hace con esto?
    var listaDeHechizos = [bendicion, invisibilidad, invocacion]
    */

    method utilizar(){
        vecesQueSeUtilizo += 1
    }
    method poderQueAportaA(personaje){

    }  
    
    // esto tiene sentido??? method bendicion{}
}

object collarDivino{
    var vecesQueSeUtilizo = 0
    method utilizar(){
        vecesQueSeUtilizo += 1
    }
    method poderQueAportaA(personaje){
        return if (personaje.poderBase() > 6){
            3 + vecesQueSeUtilizo
        }
        else {
            3
        }
    }
}

object armaduraDeAceroValyrio{
    var vecesQueSeUtilizo = 0
    method utilizar(){
        vecesQueSeUtilizo += 1
    }
    method poderQueAportaA(personaje){
        return 6
    }
}

object castilloDePiedra{
    const almacenamiento = #{}
    method almacenar(conjuntoDeArtefactos){
        almacenamiento.addAll(conjuntoDeArtefactos)
    }
    method almacenamiento() = almacenamiento 
}