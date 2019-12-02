//
//  List.swift
//  SmartMenu1.0
//
//  Created by Mac on 12/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class List: UIViewController,UITableViewDataSource,UITableViewDelegate,PlatoCollectionViewCellDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var arrayPlato = [Plato]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        callList()
        // Do any additional setup after loading the view.
    }
    
    func callList(){
        if(!NetworkManager.isConnectedToNetwork()){
            
            AlertManager.sharedInstance.ShowAlertViewWithDecision(view: self, title: "Error de conexion", message: "Revisa tu conexion a internet", firstButtonnTitle: "Volver a intentarlo", secondButtonnTitle: "Cancelar", firstCompletion: {
                self.callList()
            }, secondCompletion: {})
            return
        }
        
        Loader.sharedInstance.presentLoadView()
        
        NetworkServices.sharedInstance.list { (success, data) in
            if (success as! Bool) {
                let response = data as! [[String:Any]]
                
                self.arrayPlato.removeAll()
                
                for i in response {
                    
                    var plato: Plato = Plato()
                    
                    let data = i as Dictionary<String, AnyObject>
                    
                    if let value = data["codTipoPlato"] as? Int {
                        plato.codplato = value
                    }
                    
                    if let value = data["descripcionPlato"] as? String {
                        plato.descripcionPlato = value
                    }
                    
                    if let value = data["imagenPlato"] as? String {
                        plato.imagenPlato = value
                    }
                    
                    if let value = data["nombrePlato"] as? String {
                        plato.nombrePlato = value
                    }
                    self.arrayPlato.append(plato)
                }
                self.tableview.reloadData()
                
                
            } else {
                //                let message = data as! String
                AlertManager.sharedInstance.ShowBasicAlertView(view: self, title: "Disculpe las molestias", message: "Error al conectarse")
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPlato.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let discountCell = tableView.dequeueReusableCell(withIdentifier: "PlatoCollectionViewCell", for: indexPath) as! PlatoCollectionViewCell
        discountCell.platoCollectionViewCellDelegate = self
        discountCell.plato = arrayPlato[indexPath.row]
        discountCell.setCell()
        return discountCell
    }
    
    
}
