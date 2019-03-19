//
//  CatManageViewController.swift
//  RealmDemo
//
//  Created by trinh.hoang.hai on 3/19/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit

class CatManageViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var raceTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addCat(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
        let race = raceTextField.text, !race.isEmpty,
        let gender = genderTextField.text, !gender.isEmpty else { return }
        let cat = makeCatWithName(name, race: race, gender: gender)
        RealmManager.shared.addCat(cat: cat, person: person)
        nameTextField.text = ""
        raceTextField.text = ""
        genderTextField.text = ""
        tableView.reloadData()
    }
}

extension CatManageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.cats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatTableViewCell") as? CatTableViewCell else { return UITableViewCell () }
        cell.nameLabel.text = person.cats[indexPath.row].name
        cell.raceLabel.text = person.cats[indexPath.row].race
        cell.genderLabel.text = person.cats[indexPath.row].gender
        cell.deleteC = { [weak self] in
            guard let `self` = self else { return }
            RealmManager.shared.deleteCat(id: indexPath.row, person: self.person)
            self.tableView.reloadData()
        }
        return cell
    }




}
