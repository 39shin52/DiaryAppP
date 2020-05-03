//
//  Diary.swift
//  DiaryAppP
//
//  Created by Itou Shingo on 2020/04/26.
//  Copyright © 2020 Itou Shingo. All rights reserved.
//

import UIKit
import RealmSwift

class Diary: Object {
    
    @objc dynamic var date: String = ""
    @objc dynamic var context: String = ""
    
    override static func primaryKey() -> String? {
        return "date"
    }
}
