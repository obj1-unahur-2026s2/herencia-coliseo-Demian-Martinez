import Gladiadores.*

class GruposDeGladiadores{
  const nombreDeGrupo
  const gladiadores
  var peleasParticipadas = 0

  method gladiadores(){
    return gladiadores
  }

  method agregarGladiadorAGrupo(gladiador){
    gladiadores.add(gladiador)
  }

  method quitarGladiadorDeGrupo(gladiador){
    gladiadores.remove(gladiador)
  }

  method elegirCampeon(){
    return gladiadores.filter({c => c.vida() > 0}).max({c => c.poderDeAtaque()})
  }

  method sumarUnaPeleaParticipada(){
    peleasParticipadas += 1
  }

  method curarGrupo(){
    gladiadores.forEach({g => g.curar()})
  }

  method pelearRound(rival){
    self.elegirCampeon().pelearRound(rival.elegirCampeon())
  }
}