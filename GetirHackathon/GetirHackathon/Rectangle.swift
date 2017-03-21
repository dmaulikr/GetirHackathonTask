//
//  Rectangle.swift
//  GetirHackathon
//
//  Created by Feridun Erbaş on 21/03/2017.
//  Copyright © 2017 Feridun Erbas. All rights reserved.
//

import UIKit

class Rectangle: Shape {
    
    private var _width: CGFloat
    
    var width: CGFloat{
        
        return _width
        
    }
    
    private var _height: CGFloat
    
    var height: CGFloat{
        
        return _height
        
    }
    
    init(color:String, xPosition: CGFloat, yPosition: CGFloat, width: CGFloat, height: CGFloat){
        
        _width = width
        
        _height = height
        
        super.init(color: color, xPosition: xPosition, yPosition: yPosition)
        
    }
    
    convenience init?(json: [String: Any]){
        
        guard
            
            let width = json["width"] as? CGFloat,
            
            let height = json["height"] as? CGFloat,
            
            let xPosition = json["xPosition"] as? CGFloat,
            
            let yPosition = json["xPosition"] as? CGFloat,
            
            let color = json["color"] as? String
            
            else{
                
                return nil
                
        }
        
        self.init(color:color, xPosition: xPosition, yPosition: yPosition, width: width, height: height)
        
    }
    
}
