//
//  TaskItem.swift
//  Realm-Test
//
//  Created by KimJongHee on 2022/06/20.
//

import SwiftUI
import RealmSwift

class Todo2: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

class Todo: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var completed: Bool = false
    @Persisted var urgncy: Urgency = .neutral
    
    enum Urgency: Int, PersistableEnum {
        case trivial, neutral, urgent
        
        var text: String {
            switch self {
            case .neutral:
                return "보통"
            case .trivial:
                return "여유"
            case .urgent:
                return "긴급"
            }
        }
        
        var color: Color {
            switch self {
            case .trivial:
                return .teal
            case .neutral:
                return .secondary
            case .urgent:
                return .red
            }
        }
    }
    
    func increment() -> Urgency {
        switch urgncy {
        case .trivial:
            return .neutral
        case .neutral:
            return .urgent
        case .urgent:
            return .trivial
        }
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
