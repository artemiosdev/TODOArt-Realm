//
//  Item.swift
//  TODOArt
//
//  Created by Artem Androsenko on 19.08.2022.
//
import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects<Object>(fromType: Category.self, property: "items")
}
