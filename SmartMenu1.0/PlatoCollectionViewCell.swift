//
//  PlatoCollectionViewCell.swift
//  SmartMenu1.0
//
//  Created by Luis Enrique Purizaga Santos on 12/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SDWebImage


protocol PlatoCollectionViewCellDelegate: NSObjectProtocol {
    //    func gotoWeb(url: String)
}

class PlatoCollectionViewCell: UITableViewCell {
    weak var platoCollectionViewCellDelegate: PlatoCollectionViewCellDelegate?
    var plato = Plato()
    @IBOutlet weak var imgPlato: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var stock: UILabel!
    @IBOutlet weak var cant: UILabel!
    @IBOutlet weak var precio: UILabel!
    
    func setCell(){
        imgPlato.sd_setImage(with: URL(string: plato.imagenPlato))
        nombre.text = plato.nombrePlato
        
        if plato.stock == 0{
          stock.text = "No Disponible"
        }else{
           stock.text = "No Disponible"
        }
        
        cant.text = String(plato.stock)
        precio.text = String(plato.precio)
        
    }
    @IBAction func add(_ sender: Any) {
    }
    
    @IBAction func minus(_ sender: Any) {
    }
    
}
