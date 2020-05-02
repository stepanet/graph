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
    var arrayPointY:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        drawGraphTime()
        //draw()
    }
    
    
    func drawGraphTime() {
        timerDraw = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addArrayValue), userInfo: nil, repeats: true)
    }
    
    
    //добавим случайное число в массив и отрисуем график
    @objc func addArrayValue() {
        var addPoint:Double = 0
        addPoint = Double.random(in: 20...150)
        arrayPointY.append(addPoint)
        if arrayPointY.count == 10 { timerDraw?.invalidate() }
        drawGraph(colorGraph: .red, colorGraphLine: .black, pointYArray: arrayPointY)
    }
    
    
    
    //просто нарисуем график
    @objc func draw() {
        drawGraph(colorGraph: .red, colorGraphLine: .black, pointYArray: [150,20,30,50,60,70,80,90])
    }
    
    
    func drawGraph(colorGraph:UIColor, colorGraphLine:UIColor, pointYArray:Array<Double>) {
        let arrayView = [graphView]
        for each in arrayView {
            each!.colorGraph = colorGraph
            each!.colorGraphLine = colorGraphLine
            each!.pointYArray = pointYArray
            each!.setNeedsDisplay()
        }
    }
    
    func setupView() {
        graphView.layer.cornerRadius = 15
        graphView.clipsToBounds = true
        graphView.backgroundColor = .lightGray
    }


}

