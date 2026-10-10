import Gladiadores.*
import Grupo_de_gladiadores.*

object coliseo{
  method curarGladiador(gladiador){
    gladiador.curar()
  }

  method curarGrupoDeGladiadores(grupo){
    grupo.curarGrupo()
  }

  method organizarPelea(grupo1, grupo2){
    grupo1.pelearRound(grupo2)
    grupo1.pelearRound(grupo2)
    grupo1.pelearRound(grupo2)
    grupo1.sumarUnaPeleaParticipada()
    grupo2.sumarUnaPeleaParticipada()
  }
}