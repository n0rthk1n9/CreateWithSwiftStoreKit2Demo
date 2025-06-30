//
//  SubscriptionInAppPurchaseView.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import StoreKit
import SwiftUI

struct SubscriptionInAppPurchaseView: View {
    @Environment(\.subscriptionIDs.group) private var subscriptionGroupID
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        SubscriptionStoreView(groupID: subscriptionGroupID) {
            VStack {
                Image("createWithSwiftNapoliMeetupLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(height: 150)
                VStack(spacing: 3) {
                    Text("Create with Swift Napoli Meetup Support")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                    Text("Subscription to support your favorite Swift Meetup 😍🙌")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.title3.weight(.medium))
                        .padding([.bottom, .horizontal])
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.vertical)
            .padding(.top, 40)
        }
        .storeButton(.visible, for: .cancellation)
        .onInAppPurchaseCompletion { _, _ in
            dismiss()
        }

    }
}

#Preview {
    SubscriptionInAppPurchaseView()
}
