//
//  ViewController.swift
//  DrawGraph
//
//  Created by Matthew Van Gorden on 9/13/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//

import UIKit

let screenBounds = UIScreen.main.bounds
let screen_width = screenBounds.width
let screen_height = screenBounds.height
let screen_scale = UIScreen.main.scale

class ViewController: UIViewController {
    @IBOutlet weak var originX: UITextField?
    @IBOutlet weak var originY: UITextField?
    @IBOutlet weak var height: UITextField?
    @IBOutlet weak var width: UITextField?
    
    let f = GraphView(frame: CGRect(x: 0, y: 50, width: screen_width, height: screen_height - 75))
    var shape = UIView()
    var lastPoint = CGPoint.zero

    override func viewDidLoad() {
        super.viewDidLoad()
        /*let childView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: screen_width, height: screen_height) )
        f.backgroundColor = UIColor.white
        self.view.addSubview(childView)
        self.view.addSubview(f)
        shape.layer.borderColor = UIColor.black.cgColor
        shape.backgroundColor = UIColor.clear
        shape.isHidden = true
        self.view.addSubview(shape)*/
    }
    
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: f)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: f)
            reDrawSelectionArea(fromPoint: lastPoint, toPoint: currentPoint)
        }
    }
    
    func reDrawSelectionArea(fromPoint: CGPoint, toPoint: CGPoint) {
        shape.isHidden = false
        
        //Calculate rect from the original point and last known point
        let rect = CGRect(x: min(fromPoint.x, toPoint.x),
                          y: min(fromPoint.y, toPoint.y),
                          width: abs(fromPoint.x - toPoint.x),
                          height: abs(fromPoint.y - toPoint.y));
        
        shape.frame = rect
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        shape.isHidden = true
        
        //User has lift his finger, use the rect
        let shapeToDraw = shape.frame
        UIColor.blue.setFill()
        UIRectFill(shapeToDraw)
        f.draw(shapeToDraw)
        UIGraphicsPopContext()

        
        
        shape.frame = CGRect.zero //reset overlay for next tap
    }*/

}

class GraphView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
        let color:UIColor = UIColor.black
        
        let drect = CGRect(x: w, y: h, width: w, height: h)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
    }
    
}

