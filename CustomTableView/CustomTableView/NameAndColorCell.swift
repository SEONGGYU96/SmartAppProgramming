//
//  NameAndColorCellTableViewCell.swift
//  CustomTableView
//
//  Created by 김성규 on 2020/12/16.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    
    var name: String = "" {
        didSet {
            if (name != oldValue) {
                nameLabel.text = name
            }
        }
    }
    var color: String = "" {
        didSet {
            if (color != oldValue) {
                colorLabel.text = color
            }
        }
    }
    var nameLabel: UILabel!
    var colorLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initMarker(y: 5, text: "Name: ")
        initMarker(y: 26, text: "Color: ")
        
        let nameValueRect = CGRect(x: 80, y: 5, width: 200, height: 15)
        nameLabel = UILabel(frame: nameValueRect)
        contentView.addSubview(nameLabel)
        let colorValueRect = CGRect(x: 80, y: 25, width: 200, height: 15)
        colorLabel = UILabel(frame: colorValueRect)
        contentView.addSubview(colorLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initMarker(y: CGFloat, text: String) {
        let LabelRect = CGRect(x: 0, y: y, width: 70, height: 15)
        let marker = UILabel(frame: LabelRect)
        marker.textAlignment = NSTextAlignment.right
        marker.text = text
        marker.font = UIFont.boldSystemFont(ofSize: 12)
        contentView.addSubview(marker)
    }
}
