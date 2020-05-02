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
    
    override func draw(_ rect: CGRect) {
        
        //GraphName.drawGraph(var: variable)
        //GraphName.drawGraph()
        GraphName.drawGraph(resizing: .center, colorGraph: colorGraph)
    }
    
}
