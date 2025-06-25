//
//  Its_time_to_playApp.swift
//  Its time to play
//
//

import SwiftUI

@main
struct Its_time_to_playApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ITTPRoot()
                .preferredColorScheme(.light)
        }
    }
}
