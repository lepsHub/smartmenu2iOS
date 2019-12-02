//
//  ViewController.swift
//  SmartMenu1.0
//
//  Created by Mac on 11/22/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressEnter(_ sender: Any) {
        callLogin()
    }
    
    func callLogin(){
        if(!NetworkManager.isConnectedToNetwork()){
            
            AlertManager.sharedInstance.ShowAlertViewWithDecision(view: self, title: "Error de conexion", message: "Revisa tu conexion a internet", firstButtonnTitle: "Volver a intentarlo", secondButtonnTitle: "Cancelar", firstCompletion: {
                self.callLogin()
            }, secondCompletion: {})
            return
        }
        
        let user = txtUser.text!.trimmingCharacters(in: .whitespaces)
        Loader.sharedInstance.presentLoadView()
        
        NetworkServices.sharedInstance.login(usuario: user, password: txtPassword.text!) { (success, data) in
            
            if (success as! Bool) {
            let response = data as! Dictionary<String,AnyObject>
            let codmsj = response["codmsj"] as? Int
                if codmsj == 0{
//                    let usuario = response["usuario"] as? String
                    self.performSegue(withIdentifier: "tomenu", sender: nil)
                }else{
                    let mensaje = response["mensaje"] as? String
                    AlertManager.sharedInstance.ShowBasicAlertView(view: self, title: "Disculpe las molestias", message: mensaje ?? "Error generico")
                }
                
            } else {
//                let message = data as! String
                AlertManager.sharedInstance.ShowBasicAlertView(view: self, title: "Disculpe las molestias", message: "Error al conectarse")
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "tomenu") {
//            let vc = segue.destination as! Menu
//            vc.name = sender as! String
//        }
//    }
    
}

