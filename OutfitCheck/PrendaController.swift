//
//  PrendaController.swift
//  OutfitCheck
//
//  Created by Máster Móviles on 27/11/25.
//
import UIKit

class PrendaController : UIViewController {
    
    var prenda : Prenda!
    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblTemporada: UILabel!
    @IBOutlet weak var tvDescripcion: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard prenda != nil else {
            print("ERROR: prenda es nil")
            return
        }
        
        // mostrar datos
        self.title = prenda.nombre
        imgFoto.image = UIImage(named: prenda.foto)
        lblColor.text = "Color: \(prenda.color)"
        
        if let temp = prenda.temporada {
            lblTemporada.text = "Temporada: \(temp.rawValue)"
        } else {
            lblTemporada.text = "Temporada: No especificada"
        }
        
        tvDescripcion.text = prenda.descripcion ?? "Sin descripción"
    }
}
