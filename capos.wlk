object rolando {
    const mochila = #{}
    var tamañoMochila = 2
    const historialDeEncuentros = #{}
    method encontrarArtefacto(artefacto){
        if (mochila.size() < tamañoMochila){
            mochila.add(artefacto)
            historialDeEncuentros.add(artefacto)
        }
        else {
            historialDeEncuentros.add(artefacto)
        }
    }
    method tamañoMochila(_tamañoMochila){
        tamañoMochila = _tamañoMochila
    }
    method mochila() = mochila 
    method llegarACasa(){
        castilloDePiedra.almacenar(mochila)
        mochila.clear()
    }
    method posesiones(){
        return mochila.union(castilloDePiedra.almacenamiento())
    }
    method tieneArtefacto(artefacto){
        return self.posesiones().contains(artefacto)
    }
}

object espadaDelDestino{

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