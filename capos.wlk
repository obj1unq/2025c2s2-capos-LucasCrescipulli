object rolando {
    const mochila = #{}
    var tamañoMochila = 2
    method encontrarArtefacto(artefacto){
        if (mochila.size() < tamañoMochila){
            mochila.add(artefacto)  
        }
    }
    method tamañoMochila(_tamañoMochila){
        tamañoMochila = _tamañoMochila
    }
    method mochila() = mochila 
}

object espadaDelDestino{

}

object libroDeHechizos{

}

object collarDivino{

}

object armaduraDeAceroValyrio{

}