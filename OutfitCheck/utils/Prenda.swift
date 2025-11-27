//
//  Prenda.swift
//  OutfitCheck
//
//  Created by Máster Móviles on 27/11/25.
//

import UIKit

enum Temporada: String {
    case invierno = "Invierno"
    case verano = "Verano"
    case entretiempo = "Entretiempo"
}

struct Prenda {
    let id: Int
    let nombre: String
    let foto: String
    let color: String
    let temporada: Temporada?
    let descripcion: String?
    
    var temporadaTexto: String {
        return temporada?.rawValue ?? "No especificada"
    }
}
