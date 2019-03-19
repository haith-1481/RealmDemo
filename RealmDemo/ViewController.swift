//
//  ViewController.swift
//  RealmDemo
//
//  Created by trinh.hoang.hai on 3/18/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var userList: Results<Person>?

    @IBAction func addPerson(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
            let id = phoneNoTextField.text, !id.isEmpty else { return }
        let person = makePersonWithName(name, id: id)
        RealmManager.shared.addPerson(person: person)
        nameTextField.text = ""
        phoneNoTextField.text = ""
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userList = RealmManager.shared.personList()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let person = userList?[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell()}
        cell.nameLabel.text = person.name
        cell.phoneLabel.text = person.id
        cell.deletePer = { [weak self] in
            guard let `self` = self else { return }
            RealmManager.shared.deletePerson(person: person)
            self.tableView.reloadData()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let userList = userList else { return }
        let catVC = self.storyboard?.instantiateViewController(withIdentifier: "CatManageViewController") as! CatManageViewController
        catVC.person = userList[indexPath.row]
        self.navigationController?.pushViewController(catVC, animated: true)
    }

}
