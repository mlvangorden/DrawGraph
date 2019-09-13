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
    
    let f = GraphView(frame: CGRect(x: 50, y: 50, width: screen_width - 100, height: screen_height - 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        let childView : UIView = UIView(frame: CGRect(x: 50, y: 50, width: screen_width - 100, height: screen_height - 100) )
        childView.backgroundColor = UIColor.blue
        
        self.view.addSubview(childView)
    }

}

class GraphView: UIView {
    
    override func init(frame: CGRect){
        super.init(frame: frame)
    }
    
    override func drawRect(rect: CGRect) {
        let
        
    }
    
}

