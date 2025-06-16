//
//  View+Extension.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import SwiftUI

extension View {
    func createWithSwiftMeetupStore() -> some View {
        modifier(CreateWithSwiftMeetupStoreViewModifier())
    }

    func subscriptionPassStatusTask() -> some View {
        modifier(SubscriptionStatusTaskViewModifier())
    }
}
