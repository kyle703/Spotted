//
//  ViewRouter.swift
//  Spotted
//
//  Created by Kyle Thompson on 1/29/21.
//  Copyright © 2021 Kyle Thompson. All rights reserved.
//

import SwiftUI
import CoreData

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .playerList
}

var allGamesFetchRequest: NSFetchRequest<Game> {
    let request: NSFetchRequest<Game> = Game.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \Game.id, ascending: false)]

    return request
}

class GameStorage: NSObject, ObservableObject {
    @Published var games: [Game] = []
    @Published var selectedGame: Game? = nil
    private let gameController: NSFetchedResultsController<Game>

    init(managedObjectContext: NSManagedObjectContext) {
        gameController = NSFetchedResultsController(fetchRequest: allGamesFetchRequest,
                                                    managedObjectContext: managedObjectContext,
                                                    sectionNameKeyPath: nil, cacheName: nil)

        super.init()

        gameController.delegate = self

        do {
            try gameController.performFetch()
            games = gameController.fetchedObjects ?? []
            selectedGame =  games.first
        } catch {
          print("failed to fetch items!")
        }
    }
}

extension GameStorage: NSFetchedResultsControllerDelegate {
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    guard let allGames = controller.fetchedObjects as? [Game]
      else { return }

    games = allGames
  }
}

@available(iOS 14.0, *)
struct ParentView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var gameStorage: GameStorage

    
    var body: some View {
        switch viewRouter.currentPage {
        case .actionLog:
            Text("actionLog")
        case .analytics:
            Text("analytics")
        case .playerList:
            GameView(gameStorage: gameStorage)
        case .settings:
            Text("Settings")
        }
    }
}

enum Page {
    case actionLog
    case analytics
    case playerList
    case settings
}
