//
//  Date.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/23/21.
//

import SwiftUI

extension Date {
   func getFormattedDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        print(formatter.string(from: self))
        return formatter.string(from: self)
    }
    
    func getRelativeFormat() -> String {
        
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .spellOut

        // get exampleDate relative to the current date
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
