//
//  Element.swift
//  GetirHackathon
//
//  Created by Feridun Erbaş on 21/03/2017.
//  Copyright © 2017 Feridun Erbas. All rights reserved.
//

import UIKit

class Shape{
    
    private var _xPosition: CGFloat
    
    var xPosition: CGFloat{
        
        return _xPosition
        
    }
    
    private var _yPosition: CGFloat
    
    var yPosition: CGFloat{
        
        return _yPosition
        
    }

    private var _color: String
    
    var color: UIColor{
        
        return UIColor.colorFrom(hex: _color)
        
    }
    
    init(color:String, xPosition: CGFloat, yPosition: CGFloat) {
        
        self._xPosition = xPosition
        
        self._yPosition = yPosition
        
        self._color = color
        
    }

}
