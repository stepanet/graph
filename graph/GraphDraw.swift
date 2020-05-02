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
    

    @objc dynamic public class func drawGraph(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 200), resizing: ResizingBehavior = .aspectFit, colorGraph: UIColor = .darkGray, colorGraphLine: UIColor = .black, movePoint: CGPoint = CGPoint(x: 37.5, y: 36.5), linePoint:CGPoint = CGPoint(x: 37.5, y: 63.5)) {
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




        //// Bezier 3 Drawing
        //Рисуем плавный график
//          let bezier3Path = UIBezierPath()
//        bezier3Path.move(to: CGPoint(x: 20.5, y: 174.5))
//        bezier3Path.addCurve(to: CGPoint(x: 41.5, y: 65.5), controlPoint1: CGPoint(x: 20.5, y: 174.5), controlPoint2: CGPoint(x: 30.5, y: 22.5))
//        bezier3Path.addCurve(to: CGPoint(x: 55.5, y: 120.5), controlPoint1: CGPoint(x: 52.5, y: 108.5), controlPoint2: CGPoint(x: 55.5, y: 120.5))
//        bezier3Path.addCurve(to: CGPoint(x: 68.5, y: 151.5), controlPoint1: CGPoint(x: 55.5, y: 120.5), controlPoint2: CGPoint(x: 63.5, y: 154.5))
//        bezier3Path.move(to: CGPoint(x: 68.5, y: 151.5))
//        bezier3Path.addCurve(to: CGPoint(x: 81.5, y: 127.5), controlPoint1: CGPoint(x: 68.5, y: 151.5), controlPoint2: CGPoint(x: 77.5, y: 147.5))
//        bezier3Path.addCurve(to: CGPoint(x: 93.5, y: 80.5), controlPoint1: CGPoint(x: 85.5, y: 107.5), controlPoint2: CGPoint(x: 85.5, y: 62.5))
//        bezier3Path.addCurve(to: CGPoint(x: 108.5, y: 131.5), controlPoint1: CGPoint(x: 101.5, y: 98.5), controlPoint2: CGPoint(x: 100.5, y: 108.5))
//        bezier3Path.addCurve(to: CGPoint(x: 119.5, y: 154.5), controlPoint1: CGPoint(x: 116.5, y: 154.5), controlPoint2: CGPoint(x: 112.5, y: 157.5))
//        bezier3Path.addCurve(to: CGPoint(x: 131.5, y: 148.5), controlPoint1: CGPoint(x: 126.5, y: 151.5), controlPoint2: CGPoint(x: 131.5, y: 204.5))
//        bezier3Path.addCurve(to: CGPoint(x: 136.5, y: 66.5), controlPoint1: CGPoint(x: 131.5, y: 92.5), controlPoint2: CGPoint(x: 131.5, y: 58.5))
//        bezier3Path.addCurve(to: CGPoint(x: 148.5, y: 127.5), controlPoint1: CGPoint(x: 141.5, y: 74.5), controlPoint2: CGPoint(x: 142.5, y: 88.5))
//        bezier3Path.addCurve(to: CGPoint(x: 165.5, y: 166.5), controlPoint1: CGPoint(x: 152.34, y: 152.43), controlPoint2: CGPoint(x: 158.41, y: 161.18))
//        bezier3Path.addCurve(to: CGPoint(x: 179.5, y: 131.5), controlPoint1: CGPoint(x: 169.5, y: 169.5), controlPoint2: CGPoint(x: 171.93, y: 152.42))
//        colorGraph.setStroke()
//        bezier3Path.lineWidth = 3
//        bezier3Path.lineCapStyle = .round
//        bezier3Path.stroke()
        
        //// Bezier Drawing
        //х - точка старта отрисовки прямой линии вниз
        //movePoint, linePoint
        let bezierPath = UIBezierPath()
        bezierPath.move(to: movePoint)//CGPoint(x: 37.5, y: 36.5))
        bezierPath.addLine(to: linePoint)//CGPoint(x: 37.5, y: 63.5))
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.lineCapStyle = .round
        bezierPath.lineJoinStyle = .round
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
