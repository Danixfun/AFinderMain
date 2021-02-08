//
//  RangeCircleView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation
import UIKit

class RangeCircleView: UIView {
    
    // MARK: Properties
    var circleRadius:CGFloat = 10 {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    lazy var circleSizes: [CGFloat] = {
        var temp = [CGFloat]()
        for i in (0...RadiusRangeValues.defaultValue).reversed(){
            temp.append(CGFloat(i+2))
        }
        return temp
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    init(frame: CGRect, circleRadius: CGFloat) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.circleRadius = circleRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Get the Graphics Context
        if let context = UIGraphicsGetCurrentContext() {
            
            // Set the circle outerline-width
            context.setLineWidth(5.0);
            
            // Set the circle outerline-colour
            context.setStrokeColor(UIColor.systemRed.cgColor)
            
            // Create Circle
            let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
            let radius = (frame.size.width - 10) / circleSizes[Int(circleRadius/2.0)]
            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
                
            // Draw
            context.strokePath()
        }
    }
    
    
    
}
