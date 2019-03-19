//
//  RealmManager.swift
//  RealmDemo
//
//  Created by trinh.hoang.hai on 3/20/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()

    private var realm: Realm

    private init() {
        realm = try! Realm()
    }

    func personList() -> Results<Person>? {
        return realm.objects(Person.self).sorted(byKeyPath: "id", ascending: true)
    }

    func addPerson(person: Person) {
        do {
            try realm.write {
                realm.add(person, update: true)
            }
        } catch let error {
            print(error)
        }
    }

    func addCat(cat: Cat, person: Person) {
        do {
            try realm.write {
                person.cats.append(cat)
                realm.add(person, update: true)
            }
        } catch let error {
            print(error)
        }
    }

    func deletePerson(person: Person) {
        try! realm.write {
            realm.delete(person)
        }
    }

    func deleteCat(id: Int, person: Person) {
        try? realm.write {
            person.cats.remove(at: id)
            realm.add(person, update: true)
        }
    }
}
