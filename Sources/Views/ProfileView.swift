//
//  ProfileView.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var purchaseManager = PurchaseManager.shared

    @Environment(\.subscriptionStatus) private var subscriptionStatus
    @Environment(\.subscriptionStatusIsLoading) private var subscriptionStatusIsLoading
    @State private var isShowingSubscriptionStoreViewSheet = false

    var body: some View {
        if subscriptionStatusIsLoading {
            ProgressView()
        } else {
            NavigationStack {
                Form {
                    Section {
                        switch subscriptionStatus {
                        case .notSubscribed:
                            Button {
                                isShowingSubscriptionStoreViewSheet = true
                            } label: {
                                Label(
                                    "Support Create with Swift",
                                    systemImage: "eurosign.arrow.trianglehead.counterclockwise.rotate.90"
                                )
                            }
                        case .meetupSupportBronze:
                            ProfileSubscriptionBadgeView(
                                isShowingSubscriptionStoreViewSheet: $isShowingSubscriptionStoreViewSheet,
                                title: "Meetup Support Bronze",
                                color: Color.brown
                            )
                        case .meetupSupportSilver:
                            ProfileSubscriptionBadgeView(
                                isShowingSubscriptionStoreViewSheet: $isShowingSubscriptionStoreViewSheet,
                                title: "Meetup Support Silver",
                                color: Color.gray
                            )
                        case .meetupSupportGold:
                            ProfileSubscriptionBadgeView(
                                isShowingSubscriptionStoreViewSheet: $isShowingSubscriptionStoreViewSheet,
                                title: "Meetup Support Gold",
                                color: Color.yellow
                            )
                        }
                    }
                    Section {
                        Text("⭐ x\(purchaseManager.starEmojiQuantity)")
                        Text("🩵 x\(purchaseManager.napoliEmojiQuantity)")
                    }
                }
                .sheet(isPresented: $isShowingSubscriptionStoreViewSheet) {
                    SubscriptionInAppPurchaseView()
                }
                .navigationTitle("Subscriptions 🔁")
            }
        }
    }
}

struct ProfileSubscriptionBadgeView: View {
    @Binding var isShowingSubscriptionStoreViewSheet: Bool
    
    let title: String
    let color: Color

    var body: some View {
        HStack {
            Image(systemName: "ticket")
                .foregroundStyle(color)
                .font(.system(size: 60))
                .bold()
            Text(title)
                .foregroundStyle(color)
                .font(.title)
                .bold()
        }
        .padding()
        .background(Color.gray.opacity(0.4))
        .cornerRadius(20)
        .shadow(color: Color.white.opacity(0.2), radius: 4)
        .onTapGesture {
            isShowingSubscriptionStoreViewSheet = true
        }
    }
}

#Preview {
    ProfileView()
}
