//
//  Category.swift
//  TODOArt
//
//  Created by Artem Androsenko on 19.08.2022.
//
import Foundation
import RealmSwift

class Category: Object {
    @Persisted var name: String = ""
    @Persisted var items: List<Item>
    @Persisted var colour: String = ""
}

// old version code for Realm < 10.0.28 (3.0.6)
//class Category: Object {
//    @objc dynamic var name: String = ""
//    let items = List<Item>()
//}
