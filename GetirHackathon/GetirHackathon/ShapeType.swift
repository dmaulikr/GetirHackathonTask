//
//  ShapeType.swift
//  GetirHackathon
//
//  Created by Feridun Erbaş on 21/03/2017.
//  Copyright © 2017 Feridun Erbas. All rights reserved.
//

import Foundation
enum ShapeType{
    
    case CIRCLE
    
    case RECTANGLE
    
    init?(strType: String?) {
        
        if strType == "circle" {
            
            self = .CIRCLE
            
        }else if strType == "rectangle" {
            
            self = .RECTANGLE
            
        }else{
            
            return nil
            
        }
        
    }
    
}
