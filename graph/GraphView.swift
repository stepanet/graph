//
//  GraphView.swift
//  graph
//
//  Created by Jack Sp@rroW on 02.05.2020.
//  Copyright © 2020 Jack Sp@rroW. All rights reserved.
//

import Foundation
import UIKit

class GraphView: UIView {
    
    
    var colorGraph: UIColor = .black
    var colorGraphLine: UIColor = .black
    var movePoint:CGPoint = CGPoint(x: 0, y: 0)
    var linePoint:CGPoint = CGPoint(x: 0, y: 0)
    
    
    override func draw(_ rect: CGRect) {

        GraphName.drawGraph(resizing: .aspectFill, colorGraph: colorGraph, colorGraphLine: colorGraphLine, movePoint: movePoint, linePoint: linePoint)
    }
    
}
