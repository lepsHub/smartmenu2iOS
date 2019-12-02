//
//  PedidoCollectionViewCell.swift
//  SmartMenu1.0
//
//  Created by Luis Enrique Purizaga Santos on 12/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class PedidoCollectionViewCell: UITableViewCell {
    var pedido = Pedido()
    
    @IBOutlet weak var nroPedido: UILabel!
    @IBOutlet weak var MontoTotal: UILabel!
    @IBOutlet weak var fecha: UILabel!
    
    func setCell(){
        fecha.text = pedido.fecha
        nroPedido.text = String(pedido.numPedido)
        MontoTotal.text = pedido.monto
    }
}
