//
//  Cat.swift
//  RealmDemo
//
//  Created by trinh.hoang.hai on 3/19/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import Foundation
import RealmSwift

class Cat: Object {
    @objc dynamic var tmpID = 0
    @objc dynamic var name: String?
    @objc dynamic var race: String?
    @objc dynamic var gender: String?
    let person = LinkingObjects(fromType: Person.self, property: "cats")

    override static func indexedProperties() -> [String] {
        return ["name"]
    }

    override static func ignoredProperties() -> [String] {
        return ["tmpID"]
    }
    
//
//    convenience init(name: String, race: String, gender: String) {
//        self.init()
//        self.name = name
//        self.race = race
//        self.gender = gender
//    }
}

func makeCatWithName(_ name: String, race: String, gender: String) -> Cat {
    let newCat = Cat()
    newCat.name = name
    newCat.race = race
    newCat.gender = gender

    return newCat
}
