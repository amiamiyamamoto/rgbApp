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
    
    //スライダーを動かしたときの処理
    @IBAction func rSliderChanged(_ sender: UISlider) {
        let value:Int = Int(sender.value)
        rLabel.text = "R:\(value)"
        displayColorCode()
    }
    @IBAction func gSliderChanged(_ sender: UISlider) {
        let value:Int = Int(sender.value)
        gLabel.text = "G:\(value)"
        displayColorCode()
    }
    @IBAction func bSliderChanged(_ sender: UISlider) {
        let value:Int = Int(sender.value)
        bLabel.text = "B:\(value)"
        displayColorCode()
    }
    
    //カラーコードの表示
    func displayColorCode() {
        //スライダーの値を取得
        let r:Int = Int(rSlider.value)
        let g:Int = Int(gSlider.value)
        let b:Int = Int(bSlider.value)
        //16進数の（大文字の）文字列に変換する
        let colorCode:String = String(NSString(format: "%02x%02x%02x", r, g, b)).uppercased()
        //ラベルの表示
        rgbValueLabel.text = "RGB value is #" + colorCode
        
        
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

