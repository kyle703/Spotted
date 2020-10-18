//
//  UserData.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showMineOnly = false
    @Published var game = gameData
}
