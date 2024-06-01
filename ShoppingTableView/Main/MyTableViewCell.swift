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
    
    var shopping: Shopping? {
        didSet {
            guard let shopping = self.shopping else {return}
            
            itemLabel.text = shopping.item
            
            if shopping.check {
                checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            } else {
                checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            }
            
            if shopping.favorite {
                starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            } else {
                starButton.setImage(UIImage(systemName: "star"), for: .normal)
            }
        }
    }
    
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
