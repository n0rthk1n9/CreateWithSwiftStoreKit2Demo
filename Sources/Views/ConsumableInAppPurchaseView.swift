//
//  ConsumableInAppPurchaseView.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import StoreKit
import SwiftUI

struct ConsumableInAppPurchaseView: View {
    @State private var productIDs = [
        ProductID.starEmoji.rawValue,
        ProductID.napoliEmoji.rawValue,
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                StoreView(ids: productIDs)
                    .productViewStyle(.compact)
                    .storeButton(.hidden, for: .cancellation)
            }
            .navigationTitle("Consumable 🍝🍕🍷")
        }
    }
}

#Preview {
    ConsumableInAppPurchaseView()
}
