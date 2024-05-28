//
//  MyTableViewCell.swift
//  test
//
//  Created by 권대윤 on 5/24/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var starButton: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        itemLabel.text = ""
        checkButton.setImage(nil, for: .normal)
        starButton.setImage(nil, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.backgroundColor = .systemGray5
        backView.layer.cornerRadius = 10
        
        itemLabel.textColor = .black
        itemLabel.font = .systemFont(ofSize: 13, weight: .medium)
        
        checkButton.tintColor = .black
        starButton.tintColor = .black
    }
}
