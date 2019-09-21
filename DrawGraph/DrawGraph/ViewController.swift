//
//  ViewController.swift
//  DrawGraph
//
//  Created by Matthew Van Gorden on 9/13/19.
//  Copyright © 2019 Matthew Van Gorden. All rights reserved.
//

import UIKit

let screenBounds = UIScreen.main.bounds
let screen_width = Int(screenBounds.width)
let screen_height = Int(screenBounds.height)
let screen_scale = UIScreen.main.scale

let drawable_top_offset = 140
let drawable_height = (screen_height - drawable_top_offset)

let colorDict = [UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1).cgColor, //red
                 UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 1).cgColor, //orange
                 UIColor(red: 255/255, green: 238/255, blue: 0/255, alpha: 1).cgColor, //yellow
                 UIColor(red: 3/255, green: 169/255, blue: 1/255, alpha: 1).cgColor, //green
                 UIColor(red: 0/255, green: 23/255, blue: 255/255, alpha: 1).cgColor, //blue
                 UIColor(red: 122/255, green: 7/255, blue: 214/255, alpha: 1).cgColor, //purple
                 UIColor(red: 255/255, green: 0/255, blue: 255/255, alpha: 1).cgColor, //pink
                 UIColor(red: 154/255, green: 154/255, blue: 154/255, alpha: 1).cgColor] // gray

let leftEyeDict = ["simple_eye.png",
                   "happy_left_eye.png",
                   "angry_left_eye.png",
                   "sad_left_eye.png",
                   "tired_left_eye.png"]

let rightEyeDict = ["simple_eye.png",
                   "happy_right_eye.png",
                   "angry_right_eye.png",
                   "sad_right_eye.png",
                   "tired_right_eye.png"]

let mouthDict = ["simple_mouth.png",
                 "happy_mouth.png",
                 "sad_mouth.png",
                 "happy_jagged_mouth.png",
                 "upset_jagged_mouth.png"]

class ViewController: UIViewController {
    @IBOutlet weak var originX: UITextField?
    @IBOutlet weak var originY: UITextField?
    @IBOutlet weak var height: UITextField?
    @IBOutlet weak var width: UITextField?
    @IBOutlet weak var draw: UIButton!
    @IBOutlet weak var positionLabel: UILabel?
    @IBOutlet weak var heightLabel: UILabel?
    @IBOutlet weak var widthLabel: UILabel?
    
    var originX_value = -1
    var originY_value = -1
    var height_value = -1
    var width_value = -1
    
    var colorNum = -1
    var eyeNum = -1
    var mouthNum = -1
    
    var left_eye = UIImageView()
    var right_eye = UIImageView()
    var mouth = UIImageView()
    
    let f = UIView(frame: CGRect(x: 0, y: drawable_top_offset, width: screen_width, height: screen_height))
    var lastPoint = CGPoint.zero
    
    var shape = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let line1 : UIView = UIView(frame: CGRect(x: 0, y: drawable_top_offset, width: Int(screen_width), height: 1) )
        line1.backgroundColor = UIColor.black
        self.view.addSubview(line1)
        
        setupTextFields()
    }
    
    @IBAction func draw_rectangle(_ sender: UIButton){
        if((originX!.text != "") && (originY!.text != "") && (height!.text != "") && (width!.text != "")){
            //keeps parameters within the proper bounds
            originX_value = min((Int(originX!.text!) ?? -1), screen_width - 10)
            originY_value = min((Int(originY!.text!) ?? -1), drawable_height - 10)
            height_value = min((Int(height!.text!) ?? -1), (drawable_height - originY_value))
            width_value = min((Int(width!.text!) ?? -1), (screen_width - originX_value))
            
            colorNum = Int.random(in: 0..<8)
            eyeNum = Int.random(in: 0..<5)
            mouthNum = Int.random(in: 0..<5)
            
            createHead(color_number: colorNum)
            createFace(eye_number: eyeNum, mouth_number: mouthNum)
        }
        else{
            resetFriend()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            resetFriend()
            
            lastPoint = touch.location(in: f)
            originX_value = Int(lastPoint.x)
            originY_value = Int(lastPoint.y)
            
            if(originY_value < 0) {
                return
            }
            else if(originY_value > drawable_height){
                originY_value = drawable_height - 10
            }
            
            originX?.text = String(originX_value)
            originY?.text = String(originY_value)
            colorNum = Int.random(in: 0..<8)
            eyeNum = Int.random(in: 0..<5)
            mouthNum = Int.random(in: 0..<5)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(originY_value < 0) {
            return
        }
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: f)
            if(currentPoint.x < lastPoint.x) {
                originX_value = Int(currentPoint.x)
                width_value = Int(lastPoint.x) - originX_value
            }
            else{
                width_value = Int(currentPoint.x) - originX_value
            }
            if(currentPoint.y < lastPoint.y) {
                if(currentPoint.y > CGFloat(drawable_height)){
                    originY_value = drawable_height - 10
                    height_value = Int(lastPoint.y) - originY_value
                }
                else{
                    originY_value = max(Int(currentPoint.y), 0)
                    height_value = Int(lastPoint.y) - originY_value
                }
            }
            else{
                height_value = min((Int(currentPoint.y) - originY_value), (drawable_height - originY_value - 1))
            }
            createHead(color_number: colorNum)
            createFace(eye_number: eyeNum, mouth_number: mouthNum)
            
        }
    }
    
    func createHead(color_number: Int) {

        if(height_value < 10) {
            height_value = 10
        }
        if(width_value < 10) {
            width_value = 10
        }
        if(originX_value > screen_width - 10) {
            originX_value = screen_width - 10
        }
        if(originY_value > drawable_height - 10) {
            originY_value = drawable_height - 10
        }
        
        originX?.text = String(originX_value)
        originY?.text = String(originY_value)
        width?.text = String(width_value)
        height?.text = String(height_value)
        
        shape.fillColor = colorDict[color_number]
        shape.path = UIBezierPath(roundedRect: CGRect(x: originX_value, y: originY_value + drawable_top_offset + 1, width: width_value, height: height_value), cornerRadius: 30).cgPath
        view.layer.addSublayer(shape)
    }
    
    func createFace(eye_number: Int, mouth_number: Int) {
        let eyeHeight = min( (CGFloat(height_value) / 3), (CGFloat(width_value) / 3) )
        let eyeWidth = eyeHeight
        let mouthHeight = eyeHeight
        let mouthWidth = 2 * eyeHeight
        
        let eyeLX = ( (CGFloat(width_value) / 3) - (eyeWidth / 2) ) + CGFloat(originX_value)
        let eyeLY = ( (CGFloat(height_value) / 3) - (eyeHeight / 2) ) + CGFloat(originY_value + drawable_top_offset)
        let eyeRX = ( (2 * CGFloat(width_value) / 3) - (eyeWidth / 2) ) + CGFloat(originX_value)
        let eyeRY = eyeLY
        let mouthX = ( (CGFloat(width_value) / 2) - (mouthWidth / 2) ) + CGFloat(originX_value)
        let mouthY = ( 0.55 * CGFloat(height_value) ) + CGFloat(originY_value + drawable_top_offset)
        
        left_eye.frame = CGRect(x: eyeLX, y: eyeLY, width: eyeWidth, height: eyeHeight)
        right_eye.frame = CGRect(x: eyeRX, y: eyeRY, width: eyeWidth, height: eyeHeight)
        mouth.frame = CGRect(x: mouthX, y: mouthY, width: mouthWidth, height: mouthHeight)
        
        left_eye.image = UIImage(named: leftEyeDict[eye_number])
        right_eye.image = UIImage(named: rightEyeDict[eye_number])
        mouth.image = UIImage(named: mouthDict[mouth_number])
        
        view.addSubview(left_eye)
        view.addSubview(right_eye)
        view.addSubview(mouth)
    }
    
    func resetFriend() {
        left_eye.image = nil
        right_eye.image = nil
        mouth.image = nil
        shape.fillColor = nil
        shape.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        width?.text = ""
        height?.text = ""
    }
    
    func setupTextFields() {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        originX!.inputAccessoryView = toolbar
        originY!.inputAccessoryView = toolbar
        height!.inputAccessoryView = toolbar
        width!.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

}
