import wollok.vm.*
object rolando {
    const property mochila = #{}
    var tamañoMaximoMochila = 2
    const historialDeEncuentros = []
    var property poderBase = 6
    var property casa = castilloDePiedra
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
    method puedeVencerA(personaje){
        return self.poderDePelea() > personaje.poderBase()
    }
    method puedeConquistarLaMoradaDe(personaje){
        return self.puedeVencerA(personaje)
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
    var listaDeHechizos = []
    
    method utilizar(){
        if (not listaDeHechizos.isEmpty()){
            listaDeHechizos.remove(listaDeHechizos.first())
        }
    }
    method poderQueAportaA(personaje){
        if (listaDeHechizos.isEmpty()){
            return 0
        }
        else {
            return listaDeHechizos.first().poderQueAportaA(personaje)
        }
    }
    method listaDeHechizos(_listaDeHechizos){
        listaDeHechizos = _listaDeHechizos
    }
}
object bendicion{
    method poderQueAportaA(personaje){
        return 4
    }
}

object invisibilidad{
    method poderQueAportaA(personaje){
        return personaje.poderBase()
    }
}

object invocacion{
    method poderQueAportaA(personaje){
        return personaje.casa().artefactoMasPoderosoPara(personaje).poderQueAportaA(personaje)
    }
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
    method artefactoMasPoderosoPara(personaje){
        return almacenamiento.max({artefacto => artefacto.poderQueAportaA(personaje)})
    }
}

object caterina{
    var property poderBase = 28
    var property casa = fortalezaDeAcero
}

object archibaldo{
    var property poderBase = 16
    var property casa = palacioDeMarmol
}

object astra{
    var property poderBase = 14
    var property casa = torreDeMarfil
}

object fortalezaDeAcero{

}

object palacioDeMarmol{

}

object torreDeMarfil{

}
