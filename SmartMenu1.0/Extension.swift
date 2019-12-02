//
//  Extension.swift
//  SmartMenu1.0
//
//  Created by Luis Enrique Purizaga Santos on 12/2/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissMe(animated: Bool, completion: (()->())?) {
        var count = 0
        if let c = self.navigationController?.viewControllers.count {
            count = c
        }
        if count > 1 {
            self.navigationController?.popViewController(animated: animated)
            if let handler = completion {
                handler()
            }
        } else {
            dismiss(animated: animated, completion: completion)
        }
    }
}
