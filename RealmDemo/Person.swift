//
//  Person.swift
//  RealmDemo
//
//  Created by trinh.hoang.hai on 3/19/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var name: String?
    @objc dynamic var id: String?
    let cats = List<Cat>()

    override static func primaryKey() -> String? {
        return "id"
    }
//
//    convenience init(name: String, id: String) {
//        self.init()
//        self.name = name
//        self.id = id
//    }
}

func makePersonWithName(_ name: String, id: String ) -> Person {
    let newPerson = Person()
    newPerson.name = name
    newPerson.id = id
    
    return newPerson
}

