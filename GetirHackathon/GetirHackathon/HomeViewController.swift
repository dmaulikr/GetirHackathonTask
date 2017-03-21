//
//  HomeViewController.swift
//  GetirHackathon
//
//  Created by Feridun Erbaş on 21/03/2017.
//  Copyright © 2017 Feridun Erbas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var shapes:[Shape] = []
    
    var shapeViews:[UIView] = []
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let manager = ShapesManager()

    @IBOutlet weak var labelMessage: UILabel!
    
  
    @IBAction func getShapesButtonTapped(_ sender: UIButton) {
        
        self.labelMessage.text = "..."
        
        let model = ShapeRequestModel(name: "Feridun Erbaş", email: "feridunerbas@gmail.com", gsm: "+905454091644")
        
        manager.getShapes(model: model) { (shapes, message) in
            
            print("Total shapes retrieved: ", shapes.count)
            
            print("Message: ", message)
            
            self.shapes = shapes
            
            self.labelMessage.text = message
            
            self.reloadShapeViews()
            
        }
        
    }
    
    
    private func reloadShapeViews(){
        
        var xMax:CGFloat = 0
        
        var yMax:CGFloat = 0
        
        for shapeView in self.shapeViews {
            
            shapeView.removeFromSuperview()
            
        }
        
        self.shapeViews = []
        
        
        for shape in self.shapes {
            
            let shapeView = UIView()
            
            shapeView.backgroundColor = shape.color
            
            if shape is Circle {
                
                let circle = shape as! Circle
                
                shapeView.frame = CGRect(x: circle.xPosition, y: circle.yPosition, width: circle.r * 2 , height: circle.r * 2)
                
                shapeView.layer.cornerRadius = circle.r
                
                shapeView.layer.masksToBounds = true
                
                
            }else if shape is Rectangle{
                
                let rectangle = shape as! Rectangle
                
                shapeView.frame = CGRect(x: rectangle.xPosition, y: rectangle.yPosition, width: rectangle.width , height: rectangle.height)
                
            }
            
            if xMax < shapeView.frame.origin.x + shapeView.frame.width{
                
                xMax = shapeView.frame.origin.x + shapeView.frame.width
                
            }
            
            if yMax < shapeView.frame.origin.y + shapeView.frame.height {
                
                yMax = shapeView.frame.origin.y + shapeView.frame.height
                
            }
            
            self.shapeViews.append(shapeView)
            
            self.scrollView.addSubview(shapeView)
            
        }
        
        self.scrollView.contentSize = CGSize(width: xMax, height: yMax)
        
    }
    
}
