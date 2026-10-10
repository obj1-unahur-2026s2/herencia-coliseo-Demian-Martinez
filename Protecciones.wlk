import Gladiadores.*

class Protecciones{
  method valorDeProteccion(gladiador)
}

class Cascos inherits Protecciones{
  override method valorDeProteccion(gladiador){
    return 10
  }
}

class Escudos inherits Protecciones{
  override method valorDeProteccion(gladiador){
    return 5 + gladiador.destreza() * 0.1
  }
}