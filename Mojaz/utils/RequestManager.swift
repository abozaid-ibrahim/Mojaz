//
//  RequestManager.swift
//  Super Market
//
//  Created by mac on 11/27/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SystemConfiguration

class  RequestManager {
    
    
    
    static let  languageKey = "lang"
    
    
    static let noConnection  = "Check Your Internet Connection"
    fileprivate class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
    
    static func upload(actionName:String , params:[String:String],image:UIImage? ,respo: @escaping ([String: AnyObject])->()){

        
        if !isConnectedToNetwork() {
            Progress.hide()
            ZToast.alertFail(message: noConnection)
            return;
        }
        
        
        
        Progress.show(sender: self)
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                    if let _image = image {
                        if let imageData = UIImageJPEGRepresentation(_image, 0.25) {
                            multipartFormData.append(imageData, withName: "image", fileName:  "file.jpg", mimeType: "image/jpg")
                        }
                    }
                    
                for object in params{
                multipartFormData.append(object.value.data(using: String.Encoding.utf8)!, withName: object.key)
                }
                
        },
            to: constants.BASE_URL + actionName,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                    
                    
                    
                case .success(let upload, _, _):
                    
                    
                    upload.responseJSON {
                        response in
                        debugPrint(response)
                        if let dic = response.result.value as! [String:AnyObject]? {
                            DispatchQueue.main.async{
                                respo(dic)
                                
                            }
                        }
                        
                        
                    }
                case .failure(let encodingError):
                    Progress.hide()
                    print(encodingError)
                    ZToast.alert(message: "Failed connection with server !")
                    
                }
        }
        )
        
        
        
        
    }
    
    
    /*
    static func upload(actionName:String , params:[String:String],image:UIImage? ,respo: @escaping ([String: AnyObject])->()){
        var request = getRequest(ac: actionName)
        request.httpMethod = "POST"
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        print("\nPARAMS>>> \(params)\n")

        if let _image = image{
            
            if let imageData =  UIImageJPEGRepresentation(_image, 0.7){
                
                request.httpBody = createBody(parameters: params,
                                              boundary: boundary,
                                              data:imageData,
                                              mimeType: "image/jpg",
                                              key:"image",
                                              filename: "image.jpg")
                
            } else if let imageData =  UIImagePNGRepresentation(_image) {
                
                request.httpBody = createBody(parameters: params,
                                              boundary: boundary,
                                              data:imageData,
                                              mimeType: "image/png",
                                              key:"image",
                                              filename: "image.png")
            }
            
            
        }
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            
            logRequest(r:request,reponse: response,data: data)
            if data != nil {
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: AnyObject] {
                    
                    postResponse(response: dictionary, ui: respo)
                }
                
            }else{
                logErr(error: error!)
                
                
            }
        })
        task.resume()
        
        
        
        
    }
   */
    
    static func post(actionName:String , params:String! ,respo: @escaping ([String: AnyObject])->()){
      
        if !isConnectedToNetwork() {
            Progress.hide()
            ZToast.alertFail(message: noConnection)
            return;
        }
        var request  = getRequest(ac:actionName)
        if let p = params  {
            print("\nPARAMS>>> \(p)\n")

            request.httpBody = p.data(using: String.Encoding.utf8)
        }
        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            
            logRequest(r:request,reponse: response,data: data)
            if data != nil {
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [String: AnyObject] {
                    
                    postResponse(response: dictionary, ui: respo)
                    
                }
                
            }else{
                logErr(error: error!)
                
                
            }
        })
        task.resume()
        
        
    }
    
    
    static func getArray(actionName:String , params:String! ,respo: @escaping ([[String: AnyObject]])->()){
        
        if !isConnectedToNetwork() {
            Progress.hide()
            ZToast.alertFail(message: noConnection)
            return;
        }
        var request = getRequest(ac: actionName)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            logRequest(r:request,reponse: response,data: data)

            if let er = error    {
                Progress.hide()
                logErr(error: er)
                return
            }
            
            if data != nil {
                
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let dictionary = json as? [[String: AnyObject]] {
                   
                    
                    respo(dictionary)
                }
            }else{
                
                logErr(error: error!)
                
            }
        }
        
        task.resume()
        
        
    }
    
    
    
    private static func getRequest(ac:String)->URLRequest{
//        let url = constants.BASE_URL + ac;
        let url =  ac
        let geturl = URL(string: url)!
        var request = URLRequest(url: geturl)
        request.setValue(app.getLocale(), forHTTPHeaderField: languageKey)//"app.get
       // request.setValue(AcceptType, forHTTPHeaderField: Accept)
        request.httpShouldHandleCookies = true
        return request
        
    }
    
    static func get(actionName:String  ,respo: @escaping ([String: AnyObject])->()){
        if !isConnectedToNetwork() {
            Progress.hide()
            ZToast.alertFail(message: noConnection)
            return;
        }
        var request = getRequest(ac: actionName)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            logRequest(r:request,reponse: response,data: data)
            if data != nil {
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                
                if let dictionary = json as? [String: AnyObject] {
                    postResponse(response:dictionary,ui:respo)
                }
                
            }else{
                
                logErr(error: error!)
            }
        })
        task.resume()
        
        
    }
    
    static func delete(actionName:String  ,respo: @escaping ([String: AnyObject])->()){
        if !isConnectedToNetwork() {
            Progress.hide()
            ZToast.alertFail(message: noConnection)
            return;
        }
        var request = getRequest(ac: actionName)
        request.httpMethod = "DELETE"
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            logRequest(r:request,reponse: response,data: data)
            if data != nil {
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                
                if let dictionary = json as? [String: AnyObject] {
                    postResponse(response:dictionary,ui:respo)
                }
                
            }else{
                
                logErr(error: error!)
            }
        })
        task.resume()
        
        
    }
    
    
    
    
    static func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    
    
    private static func postResponse(response:[String:AnyObject],ui:@escaping ([String: AnyObject])->()){
        DispatchQueue.main.async {
                Progress.hide()
                ui(response)
        }
    }
    fileprivate static func logErr(error:Error){
        
        Progress.hide()
        let errorlog = "\n\n?????????????????? (( RESPONSE IS NULL ))??????????????????????\n \(error)"
        print(errorlog)
        ZToast.showFail(message:error.localizedDescription)
        
        
        
        
    }
    
    fileprivate static func logRequest(r:URLRequest,reponse:URLResponse? , data:Data?){
        print("=========================================================")
        print("=======================REQUEST==========================")
        print("\nREQUEST DESCRIPTION>>> \(r.debugDescription)\n")
        print("\nREQUEST httpMethod>>> \(String(describing: r.httpMethod))\n")

        print("\nREQUEST allHTTPHeaderFields >>> \(String(describing: r.allHTTPHeaderFields))\n")
        
        
        print("--------------------RESPONSE------------------------")
        if let res = reponse {
            print("response>> \(res)")
            if let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
                print("data>> \n\(String(describing: responseString))\n")
            }
        }
        
        
        
       
        
    }
    
    
    
 
    
    
    fileprivate static func createBody(parameters: [String: String],
                           boundary: String,
                           data: Data,
                           mimeType: String,
                           key:String,
                           filename: String) -> Data {
        let body = NSMutableData()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
        for (key, value) in parameters {
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString("\(value)\r\n")
        }
        
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }
    
    
}



extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}


