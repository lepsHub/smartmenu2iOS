//
//  Historial.swift
//  SmartMenu1.0
//
//  Created by Mac on 12/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Historial: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var codigo: String = ""

    @IBOutlet weak var tableview: UITableView!
    var arrayPedido = [Pedido]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        callHistory()
        // Do any additional setup after loading the view.
    }
    
    func callHistory(){
        if(!NetworkManager.isConnectedToNetwork()){
            
            AlertManager.sharedInstance.ShowAlertViewWithDecision(view: self, title: "Error de conexion", message: "Revisa tu conexion a internet", firstButtonnTitle: "Volver a intentarlo", secondButtonnTitle: "Cancelar", firstCompletion: {
                self.callHistory()
            }, secondCompletion: {})
            return
        }
        
        Loader.sharedInstance.presentLoadView()
        
       NetworkServices.sharedInstance.historial(usuario: codigo
       ) { (success, data) in
            if (success as! Bool) {
                let response = data as! Dictionary<String,AnyObject>
                
                self.arrayPedido.removeAll()
                
                 let listSource = NSMutableArray(array: response["historial"] as! NSArray)
                
                for i in listSource {
                    
                    var pedido: Pedido = Pedido()
                    
                    let data = i as! Dictionary<String, AnyObject>
                    
                    if let value = data["numPedido"] as? Int {
                        pedido.numPedido = value
                    }
                    
                    if let value = data["monto"] as? String {
                        pedido.monto = value
                    }
                    
                    if let value = data["fecha"] as? String {
                        pedido.fecha = value
                    }
                    
                    self.arrayPedido.append(pedido)
                }
                self.tableview.reloadData()
                
                
            } else {
                //                let message = data as! String
                AlertManager.sharedInstance.ShowBasicAlertView(view: self, title: "Disculpe las molestias", message: "Error al conectarse")
            }
        }

    }
    

    @IBAction func pressBack(_ sender: Any) {
        dismissMe(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPedido.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let discountCell = tableView.dequeueReusableCell(withIdentifier: "PedidoCollectionViewCell", for: indexPath) as! PedidoCollectionViewCell
        discountCell.pedido = arrayPedido[indexPath.row]
        discountCell.setCell()
        return discountCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}
