//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Silver on 7/3/22.
//

import SwiftUI

@main
struct BookwormApp: App {
    //make instance of our data
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
