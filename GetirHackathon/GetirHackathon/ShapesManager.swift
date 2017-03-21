//
//  SampleManager.swift
//  GetirHackathon
//
//  Created by Feridun Erbaş on 21/03/2017.
//  Copyright © 2017 Feridun Erbas. All rights reserved.
//

import Foundation

import Alamofire

class ShapesManager {
    
    func getShapes(model: ShapeRequestModel, onCompletion: @escaping (_ shapes: [Shape], _ message: String) -> Void) {
        
        let params = model.getRequestParams()
        
        Alamofire.request("https://getir-bitaksi-hackathon.herokuapp.com/getElements", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            guard
            
            response.error == nil,
            
            let json = response.result.value as? [String: Any],
            
            let elements = json["elements"] as? [[String: Any]],
            
            let message = json["msg"] as? String
            
            else{
                    
                onCompletion([], "Unexpected Error Occured")
                
                return
                    
            }
            
            var shapes: [Shape] = []
            
            for element in elements{
                
                guard
                    
                    let type = ShapeType.init(strType: element["type"] as? String)
                    
                else{
                    continue
                }
                
                switch type{
                    
                case .CIRCLE:
                    
                    if let newShape = Circle(json: element){
                        
                        shapes.append(newShape)
                        
                    }
                    
                case .RECTANGLE:
                    
                    if let newShape = Rectangle(json: element){
                        
                        shapes.append(newShape)
                        
                    }
                }
                
            }
            
            onCompletion(shapes, message)
            
            return
            
        }

    }
    
}
