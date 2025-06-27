object bondi{
  var max_personas = 20
  var max_tanque = 15
  var tanque = 15
  const gasto = 1
  var suben = 0
  var rumbo = 0
  var pasajerosb = 0

  method consumoPa() {
    return gasto + 0.1 * pasajerosb
  }
  method cant_pasajeros(){
    return pasajerosb
  }

  method detenerse(ruta, paradas){
    if (tanque >= self.consumoPa()) {
      tanque -= self.consumoPa()
      suben = ruta.pasajerosPorParada().get(paradas)
      if (pasajerosb + suben <= max_personas) {
        pasajerosb += suben
        console.println(Ruta.paradas() - 1)
      }
      return pasajerosb
    }
    return tanque
  }
  
  method terminal(){
    pasajerosb = 0
    tanque = 15
    rumbo += 1
  }
}
class Ruta{
  var property paradas = (1.randomUpTo(7).round())
  const pasajerosPorParada = []
  var pasajerosRuta = 0

  method inicia() {
    paradas.times({ i => 
      const cantidadPasajeros = (1.randomUpTo(5).round())
      pasajerosPorParada.add(cantidadPasajeros)
    })
    pasajerosRuta = pasajerosPorParada.sum()
  }

  method pasajerosPorParada() = pasajerosPorParada
  method totalPasajeros() = pasajerosRuta
}

class Parada{
  var property pasajerosp = (1.randomUpTo(5).round())
}


object simulador{
  method simular(parada){
    const cantidadParadas = parada.cantparadas()
    cantidadParadas.times({ i => 
    bondi.detenerse(ruta, paradas)
    })
  }
}

//crear el objeto ruta para poder usar sus metodos
//var hola = new Ruta()