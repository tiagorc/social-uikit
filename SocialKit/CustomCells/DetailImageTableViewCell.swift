//
//  DetailImageTableViewCell.swift
//  SocialKit
//
//  Created by Euler Carvalho on 19/04/21.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind() {
        
    }

}
