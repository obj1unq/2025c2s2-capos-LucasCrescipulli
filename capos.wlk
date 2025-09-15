import wollok.vm.*
object rolando {
    const mochila = #{}
    var tamañoMaximoMochila = 2
    const historialDeEncuentros = []
    var poderBase = 6
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
    method mochila() = mochila 
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
    method poderBase(_poderBase) {
        poderBase = _poderBase
    }
    method poderDePelea(){
        return poderBase + self.poderDeArtefactos()
    }
    method poderDeArtefactos(){
        return mochila.sum({artefacto => artefacto.poderQueAporta()})
    }
    method historialDeEncuentros() = historialDeEncuentros
}

object espadaDelDestino{
    var vecesQueSeUtilizo = 0
    method utilizar(){
        vecesQueSeUtilizo += 1
    }
    method poderQueAporta(){
        return if (vecesQueSeUtilizo > 0){
            
        }
    }
}

object libroDeHechizos{

}

object collarDivino{

}

object armaduraDeAceroValyrio{

}

object castilloDePiedra{
    const almacenamiento = #{}
    method almacenar(conjuntoDeArtefactos){
        almacenamiento.addAll(conjuntoDeArtefactos)
    }
    method almacenamiento() = almacenamiento 
}