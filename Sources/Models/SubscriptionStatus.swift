//
//  SubscriptionStatus.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import StoreKit

enum SubscriptionStatus: Comparable, Hashable {
  case notSubscribed
  case meetupSupportBronze
  case meetupSupportSilver
  case meetupSupportGold

  init?(productID: Product.ID, ids: SubscriptionIDs) {
    switch productID {
    case ids.meetupSupportBronze: self = .meetupSupportBronze
    case ids.meetupSupportSilver: self = .meetupSupportSilver
    case ids.meetupSupportGold: self = .meetupSupportGold
    default: return nil
    }
  }
}
