//
//  MasterpieceTableViewCell.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class MasterpieceTableViewCell: UITableViewCell {

    @IBOutlet weak var masterpieceImageView: UIImageView!
    @IBOutlet weak var masterpieceTitleLabel: UILabel!
    @IBOutlet weak var masterpieceShortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
