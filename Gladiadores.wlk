import Armas.*
import Protecciones.*
import Grupo_de_gladiadores.*

class Gladiadores{
  var cascoEquipado
  var escudoEquipado
  var vida = 100

  method defensa()

  method destreza()

  method fuerza()

  method cambiarCasco(nuevoCasco){
    cascoEquipado = nuevoCasco
  }

  method cambiarEscudo(nuevoEscudo){
    escudoEquipado = nuevoEscudo
  }

  method cambiarDeArma(nuevoArma, armaAQuitar)

  method atacar(objetivo){
    self.recibirAtaque(objetivo)
  }

  method recibirAtaque(enemigo){
    vida -= enemigo.poderDeAtaque() - self.defensa()
  }

  method vida(){
    return vida
  }

  method poderDeAtaque()

  method crearGrupoConOtroGladiador(otroGladiador)

  method curar(){
    vida = 100
  }

  method pelearRound(rival){
    self.elegirCampeon().atacar(rival.elegirCampeon())  
  }

  method elegirCampeon(){
    return self
  }
}

class Mirmillones inherits Gladiadores{
  /** Los mirmillones pelean en general con una espada o gladius, y un escudo
  o casco*/
  
  var armaEquipada
  var fuerza

  override method fuerza(){
    return fuerza
  }
  
  method cambiarFuerza(nuevaFuerza){
    fuerza = nuevaFuerza
  }

  override method destreza(){
    return 15
  }

  override method defensa(){
    return cascoEquipado.valorDeProteccion() + 
    escudoEquipado.valorDeProteccion() + 
    self.destreza()
  }

  override method cambiarDeArma(nuevoArma, armaAQuitar){
    armaEquipada = nuevoArma
  }

  override method atacar(objetivo){
    objetivo.recibirAtaque(self)
    super(objetivo)
  }

  override method poderDeAtaque(){
    return armaEquipada.valorDeAtaque() + fuerza
  }

  override method crearGrupoConOtroGladiador(otroGladiador){
    const grupoDeMirmillones = new GruposDeGladiadores(
      gladiadores = [self, otroGladiador],
      nombreDeGrupo = "mirmillolandia"
      )
  }
}

class Dimachaerus inherits Gladiadores{
  const armasEquipadas
  var destreza

  override method fuerza(){
    return 10
  }

  override method destreza(){
    return destreza
  }

  override method defensa(){
    return destreza / 2
  }

  override method cambiarDeArma(nuevoArma, armaAQuitar){
    armasEquipadas.remove(armaAQuitar)
    armasEquipadas.add(nuevoArma)
  }

  override method atacar(objetivo){
    objetivo.recibirAtaque(self)
    destreza += 1
    super(objetivo)
  }

  override method poderDeAtaque(){
    return armasEquipadas.sum({a => a.valorDeAtaque()}) + self.fuerza()
  }

  override method crearGrupoConOtroGladiador(otroGladiador){
    const grupoDeDimachaerus = new GruposDeGladiadores(
      gladiadores = [self, otroGladiador],
      nombreDeGrupo = "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque())
      )
  }
}

//const kratos = new Mirmillones(armaEquipada = espadasDelCaos, cascoEquipado = casquito, escudoEquipado = escudoDeValquiria, destreza = 15, fuerzaPromedio = 500)
/*
const kratos = new Dimachaerus(
    armaEquipada = espadasDelCaos,
    armasEquipadas = [espadasDelCaos], 
    cascoEquipado = casquito, 
    escudoEquipado = escudoDeValquiria, 
    destreza = 15, 
    fuerza = 500
  )
const espadasDelCaos = new ArmasDeFilo(filo = 1, longitud = 3)
const escudoDeValquiria = new Escudos()
const casquito = new Cascos()
*/