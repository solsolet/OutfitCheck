//
//  GaleriaController.swift
//  OutfitCheck
//
//  Created by Máster Móviles on 27/11/25.
//

import UIKit

private let reuseIdentifier = "fotoPrenda"

class GaleriaController: UICollectionViewController {
    
    @IBOutlet var galeria: UICollectionView!
    
    var prendas = [Prenda]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.title = "Galería"
        prendas = GestorPrendas.shared.todasLasPrendas
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if (segue.identifier == "detallePrenda") {
            if let prendaVC = segue.destination as? PrendaController,
               let prendaSeleccionada = sender as? Prenda {
                // Pasar la prenda
                prendaVC.prenda = prendaSeleccionada
                print("Navegando a: \(prendaSeleccionada.nombre)")
            }
        }
    }
    

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.prendas.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotoPrenda", for: indexPath) as! GaleriaViewCell
    
        // Configure the cell
        if let image = UIImage(named:self.prendas[indexPath.row].foto) {
            cell.imgFotoPrenda.image = image
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let prendaSeleccionada = prendas[indexPath.item]
        print("Seleccionaste: \(prendaSeleccionada.nombre)")
        
        // Navegar al detalle
        performSegue(withIdentifier: "detallePrenda", sender: prendaSeleccionada)
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
