object cachoPanceta {
  method valor() = 8000000
  method habilidad() = 8
  method entrenar() {}
}

object elPerroGutierrez {
  var estaLesionado = false
  method valor() = 5000000
  method habilidad() = if (estaLesionado) 0 else 9
  method entrenar() {
    estaLesionado = true
  }
}

object miguelFugaz {
  var partidosJugados = 30
  method jugarUnPartido() { partidosJugados += 1 }
  method valor() = partidosJugados * 100000
  method habilidad() = 6 * partidosJugados
  method entrenar(){
    self.jugarUnPartido()
  }
}

object francoFranco {
  var edad = 36
  method cumplirAnios() { edad += 1 }
  method valor() = (40 - edad) * 500000
  method habilidad() = 7 
  method entrenar() {
    self.cumplirAnios()
  }
}
