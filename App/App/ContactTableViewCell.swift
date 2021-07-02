//
//  ContactTableViewCell.swift
//  App
//
//  Created by Artem Kalugin on 01.07.2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(contact: ContactCellData){
        nameLabel.text = contact.firstName
        numberLabel.text = contact.number
    }
}
