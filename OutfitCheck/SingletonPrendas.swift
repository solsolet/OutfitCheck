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
            Prenda(id: 1, nombre: "Camisa blanca", foto: "camisaBlanca", color: "Blanco", temporada: .verano, descripcion: "Un básico que no puede faltar"),
            Prenda(id: 2, nombre: "Vaqueros azules", foto: "vaqueros", color: "Azul", temporada: .entretiempo, descripcion: "Pantalones todoterreno"),
            Prenda(id: 3, nombre: "Vestido rojo", foto: "vestidoRojo", color: "Rojo", temporada: Temporada.verano, descripcion: ""),
            Prenda(id: 4, nombre: "Jersey gris", foto: "jerseyGris", color: "Gris", temporada: Temporada.invierno,  descripcion: ""),
            Prenda(id: 5, nombre: "Falda vaquera", foto: "faldaVaquera", color: "Azul", temporada: Temporada.entretiempo, descripcion: ""),
            Prenda(id: 6, nombre: "Gabardina", foto: "gabardina", color: "Beige", temporada: Temporada.entretiempo, descripcion: "Para ser una chica misteriosa"),
            Prenda(id: 7, nombre: "Jersey navideño", foto: "jerseyNavidad", color: "Blanco", temporada: Temporada.invierno, descripcion: "Ho ho ho"),
            Prenda(id: 8, nombre: "Jersey gris", foto: "jerseyGris2", color: "Gris", temporada: Temporada.entretiempo, descripcion: "Tiene manga francesa, abrig lo justo y necesario, pero en invierno te pelas de frío y en verano de asas de calor"),
            Prenda(id: 9, nombre: "Jersey renos", foto: "jerseyRenos", color: "Azul", temporada: Temporada.invierno, descripcion: "Un jersey más de la colección de navidad, pero con diseños más modernos"),
            Prenda(id: 10, nombre: "Jersey pato", foto: "jerseyPato", color: "Gris", temporada: Temporada.entretiempo, descripcion: "Es un poco fresco, pero con una camiseta debajo te podría servir para el frío de otoño y invierno"),
            Prenda(id: 11, nombre: "Camisa Cuadros", foto: "camisaCuadros1", color: "Verde", temporada: .entretiempo, descripcion: "Un básico que no puede faltar"),
            Prenda(id: 12, nombre: "Camisa Cuadros", foto: "camisaCuadros2", color: "Rojo", temporada: .entretiempo, descripcion: "Genial para hacer cosplay de lenyador"),
            Prenda(id: 13, nombre: "Camisa Cuadros", foto: "camisaCuadros3", color: "Azul", temporada: .entretiempo, descripcion: ""),
            Prenda(id: 14, nombre: "Camiseta granate", foto: "camisetaGranate", color: "Granate", temporada: .entretiempo, descripcion: "perfecta para los días de lluvia, fácil de arremangarse y de lavar"),
            Prenda(id: 15, nombre: "Camiseta Tyler the Creator", foto: "camisetaTyler", color: "Blanco", temporada: .verano, descripcion: "Quien me vea con esto debe saber que mi gusto musical es superior al suyo"),
        ]
    }
    
    func añadirPrenda(_ prenda: Prenda) {
        todasLasPrendas.append(prenda)
    }
    
    func eliminarPrenda(id: Int) {
        todasLasPrendas.removeAll { $0.id == id }
    }
}
