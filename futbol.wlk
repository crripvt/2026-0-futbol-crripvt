import jugadores.*
import artistas.*

object partido{
    method quienGana(local,visitante){

        const golesLocal= local.goles(visitante)
        const golesVisitante= visitante.goles(local)

        if(golesLocal>golesVisitante){
            return local
        } else if(golesLocal<golesVisitante){
                return visitante
            } else {
                return self.penales(local,visitante)
                }
    }

    method penales(local, visitante) = [local,visitante].anyOne()
}


object river{
    var socios = 150
    var dineroEnCaja = 1000000

    method dinero() = dineroEnCaja + socios *13000

    method goles(rival) = ((self.dinero() - rival.dinero()) / 1000000).roundUp()

    method concierto(artista){
        dineroEnCaja+=artista.recaudacion()
    }

    method hinchas()=10000 + socios * 2

    method capacidadOfensiva() = self.dinero()/1000000

}

object boca{
    const deudas=[1000]
    const ingresos=[2000000, 3000000]
    const jugadores=#{cachoPanceta,francoFranco}

    method hinchas()=54000

    method goles(rival) = (self.capacidadOfensiva()-rival.capacidadOfensiva()).div(3)+1

    method dinero()= ingresos.sum() - deudas.sum()

    method transferir(jugador){
        if(jugadores.contains(jugador)){
            jugadores.remove(jugador)
            ingresos.add(jugador.valor())
        }
    }

    method endeudarse(deudaNueva){
        deudas.add(deudaNueva)
    }

    method capacidadOfensiva()= if(self.estaEnMalMomento())25 else  40

    method estaEnMalMomento() = deudas.size()>2* ingresos.size()
}

object velez{
    const jugadores = []

    method dinero()= jugadores.map({jugador=>jugador.valor()}).sum()

    method goles(rival)= if(self.capacidadOfensiva()>rival.capacidadOfensiva()) 3 else 1

    method jugadorFigura() = jugadores.head()

    method capacidadOfensiva() = jugadores.filter({jugador=> jugador.habilidad().even()}).size()

    method hinchas() = self.jugadorFigura().habilidad() * 2000

    method diaDePractica() {
        jugadores.forEach({jugador=> jugador.entrenar()})
    }
}


object barracas{
    method goles(rival) = rival.goles(self)+1
    method capacidadOfensiva()=5
    method dinero() = 1000000
    method hinchas() = 800
}
