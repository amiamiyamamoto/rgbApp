//
//  ViewController.swift
//  rgbApp
//
//  Created by s247 on 2018/03/04.
//  Copyright © 2018年 ami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
  
    //表示用ラベル
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var rgbValueLabel: UILabel!
    //スライダー
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    //テーブルビュー
    @IBOutlet weak var colorTable: UITableView!
    
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
        //tableにCellの中身の変更を通知する →これはここに書くべき？？
        colorTable.reloadData()
    }
    
    //tableビューの処理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        var r:Int = Int(rSlider.value)
        var g:Int = Int(gSlider.value)
        var b:Int = Int(bSlider.value)
        
        //Cellによって色を変化させるための処理
        switch indexPath.row {
        case 1:
            r = checkNumber(r-20)
        case 2:
            r = checkNumber(r-10)
        case 3:
            r = checkNumber(r+10)
        case 4:
            r = checkNumber(r+20)
        case 5:
            g = checkNumber(g-20)
        case 6:
            g = checkNumber(g-10)
        case 7:
            g = checkNumber(g+10)
        case 8:
            g = checkNumber(g+20)
        case 9:
            b = checkNumber(b-20)
        case 10:
            b = checkNumber(b-10)
        case 11:
            b = checkNumber(b+10)
        case 12:
            b = checkNumber(b+20)
        default:
            break // do nothing
        }
        
        //カラーコードを生成
        let colorCode:String = "#" + String(NSString(format: "%02x%02x%02x", r, g, b)).uppercased()
        //Cellに色とカラーコードのテキストラベルを反映
        cell.backgroundColor = getUIColor(r: r, g: g, b: b)
        cell.textLabel?.text = colorCode
        return cell
    }
    
    //受け取った数値を0〜255の間に収めるメソッド
    func checkNumber(_ num:Int)->Int {
        if num > 255 {
            return 255
        }
        if num < 0 {
            return 0
        }
        return num
    }

    //rgbの値を受け取り、UIcolorインスタンスを返すメソッド
    func getUIColor (r:Int, g:Int, b:Int) ->UIColor {
        let red:CGFloat = CGFloat(r) / 255.0
        let green:CGFloat = CGFloat(g) / 255.0
        let blue:CGFloat = CGFloat(b) / 255.0
        
        return UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableViewのインターフェース設定
        colorTable.delegate = self
        colorTable.dataSource = self

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

