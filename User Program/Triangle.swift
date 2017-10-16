//
//  Triangle.swift
//  TestWindowApp
//
//  Created by Will Spurgeon on 6/20/16.
//  Copyright © 2016 Will Spurgeon. All rights reserved.
//

import AppKit

struct Triangle: Drawable, Hashable {
    let x1: Double
    let y1: Double
    let x2: Double
    let y2: Double
    let x3: Double
    let y3: Double
    
    var hashValue: Int{
        get{
            return "Triangle\(x1),\(y1),\(x1),\(y2),\(x3),\(y3)".hashValue
        }
    }
    
    init(x1:Double, y1:Double, x2:Double, y2:Double, x3:Double, y3:Double){
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        self.x3 = x3
        self.y3 = y3
    }
    
    func drawShape() {
        let bPath = NSBezierPath()
        
        bPath.move(to: NSPoint(x: x1, y: y1))
        bPath.line(to: NSPoint(x: x2, y: y2))
        bPath.line(to: NSPoint(x: x3, y: y3))
        
        bPath.close()
        
        bPath.lineJoinStyle = Enviroment.jointType
        bPath.lineCapStyle = Enviroment.capType
        
        if Enviroment.stroke != nil{
            bPath.lineWidth = CGFloat(Enviroment.strokeWeight)
            Enviroment.stroke!.setStroke()
            bPath.stroke()
            
        }
        
        if Enviroment.fill != nil{
            bPath.fill()
        }
    }
    func isEqualTo(_ other: Any) -> Bool{
        guard let other = other as? Triangle else { return false }
        return self.hashValue == other.hashValue
    }
}

func ==(lhs :Triangle, rhs: Triangle)->Bool{
    return lhs.hashValue == rhs.hashValue
}
