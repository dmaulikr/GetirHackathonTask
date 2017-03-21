//
//  SampleRequestModel.swift
//  GetirHackathon
//
//  Created by Feridun Erbaş on 21/03/2017.
//  Copyright © 2017 Feridun Erbas. All rights reserved.
//

import Foundation

class ShapeRequestModel {
    
    private var _name: String
    
    private var _gsm: String
    
    private var _email: String
    
    init(name: String, email: String, gsm: String) {
        
        _name = name
        
        _email = email
        
        _gsm = gsm
        
    }
    
    func getRequestParams() -> [String: Any] {
        
        var dic: [String: Any] = [:]
        
        dic["email"] = _email
        
        dic["name"] = _name
        
        dic["gsm"] = _gsm
        
        return dic
        
    }
    
      
}
