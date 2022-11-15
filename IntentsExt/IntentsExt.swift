//
//  IntentsExt.swift
//  IntentsExt
//
//  Created by Nikhil Nigade on 10/11/22.
//

import AppIntents

struct IntentsExt: AppIntent {
    static var title: LocalizedStringResource = "IntentsExt"
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
