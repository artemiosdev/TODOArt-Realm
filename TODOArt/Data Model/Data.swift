//
//  Data.swift
//  TODOArt
//
//  Created by Artem Androsenko on 16.08.2022.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
