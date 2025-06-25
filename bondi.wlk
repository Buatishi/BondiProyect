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

  method detenerse(){
    if (tanque >= self.consumoPa()) {
      tanque -= self.consumoPa()
      suben = Parada.pasajerosp()
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
  var pasajerosRuta = Parada.pasajerosp() * paradas

}

class Parada{
  const pasajerosunicos = []
  var property pasajerosp = (1.randomUpTo(5).round())

  
}

object simulador{
  method simular(parada){
    const cantidadParadas = parada.cantparadas()
    cantidadParadas.times({ i => 
      bondi.detenerse()
    })
  }
}