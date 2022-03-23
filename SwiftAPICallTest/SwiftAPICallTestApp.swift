//
//  SwiftAPICallTestApp.swift
//  SwiftAPICallTest
//
//  Created by Yushin Kim on 24/03/22.
//

import SwiftUI

@main
struct SwiftAPICallTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
