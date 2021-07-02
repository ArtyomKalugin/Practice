//
//  DetailContactViewController.swift
//  App
//
//  Created by Artem Kalugin on 02.07.2021.
//

import UIKit

class DetailContactViewController: UIViewController {
    @IBOutlet weak var contactCommentLabel: UILabel!
    @IBOutlet weak var contactWorkLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var contactSecondNameLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    var contact: ContactCellData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactImageView.image = contact?.image
        contactCommentLabel.text = contact?.comment
        contactWorkLabel.text = contact?.workPlace
        contactNumberLabel.text = contact?.number
        contactSecondNameLabel.text = contact?.secondName
        contactNameLabel.text = contact?.firstName
    }


}
