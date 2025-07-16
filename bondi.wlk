object bondi{
  var max_personas = 20
  var max_tanque = 15
  var tanque = 15
  const gasto = 1
  var suben = 0
  var rumbo = 0
  var pasajerosb = 0
  var paradaActual = 0

  method consumoPa() {
    return gasto + 0.1 * pasajerosb
  }
  
  method cant_pasajeros(){
    return pasajerosb
  }

  method avanzar(ruta){
    if (tanque >= self.consumoPa()) {
      tanque -= self.consumoPa()
      
      if (paradaActual != 0 && paradaActual != ruta.paradas() - 1) {
        suben = ruta.pasajerosPorParada().get(paradaActual)
        if (pasajerosb + suben <= max_personas) {
          pasajerosb += suben
          ruta.vaciarParada(paradaActual)
        }
      }
      
      if (rumbo == 0) {
        paradaActual += 1
      } else {
        paradaActual -= 1
      }
      
      if (paradaActual == ruta.paradas() - 1) {
        rumbo = 1
      } else if (paradaActual == 0) {
        rumbo = 0
      }
      
      return pasajerosb
    }
    return tanque
  }
  
  method terminal(){
    pasajerosb = 0
    tanque = 15
  }
  
  method paradaActual() = paradaActual
  method rumbo() = rumbo
}

class Ruta{
  var property paradas = (3.randomUpTo(7).round())
  const pasajerosPorParada = []
  var pasajerosRuta = 0

  method inicia() {
    paradas.times({ i => 
      var cantidadPasajeros = 0
      if (i != 0 && i != paradas - 1) {
        cantidadPasajeros = (1.randomUpTo(5).round())
      }
      pasajerosPorParada.add(cantidadPasajeros)
    })
    pasajerosRuta = pasajerosPorParada.sum()
  }

  method pasajerosPorParada() = pasajerosPorParada
  method totalPasajeros() = pasajerosRuta
  
  method vaciarParada(indice) {
    pasajerosPorParada.put(indice, 0)
  }
}