//
//  Menu.swift
//  SmartMenu1.0
//
//  Created by Mac on 12/1/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Menu: UIViewController {
    var name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressPedido(_ sender: Any) {
        self.performSegue(withIdentifier: "tolist", sender: nil)
//        let vc = self.storyboard?.instantiateViewController(identifier: "Pedir")as! Pedir
//        vc.codigo = name
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func pressHistorial(_ sender: Any) {
        self.performSegue(withIdentifier: "tohistorial", sender: nil)
//        let vc = self.storyboard?.instantiateViewController(identifier: "Historial")as! Historial
//        vc.codigo = name
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "tohistorial") {
            let vc = segue.destination as! Historial
            vc.codigo = name
        }
    }
}
