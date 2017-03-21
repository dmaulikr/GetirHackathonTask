//
//  Circle.swift
//  GetirHackathon
//
//  Created by Feridun Erbaş on 21/03/2017.
//  Copyright © 2017 Feridun Erbas. All rights reserved.
//

import UIKit
class Circle: Shape {
    
    private var _r: CGFloat
    
    var r: CGFloat{
        
        return _r
        
    }
    
    init(color:String, xPosition: CGFloat, yPosition: CGFloat, r: CGFloat){
        
        _r = r
        
        super.init(color: color, xPosition: xPosition, yPosition: yPosition)
         
    }
    
    convenience init?(json: [String: Any]){
        
        guard
            
            let r = json["r"] as? CGFloat,
            
            let xPosition = json["xPosition"] as? CGFloat,
        
            let yPosition = json["xPosition"] as? CGFloat,
        
            let color = json["color"] as? String
        
        else{
                
            return nil
                
        }
        
        self.init(color:color, xPosition: xPosition, yPosition: yPosition, r: r)
        
    }

}
