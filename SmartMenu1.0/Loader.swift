//
//  ULoaders.swift
//  Parati
//
//  Created by Smith Huamani on 2/05/18.
//  Copyright © 2018 Smith Huamani. All rights reserved.
//

import Foundation
import UIKit

class Loader {
    
    static let sharedInstance = Loader()
    var loaderImage: UIImageView = UIImageView()
    var loaderContainer: UIView! = UIView()
    
    func presentLoadView(){
        self.loaderContainer = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        self.loaderContainer.backgroundColor = UIColor.clear
        
        UIApplication.shared.keyWindow?.addSubview(self.loaderContainer)
        
        self.loaderImage = UIImageView()
        self.loaderImage.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 30, y: UIScreen.main.bounds.size.height / 2 - 30, width: 60, height: 60)
        self.loaderImage.contentMode = .scaleAspectFit
//        self.loaderImage.animationImages = [R.image.loader(),R.image.loader1(),R.image.loader2(),R.image.loader3(),R.image.loader4(),R.image.loader5(),R.image.loader6(),R.image.loader7(),R.image.loader8(),R.image.loader9(),R.image.loader10(),R.image.loader11()] as? [UIImage]
//        self.loaderImage.animationDuration = 0.850
//        self.loaderImage.animationRepeatCount = 0
        self.loaderImage.startAnimating()
        self.loaderContainer.addSubview(self.loaderImage)
    }
    
    func removeLoadView(){
        self.loaderImage.stopAnimating()
        self.loaderImage.removeFromSuperview()
        self.loaderContainer.removeFromSuperview()
    }
    
}
