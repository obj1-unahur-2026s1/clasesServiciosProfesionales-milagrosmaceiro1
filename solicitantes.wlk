import profesionales.*
import universidad.*
import empresa.*

class Persona{
    const provincia

    method puedeSerAtendidaPor(unProfesional){
        return unProfesional.provinciasDondePuedeTrabajar().contains(provincia)
    }
}

class Institucion{
    const universidadesReconocidas

    method puedeSerAtendidaPor(unProfesional){
        return universidadesReconocidas.contains(unProfesional.universidad())
    }
}

class Club{
    const provincias

    method puedeSerAtendidaPor(unProfesional){
        return provincias.any({ p => unProfesional.provinciasDondePuedeTrabajar().contains(p)})
    }
}
