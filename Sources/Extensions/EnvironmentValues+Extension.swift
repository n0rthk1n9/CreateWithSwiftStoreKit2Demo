//
//  EnvironmentValues+Extension.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import SwiftUI

extension EnvironmentValues {
  private struct SubscriptionIDsKey: EnvironmentKey {
    static let defaultValue = SubscriptionIDs(
      group: "921A802D",
      meetupSupportBronze: "dev.xbow.CreateWithSwiftStoreKit2Demo.meetupSupportBronze",
      meetupSupportSilver: "dev.xbow.CreateWithSwiftStoreKit2Demo.meetupSupportSilver",
      meetupSupportGold: "dev.xbow.CreateWithSwiftStoreKit2Demo.meetupSupportGold"
    )
  }

  var subscriptionIDs: SubscriptionIDs {
    get { self[SubscriptionIDsKey.self] }
    set { self[SubscriptionIDsKey.self] = newValue }
  }

  enum SubscriptionStatusEnvironmentKey: EnvironmentKey {
    static var defaultValue: SubscriptionStatus = .notSubscribed
  }

  enum SubscriptionStatusLoadingEnvironmentKey: EnvironmentKey {
    static var defaultValue = true
  }

  var subscriptionStatus: SubscriptionStatus {
    get { self[SubscriptionStatusEnvironmentKey.self] }
    set { self[SubscriptionStatusEnvironmentKey.self] = newValue }
  }

  var subscriptionStatusIsLoading: Bool {
    get { self[SubscriptionStatusLoadingEnvironmentKey.self] }
    set { self[SubscriptionStatusLoadingEnvironmentKey.self] = newValue }
  }
}
