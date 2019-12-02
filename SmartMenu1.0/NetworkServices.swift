
import Foundation

class NetworkServices {
    
    static let sharedInstance = NetworkServices()
    
    // MARK: - LOGIN
    
    /**
     Web service which register user
     
     - Parameters:
     - id : ""
     - type : ""
     - firebaseToken : ""
     - deviceToken : ""
     - device : ""
     */
    
    // "/login" -> "/channel/prti/login/v1/login"
    
    func login(usuario: String, password: String, completionBlock: @escaping CompletionBlock) {
        
        var params: Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
        params["usuario"] = usuario  as AnyObject?
        params["password"] = password as AnyObject?
        
    
        
        NetworkManager.sharedInstance.callUrlWithCompletion(urlService: "http://localhost:8080/menu", url: "/login", params: params, completion: { (statusCode, data) in
            
            if let code: Int = statusCode as? Int{
                switch(code){
                case 200:
                    
                    let response = data as! Dictionary<String,AnyObject>
                    
                   
                    completionBlock(true as AnyObject, response as AnyObject)
                    break;
                default:
                    print("////////////////// ERROR EN EL SERVICIO //////////////////")
                    completionBlock(false as AnyObject, "No se pudo conectar con el servidor." as AnyObject)
                    break;
                }
            }else{
                completionBlock(false as AnyObject, "null" as AnyObject)
            }
            
        }, method: .post)
        
    }
    
    
    
}

