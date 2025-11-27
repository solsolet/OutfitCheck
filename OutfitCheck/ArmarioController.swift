//
//  ArmarioController.swift
//  OutfitCheck
//
//  Created by Máster Móviles on 27/11/25.
//

import UIKit

class ArmarioController : UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabla: UITableView!
    var searchController: UISearchController!
    var miSpinner = UIActivityIndicatorView()
    
    var todasLasPrendas: [Prenda] = []
    var prendasFiltradas: [Prenda] = []
    
    let throttler = Throttler(minimumDelay: 0.5)  // delay en segundos
    
    func cargarDatosEjemplo() {
        todasLasPrendas = [
            Prenda(id: 1, nombre: "Camiseta blanca", foto: "camiseta1", color: "Blanco", temporada: Temporada.verano, descripcion: ""),
            Prenda(id: 2, nombre: "Vaqueros azules", foto: "vaqueros1", color: "Azul", temporada: Temporada.entretiempo, descripcion: ""),
            Prenda(id: 3, nombre: "Vestido rojo", foto: "vestido1", color: "Rojo", temporada: Temporada.verano, descripcion: ""),
            Prenda(id: 4, nombre: "Jersey negro", foto: "jersey1", color: "Negro", temporada: Temporada.invierno,  descripcion: ""),
            Prenda(id: 5, nombre: "Falda vaquera", foto: "falda1", color: "Azul", temporada: Temporada.entretiempo, descripcion: "")
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mi armario"
        
        self.tabla.dataSource = self
        self.tabla.delegate = self
        
        //cargarDatosEjemplo()
        todasLasPrendas = GestorPrendas.shared.todasLasPrendas
            
        prendasFiltradas = todasLasPrendas // INICIO: mostrar TODAS las prendas
        
        // Configurar barra de búsqueda
        self.searchController = UISearchController(searchResultsController: nil)
        //el delegate somos nosotros (ArmarioController)
        self.searchController.searchResultsUpdater = self
        //Configuramos el search controller
        self.searchController.obscuresBackgroundDuringPresentation = false // true si queremos mostrar resultados en  sitio distinto a la tabla
        self.searchController.searchBar.placeholder = "Buscar prenda..."
        //Añadimos la barra de búsqueda
        self.navigationItem.searchController = self.searchController
        // La barra se muestre siempre (incluso al hacer scroll)
        navigationItem.hidesSearchBarWhenScrolling = false
        
        //Colocar spinner
        miSpinner.hidesWhenStopped = true
        self.view.addSubview(miSpinner)
        miSpinner.center = self.view.center
        self.view.bringSubviewToFront(miSpinner)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        throttler.throttle {
            guard let textoBuscado = searchController.searchBar.text else { return }
            let textoBuscadoTrim = textoBuscado.trimmingCharacters(in: .whitespacesAndNewlines)
            
            print("texto buscado (con throttle): "+textoBuscadoTrim)
            
            DispatchQueue.main.async {
                self.miSpinner.startAnimating() // feedback visual
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Simula un pequeño delay (para ver el spinner)
                // Si está vacío o búsqueda es muy corta, mostrar todas
                if textoBuscadoTrim.isEmpty || textoBuscadoTrim.count < 3 {
                    self.prendasFiltradas = self.todasLasPrendas
                } else {
                    // Filtrar localmente
                    self.prendasFiltradas = self.todasLasPrendas.filter { prenda in
                        prenda.nombre.lowercased().contains(textoBuscadoTrim.lowercased()) ||
                        ((prenda.temporada?.rawValue.lowercased().contains(textoBuscadoTrim.lowercased())) != nil) ||
                        prenda.color.lowercased().contains(textoBuscadoTrim.lowercased())
                    }
                }
                
                print("Prendas filtradas: \(self.prendasFiltradas.count)")
                
                self.miSpinner.stopAnimating() // Parar spinner
                self.tabla.reloadData()        // Recargar tabla
            }
        }
    }
    
    // Todas las funciones de tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prendasFiltradas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaPrenda", for: indexPath)
        let prenda = prendasFiltradas[indexPath.row]
        
        celda.textLabel?.text = prenda.nombre
        celda.detailTextLabel?.text = "\(String(describing: prenda.temporada)) - \(prenda.color)"
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let object : String
//        
//        if let indexPath = self.tableView.indexPathForSelectedRow {
//            object = self.prendasFiltradas[indexPath.row].nombre
//        }
//        else {
//            let sc = self.searchController?.searchResultsController as! UITableViewController
//            object = self.searchController[(sc.tableView.indexPathForSelectedRow?.row)!]
//        }
//        print(object)
        
        let prendaSeleccionada = self.prendasFiltradas[indexPath.row]
        print("Seleccionaste: \(prendaSeleccionada.nombre)")
            
        // Conexión con el controlador detalle
        performSegue(withIdentifier: "detallePrenda", sender: prendaSeleccionada)
            
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detallePrenda") {
            if let prendaVC = segue.destination as? PrendaController {
                // Obtener el índice de la fila seleccionada
                if let indexPath = tabla.indexPathForSelectedRow {
                    // Pasa película completa
                    prendaVC.prenda = self.prendasFiltradas[indexPath.row]
                }
                
                
            }
        }
    }
}
