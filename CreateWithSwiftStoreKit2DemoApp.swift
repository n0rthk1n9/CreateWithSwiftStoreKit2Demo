//
//  CreateWithSwiftStoreKit2DemoApp.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import SwiftUI

@main
struct CreateWithSwiftStoreKit2DemoApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .createWithSwiftStore()
        }
    }
}
