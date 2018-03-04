//
//  ViewController.swift
//  rgbApp
//
//  Created by s247 on 2018/03/04.
//  Copyright © 2018年 ami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //表示用ラベル
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var rgbValueLabel: UILabel!
    //スライダー
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    //UIColorインスタンス
    var currentColor: UIColor!
    
    //スライダーを動かしたときの処理
    //スライダーの値を1にするか255にするか
    @IBAction func rSliderChanged(_ sender: UISlider) {
        let value:Int = Int(sender.value * 255)
        rLabel.text = "R:\(value)"
    }
    @IBAction func gSliderChanged(_ sender: UISlider) {
        let value:Int = Int(sender.value * 255)
        gLabel.text = "G:\(value)"
    }
    @IBAction func bSliderChanged(_ sender: UISlider) {
        let value:Int = Int(sender.value * 255)
        bLabel.text = "B:\(value)"
    }
    
    //カラーコードの表示
    func displayColorCode() {
        //スライダーの値をCGFloatで取得
        let r:CGFloat = CGFloat(rSlider.value)
        let g:CGFloat = CGFloat(gSlider.value)
        let b:CGFloat = CGFloat(bSlider.value)
        //UIColorを取得
        currentColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1.0)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

