//
//  PostTableViewCell.swift
//  SocialKit
//
//  Created by Euler Carvalho on 19/04/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var customBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCustomBackground()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func setupCustomBackground() {
        customBackgroundView.layer.borderColor = UIColor.black.cgColor
        customBackgroundView.layer.borderWidth = 2.0
        customBackgroundView.layer.cornerRadius = 8.0
    }
    
    func bind(post: Post) {
        titleLabel.text = post.title
        subtitleLabel.text = post.body
    }
}
