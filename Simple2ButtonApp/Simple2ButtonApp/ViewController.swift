//
//  ViewController.swift
//  Simple2ButtonApp
//
//  Created by 김성규 on 2020/10/19.
//  Copyright © 2020 KIM SEONGGYU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.title(for: .selected)!
        let text = "\(title) button pressed"
        
        let styledText = NSMutableAttributedString(string: text)
        let attribute = [
            NSAttributedString.Key.font:
                UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)
        ]
        let nameRange = (text as NSString).range(of: title)
        styledText.setAttributes(attribute, range: nameRange)
        
        statusLabel.attributedText = styledText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

