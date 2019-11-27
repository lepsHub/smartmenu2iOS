//
//  PTAlertsManager.swift
//  Parati
//
//  Created by Smith Huamani on 3/05/18.
//  Copyright © 2018 Smith Huamani. All rights reserved.
//

import UIKit
import Foundation

typealias AlertCompletionBlock = () -> Void
typealias AlertWithDatePickerCompletionBlock = (String?) -> Void

class AlertManager {
    
    static let sharedInstance = AlertManager()
    
    var alertCompletion: AlertCompletionBlock!
    var alertDecisionCompletion1: AlertCompletionBlock!
    var alertDecisionCompletion2: AlertCompletionBlock!
    
    
    func ShowBasicAlertView(view: UIViewController,title:String, message:String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: R.string.localizable.ok().uppercased(), style: .default, handler: nil)
        alertController.addAction(defaultAction)
        view.present(alertController, animated: true, completion: nil)
    }
    
    func ShowAlertViewWithCallBack(view: UIViewController,title:String, message:String, buttonnTitle:String,completion: @escaping AlertCompletionBlock){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let aceptAction = UIAlertAction(title: buttonnTitle, style: .default ) { (action:UIAlertAction!) in
            completion()
        }
        alertController.addAction(aceptAction)
        
        view.present(alertController, animated: true, completion:nil)
    }
    
    func ShowAlertViewWithDecision(view: UIViewController? = nil, title:String, message:String, firstButtonnTitle:String, secondButtonnTitle:String, firstCompletion: @escaping AlertCompletionBlock, secondCompletion: @escaping AlertCompletionBlock){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: firstButtonnTitle, style: .default) { (action:UIAlertAction!) in
            firstCompletion()
        }
        alertController.addAction(firstAction)
        
        let secondAction = UIAlertAction(title: secondButtonnTitle, style: .default) { (action:UIAlertAction!) in
            secondCompletion()
        }
        
        alertController.addAction(secondAction)
        
        guard view != nil else {
            return
        }
        
        view?.present(alertController, animated: true, completion:nil)
    }
    
    func ShowAlertViewWithDatePicker(vc: UIViewController,title:String, message:String, firstButtonnTitle:String, firstCompletion: @escaping AlertWithDatePickerCompletionBlock){
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 70, width: vc.view.frame.size.width, height: 260))
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.minimumDate = Date()
        
        datePicker.addTarget(self, action: #selector(self.dateSelected(datePicker:)), for: UIControl.Event.valueChanged)
        
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .actionSheet)
        alertController.view.addSubview(datePicker)
        
        let recorderAction = UIAlertAction(title: firstButtonnTitle, style: .cancel) { (action) in
            let currentDateTime = self.dateSelected(datePicker: datePicker)
            firstCompletion(currentDateTime)
        }
        
        alertController.addAction(recorderAction)
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 390)
        alertController.view.addConstraint(height);
        
        vc.present(alertController, animated: true, completion: nil)
    }
    
    @objc func dateSelected(datePicker:UIDatePicker) -> String{
        
        let format = DateFormatter()
        format.dateFormat = R.string.localizable.dateFormat()
        format.locale = Locale(identifier: R.string.localizable.formateLocale())
        
        return format.string(from: datePicker.date)
    }
    
}
