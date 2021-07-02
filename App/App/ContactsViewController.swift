//
//  ContactsViewController.swift
//  App
//
//  Created by Artem Kalugin on 01.07.2021.
//

import UIKit

class ContactsViewController: UIViewController {
    
    var contacts: [ContactCellData] = [ContactCellData(firstName:                                           "Artem", secondName:                                             "Kalugin", workPlace: "ITIS",                                    number: "89829863789",                                           comment: "Student", image: UIImage(systemName: "person.fill") ?? UIImage()),
                                       ContactCellData(firstName: "Danil", secondName: "Gerasimov", workPlace: "Tinkoff Bank", number: "89926789898", comment: "Employee", image: UIImage(systemName: "person.fill") ?? UIImage()),
                                       ContactCellData(firstName: "Mum", secondName: "Kalugina", workPlace: "Nothing", number: "89129975025", comment: "Mama", image: UIImage(systemName: "person.fill") ?? UIImage())]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ContactsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailContactViewController = storyboard?.instantiateViewController(withIdentifier: "DetailContactViewController") as? DetailContactViewController else { return }
        
        detailContactViewController.contact = contacts[indexPath.row]
        
        present(detailContactViewController, animated: true) 
    }
}

extension ContactsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as? ContactTableViewCell else { return UITableViewCell() }
        cell.setData(contact: contacts[indexPath.row])
        
        return cell
    }
}


struct ContactCellData{
    var firstName: String
    var secondName: String
    var workPlace: String
    var number: String
    var comment: String
    var image: UIImage
}
