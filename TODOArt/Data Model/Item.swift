//
//  Item.swift
//  TODOArt
//
//  Created by Artem Androsenko on 19.08.2022.
//
import Foundation
import RealmSwift

class Item: Object {
    @Persisted var title: String = ""
    @Persisted var done: Bool = false
    @Persisted(originProperty: "items") var parentCategory: LinkingObjects<Category>
}

// old version code for Realm < 10.0.28 (3.0.6)
//class Item: Object {
//    @objc dynamic var title: String = ""
//    @objc dynamic var done: Bool = false
//    var parentCategory = LinkingObjects<Object>(fromType: Category.self, property: "items")
//}
