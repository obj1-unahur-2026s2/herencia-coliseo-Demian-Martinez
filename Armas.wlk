class Armas{
  method valorDeAtaque()
}

class ArmasDeFilo inherits Armas{
  // El valor del filo es un numero entre 0 y 1
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