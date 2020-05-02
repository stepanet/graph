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
    var pointYArray: [Double] = []
    
    
    override func draw(_ rect: CGRect) {

        GraphName.drawGraph(resizing: .aspectFill, colorGraph: colorGraph, colorGraphLine: colorGraphLine, pointYArray: pointYArray)
    }
    
}
