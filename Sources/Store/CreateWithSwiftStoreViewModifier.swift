//
//  CreateWithSwiftStoreViewModifier.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import SwiftUI

struct CocoaStoreViewModifier: ViewModifier {
  func body(content: Content) -> some View {
    ZStack {
      content
    }
    .task {
      PurchaseManager.shared.observeTransactionUpdates()
      await PurchaseManager.shared.checkForUnfinishedTransactions()
      await PurchaseManager.shared.refreshPurchasedProducts()
    }
  }
}
