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
    
    let f = GraphView(frame: CGRect(x: 0, y: 75, width: screen_width, height: screen_height - 125))

    override func viewDidLoad() {
        super.viewDidLoad()
        //let childView : UIView = UIView(frame: CGRect(x: 50, y: 50, width: screen_width - 100, height: screen_height - 100) )
        //childView.backgroundColor = UIColor.blue
        
        self.view.addSubview(f)
    }

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
        let color:UIColor = UIColor.purple
        
        let drect = CGRect(x: (w * 0.25), y: (h * 0.25), width: (w * 0.5), height: (h * 0.5))
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        
        NSLog("drawRect has updated the view")
    }
    
}

