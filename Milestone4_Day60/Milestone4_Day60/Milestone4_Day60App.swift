//
//  Milestone4_Day60App.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//
import SwiftData
import SwiftUI

@main
struct Milestone4_Day60App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
