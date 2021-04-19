//
//  NewUserTableViewCell.swift
//  SocialKit
//
//  Created by Euler Carvalho on 19/04/21.
//

enum AddUserField {
    case name, email
}

import UIKit

class NewUserTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldTitle: UILabel!
    @IBOutlet weak var fieldTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bind(field: AddUserField) {
        switch field {
        case .name:
            self.fieldTitle.text = "Nome"
        case .email:
            self.fieldTitle.text = "Email"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.fieldTitle.text = ""
    }
}
