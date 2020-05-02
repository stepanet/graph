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
    var timerDraw: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        //drawGraphTime()
        draw()

    }
    
    
    func drawGraphTime() {

        timerDraw = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(draw), userInfo: nil, repeats: false)
    }
    
    
    @objc func draw() {

        drawGraph(colorGraph: .red, colorGraphLine: .black)
 
    }
    
    
    
    func drawGraph(colorGraph:UIColor, colorGraphLine:UIColor)  {

        let arrayView = [graphView]
        for each in arrayView {
            each!.colorGraph = colorGraph
            each!.colorGraphLine = colorGraphLine
            each!.setNeedsDisplay()
        }
    }
    
    func setupView() {
        graphView.layer.cornerRadius = 15
        graphView.clipsToBounds = true
        graphView.backgroundColor = .white
    }


}

