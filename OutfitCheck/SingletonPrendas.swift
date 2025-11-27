//
//  SingletonPrendas.swift
//  OutfitCheck
//
//  Created by Máster Móviles on 28/11/25.
//

import Foundation

class GestorPrendas {
    static let shared = GestorPrendas()
    
    private init() {
        cargarPrendas()
    }
    
    var todasLasPrendas: [Prenda] = []
    
    private func cargarPrendas() {
        todasLasPrendas = [
            Prenda(id: 1, nombre: "Camiseta blanca", foto: "camiseta1", color: "Blanco", temporada: .verano, descripcion: ""),
            Prenda(id: 2, nombre: "Vaqueros azules", foto: "vaqueros1", color: "Azul", temporada: .entretiempo, descripcion: ""),
            // ... más prendas
        ]
    }
    
    func añadirPrenda(_ prenda: Prenda) {
        todasLasPrendas.append(prenda)
    }
    
    func eliminarPrenda(id: Int) {
        todasLasPrendas.removeAll { $0.id == id }
    }
}
