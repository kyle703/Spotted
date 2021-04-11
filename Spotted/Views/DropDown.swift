//
//  DropDown.swift
//  Spotted
//
//  Created by Kyle Thompson on 2/6/21.
//  Copyright © 2021 Kyle Thompson. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct GameDropDown: View {
    
    @ObservedObject var gameStorage: GameStorage
    
    var options: [DropdownOption]?;
    var onSelect: ((_ key: String) -> Void)?
    
    init(gameStorage: GameStorage) {
        self.gameStorage = gameStorage
        
        self.options = gameStorage.games.map({ (game: Game) -> DropdownOption in
            return DropdownOption(key: game.id!.uuidString, val: game.name!)
        });
        self.onSelect = { key in
            let game: Game? = gameStorage.games.first { (game:Game) -> Bool in
                return game.id!.uuidString == key
            }
            gameStorage.selectedGame = game;
        }
    }
    
    var body: some View {
        DropdownButton(displayText: .constant("Switch games"), options: options ?? [], onSelect: onSelect)
            .foregroundColor(Color.primaryBlack)
            

    }
}

let dropdownCornerRadius: CGFloat = 10

struct DropdownButton: View {
    @State var shouldShowDropdown = false
    @Binding var displayText: String
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    let buttonHeight: CGFloat = 40
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(displayText)
                Spacer()
                    .frame(width: 20)
                Image(systemName: self.shouldShowDropdown ? "chevron.up" : "chevron.down")
            }
        }
        .padding(.horizontal)
        .cornerRadius(dropdownCornerRadius)
        .frame(height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color.primaryWhite, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onSelect: self.onSelect)
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: dropdownCornerRadius).fill(Color.primaryWhite)
        )
    }
}

struct DropdownOption: Hashable {
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }

    var key: String
    var val: String
}

struct DropdownOptionElement: View {
    var val: String
    var key: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        Button(action: {
            if let onSelect = self.onSelect {
                onSelect(self.key)
            }
        }) {
            Text(self.val)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.options, id: \.self) { option in
                DropdownOptionElement(val: option.val, key: option.key, onSelect: self.onSelect)
            }
        }

        .background(Color.primaryWhite)
        .cornerRadius(dropdownCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: dropdownCornerRadius)
                .stroke(Color.secondaryBrown, lineWidth: 1)
        )
    }
}

struct DropdownButton_Previews: PreviewProvider {
    static let options = [
        DropdownOption(key: "week", val: "This week"), DropdownOption(key: "month", val: "This month"), DropdownOption(key: "year", val: "This year")
    ]

    static let onSelect = { key in
        print(key)
    }

    static var previews: some View {
        Group {
            VStack(alignment: .leading) {
                DropdownButton(displayText: .constant("This month"), options: options, onSelect: onSelect)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .foregroundColor(Color.primaryBlack)

            VStack(alignment: .leading) {
                DropdownButton(shouldShowDropdown: true, displayText: .constant("This month"), options: options, onSelect: onSelect)
                Dropdown(options: options, onSelect: onSelect)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primaryBlack)
            .foregroundColor(Color.primaryBlack)
        }
    }
}
