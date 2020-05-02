//
//  ViewController.swift
//  graph
//
//  Created by Jack Sp@rroW on 02.05.2020.
//  Copyright © 2020 Jack Sp@rroW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graphView: GraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        drawGraph(colorGraph: .green, colorGraphLine: .red, movePoint: CGPoint(x: 37.5, y: 30.0), linePoint: CGPoint(x: 37.5, y: 50.0))
    }
    
    
    
    
    
    func drawGraph(colorGraph:UIColor, colorGraphLine:UIColor, movePoint: CGPoint, linePoint: CGPoint)  {
    
        let arrayView = [graphView]
        for each in arrayView {
            each!.colorGraph = colorGraph
            each!.colorGraphLine = colorGraphLine
            each!.linePoint = linePoint
            each!.movePoint = movePoint
            each!.setNeedsDisplay()
        }
    }
    
    func setupView() {
        graphView.layer.cornerRadius = 15
        graphView.clipsToBounds = true
        graphView.backgroundColor = .white
    }


}

