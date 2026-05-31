
class ProfesionalVinculado {
    const universidad

    method universidad() = universidad

    method honorariosPorHora() {
        return universidad.honorarioRecomendado()
    }

    method provinciasDondePuedeTrabajar() {
        return [universidad.provincia()]    
    }

    method cobrar(unImporte) {
        universidad.recibirDonacion(unImporte / 2)
    }
}

class ProfesionalAsociadoDelLitoral {
    const universidad

    method universidad() = universidad

    method honorariosPorHora() {
        return 3000
    }

    method provinciasDondePuedeTrabajar() {
        return ["Entre Rios", "Santa Fe", "Corrientes"]
    }

    method cobrar(unImporte) {
        asociacionDelLitoral.cobrar(unImporte)
    }
}

object asociacionDelLitoral {
    var totalRecaudado = 0

    method cobrar(unImporte) {
        totalRecaudado += unImporte
    }

    method totalRecaudado() = totalRecaudado
}

class ProfesionalLibre {
    const universidad
    const honorarios
    const provincias
    var totalRecaudado = 0


    method universidad() = universidad

    method honorariosPorHora() {
        return honorarios
    }

    method provinciasDondePuedeTrabajar() {
        return provincias
    }

    method agregarProvincia(unaProvincia){
        provincias.add(unaProvincia)
    }

     method cobrar(unImporte) {
        totalRecaudado += unImporte
    }

    method totalRecaudado() = totalRecaudado

    method pasarDinero(aQuien, unImporte) {
        totalRecaudado -= unImporte
        aQuien.cobrar(unImporte)
    }
}