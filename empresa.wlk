class Empresa {
    const honorarioReferencia
    const profesionales = []
    const clientes = #{}

    method contratar(unProfesional) {profesionales.add(unProfesional)}

    method cantidadQueEstudiaronEn(unaUniversidad) {
        return profesionales.count({ p => p.universidad() == unaUniversidad })
    }

    method profesionalesCaros() {
        return profesionales.filter({ p => p.honorariosPorHora() > honorarioReferencia })
    }

    method universidadesFormadoras() {
        return profesionales.map({ p => p.universidad() }).asSet()
    }

    method profesionalMasBarato() {
        return profesionales.min({ p => p.honorariosPorHora() })
    }

    method esDeGenteAcotada() {
        return profesionales.all({ p => p.provinciasDondePuedeTrabajar().size() <= 3 })
    }

    method puedeSatisfacer(unSolicitante) {
        return profesionales.any({ p => unSolicitante.puedeSerAtendidaPor(p) })
    }

    method profesionalesQuePuedenAtender(unSolicitante) {
        return profesionales.filter({ p => unSolicitante.puedeSerAtendidaPor(p) })
    }

    method darServicio(unSolicitante) {
        if(self.puedeSatisfacer(unSolicitante)) {
            const profesional = self.profesionalesQuePuedenAtender(unSolicitante).anyOne()
            profesional.cobrar(profesional.honorariosPorHora())
            clientes.add(unSolicitante)
        }
    }

    method cantidadDeClientes() {
        return clientes.size()
    }
    
    method tieneComoCliente(unSolicitante) {
        return clientes.contains(unSolicitante)
    }

    method esPocoAtractivo(unProfesional) {
        return unProfesional.provinciasDondePuedeTrabajar().all({ provincia => self.tieneReemplazoMasBarato(unProfesional, provincia) })
    }

    method tieneReemplazoMasBarato(unProfesional, unaProvincia) {
        return profesionales.any({ p =>
            p != unProfesional
            && p.provinciasDondePuedeTrabajar().contains(unaProvincia)
            && p.honorariosPorHora() < unProfesional.honorariosPorHora()
        })
    }
}