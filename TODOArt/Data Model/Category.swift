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
    let items = List<Item>()
}
