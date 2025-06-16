//
//  NonConsumableInAppPurchaseView.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import StoreKit
import SwiftUI

struct NonConsumableInAppPurchaseView: View {
    @ObservedObject private var purchaseManager = PurchaseManager.shared
    @State private var productID = ProductID.meetupPicture.rawValue

    var body: some View {
        ZStack {
            Image("meetup")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                .frame(width: 400)
                .blur(radius: !purchaseManager.isMeetupPictureCustomer ? 10 : 0)
                .animation(.smooth, value: purchaseManager.isMeetupPictureCustomer)

            if !purchaseManager.isMeetupPictureCustomer {
                ProductView(id: productID)
                    .animation(.smooth, value: purchaseManager.isMeetupPictureCustomer)
            }
        }
    }
}

#Preview {
    NonConsumableInAppPurchaseView()
}
