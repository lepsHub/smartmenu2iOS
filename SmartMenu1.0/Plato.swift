//
//  Plato.swift
//  SmartMenu1.0
//
//  Created by Luis Enrique Purizaga Santos on 12/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

struct Plato {
    
    var codplato: Int
    var descripcionPlato: String
    var imagenPlato: String
    var nombrePlato: String
    var precio: Int
    var stock: Int
    var tipoPlato: Int
    
    init(){
        codplato = 0
        descripcionPlato = ""
        imagenPlato = ""
        nombrePlato = ""
        precio = 0
        stock = 0
        tipoPlato = 0
    }
    
    func toDict()->[String:Any]{
        return [
            "idPlato": self.codplato,
        ]
    }

}
