//
//  MainView.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
                    Tab("Non-Consumable", systemImage: "eurosign.circle.fill") {
                        NonConsumableInAppPurchaseView()
                    }
                    Tab("Consumable", systemImage: "fork.knife.circle.fill") {
                        ConsumableInAppPurchaseView()
                    }
                    Tab("Subscription", systemImage: "eurosign.arrow.trianglehead.counterclockwise.rotate.90") {
                        SubscriptionInAppPurchaseView()
                    }
                }
    }
}

#Preview {
    MainView()
}
