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
//    @Persisted(originProperty: "items") var parentCategory: LinkingObjects<Category>
//    @Persisted(originProperty: "items") var parentCategory = LinkingObjects<Object>(fromType: Category.self, property: "items")
    var parentCategory = LinkingObjects<Object>(fromType: Category.self, property: "items")
}
