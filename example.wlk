class Armas{
  method valorDeAtaque()
}

class ArmasDeFilo inherits Armas{
  const filo
  const longitud

  override method valorDeAtaque(){
    return filo * longitud
  }
}

class ArmasContundentes inherits Armas{
  const peso

  override method valorDeAtaque(){
    return peso
  }
}

class Protecciones{
  method valorDeProteccion()
}

class Cascos inherits Protecciones{
  override method valorDeProteccion(){
    return 10
  }
}

class Escudos inherits Protecciones{
  override method valorDeProteccion(){
    return 5 + Gladiadores.destreza()
  }
}

class Gladiadores{
  var armaEquipada
  var cascoEquipado
  var escudoEquipado
  const destreza
  const fuerza
  var vida = 100

  method cambiarDeArma(nuevoArma){
    armaEquipada = nuevoArma
  }

  method valorDeArmadura(){
    return cascoEquipado.valorDeProteccion() + escudoEquipado.valorDeProteccion()
  }

  method destreza(){
    return destreza
  }

  method fuerza(){
    return fuerza
  }

  method cambiarCasco(nuevoCasco){
    cascoEquipado = nuevoCasco
  }

  method cambiarEscudo(nuevoEscudo){
    escudoEquipado = nuevoEscudo
  }

  method atacar(){}

  method defenderse(){}

  method vida(){
    return vida
  }
}

class Mirmillones inherits Gladiadores{
  override method destreza(){
    return 15
  }

  override method atacar(){
    Gladiadores.vida() - self.poderDeAtaque() - Gladiadores.valorDeArmadura()
  }

  method poderDeAtaque(){
    return Armas.valorDeAtaque() + fuerza
  }
}

class Dimachaerus inherits Gladiadores{
  const armasEquipadas
  override method fuerza(){
    return 10
  }

  override method atacar(){
    Gladiadores.vida() - (self.poderDeAtaque() - Gladiadores.valorDeArmadura())
  }

  method poderDeAtaque(){
    return armasEquipadas.sum({a => a.valorDeAtaque()})
  }
}

//const kratos = new Mirmillones(armaEquipada = espadasDelCaos, cascoEquipado = casquito, escudoEquipado = escudoDeValquiria, destreza = 15, fuerzaPromedio = 500)

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