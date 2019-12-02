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
    }
    
    
    @IBAction func pressHistorial(_ sender: Any) {
        self.performSegue(withIdentifier: "tohistorial", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
