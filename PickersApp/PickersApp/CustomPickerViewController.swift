//
//  CustomPickerViewController.swift
//  PickersApp
//
//  Created by 김성규 on 2020/12/15.
//  Copyright © 2020 KIM SEONGGYU. All rights reserved.
//

import UIKit

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    
    private var images: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()

        images = [UIImage(named: "seven")!, UIImage(named: "bar")!, UIImage(named: "crown")!, UIImage(named: "cherry")!, UIImage(named: "lemon")!, UIImage(named: "apple")!]
        
        winLabel.text = ""
        arc4random_stir()
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row]
        return UIImageView(image: image)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
    @IBAction func spin(_ sender: UIButton) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0 ..< 5 {
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if (newValue == lastVal) {
                numInRow += 1
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if (numInRow >= 3) {
                win = true
            }
        }
        winLabel.text = win ? "WINNER!" : " "
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
