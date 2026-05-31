class Universidad {
    const provincia
    const honorarioRecomendado
    var totalDonaciones = 0

    method provincia() = provincia

    method honorarioRecomendado() = honorarioRecomendado
    
    method recibirDonacion(unImporte) {
        totalDonaciones += unImporte
    }
    method totalDonaciones() = totalDonaciones
}