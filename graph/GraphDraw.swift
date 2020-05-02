//
//  GraphStyle.swift
//  graph
//
//  Created by Jack Sp@rroW on 02.05.2020.
//  Copyright © 2020 Jack Sp@rroW. All rights reserved.
//

import UIKit

public class GraphName : NSObject {

    //// Drawing Methods
    
    //colorGraph - цвет график
    //colorGraphLine - цвет линий графика
    //movePoint, linePoint - координаты отрисовки графика
    

    @objc dynamic public class func drawGraph(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 200), resizing: ResizingBehavior = .aspectFit, colorGraph: UIColor = .darkGray, colorGraphLine: UIColor = .darkGray /*, movePoint: CGPoint = CGPoint(x: 37.5, y: 36.5), linePoint:CGPoint = CGPoint(x: 37.5, y: 63.5)*/) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 200, height: 200), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 200, y: resizedFrame.height / 200)


        //// GraphGroup
        //// Y Drawing
        let yPath = UIBezierPath()
        yPath.move(to: CGPoint(x: 18.69, y: 22.5))
        yPath.addLine(to: CGPoint(x: 18.69, y: 187.5))
        colorGraphLine.setStroke()
        yPath.lineWidth = 1
        yPath.lineCapStyle = .round
        yPath.stroke()


        //// X Drawing
        let xPath = UIBezierPath()
        xPath.move(to: CGPoint(x: 7.5, y: 175.85))
        xPath.addLine(to: CGPoint(x: 180.5, y: 175.85))
        colorGraphLine.setStroke()
        xPath.lineWidth = 1
        xPath.lineCapStyle = .round
        xPath.stroke()


        //// Y cap Drawing
        let yCapPath = UIBezierPath()
        yCapPath.move(to: CGPoint(x: 15.64, y: 29.29))
        yCapPath.addCurve(to: CGPoint(x: 21.75, y: 29.29), controlPoint1: CGPoint(x: 18.69, y: 14.01), controlPoint2: CGPoint(x: 21.75, y: 29.29))
        colorGraphLine.setStroke()
        yCapPath.lineWidth = 1
        yCapPath.lineCapStyle = .round
        yCapPath.lineJoinStyle = .round
        yCapPath.stroke()


        //// X cap Drawing
        context.saveGState()
        context.translateBy(x: 180.5, y: 172.94)
        context.rotate(by: 90 * CGFloat.pi/180)

        let xCapPath = UIBezierPath()
        xCapPath.move(to: CGPoint(x: 0, y: 7.12))
        xCapPath.addCurve(to: CGPoint(x: 5.82, y: 7.12), controlPoint1: CGPoint(x: 2.91, y: -8.9), controlPoint2: CGPoint(x: 5.82, y: 7.12))
        colorGraphLine.setStroke()
        xCapPath.lineWidth = 1
        xCapPath.lineCapStyle = .round
        xCapPath.lineJoinStyle = .round
        xCapPath.stroke()

        context.restoreGState()

        
        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.56)
        shadow.shadowOffset = CGSize(width: 2, height: 4)
        shadow.shadowBlurRadius = 2

        
        //// Bezier Drawing
        print("draw bezier")
        let bezierPath = UIBezierPath()
        
        var pointX: Double = 37.0
        let move: Double = 20
        
        let pointYArray: [Double] = [27,39,20,55,20,10,60,70,10,30]
        
        for pointY in pointYArray {

            print(pointX, pointY)
            bezierPath.move(to: CGPoint(x: pointX, y: pointY))
            bezierPath.addLine(to: CGPoint(x: pointX, y: pointY + move))
            pointX = pointX + 10

        }
        
        //context.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
        colorGraph.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.lineCapStyle = .round
        bezierPath.lineJoinStyle = .round
        context.saveGState()
        //context.setLineDash(phase: 0, lengths: [18, 17])
        bezierPath.stroke()
        context.restoreGState()

    }




    @objc(GraphNameResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
