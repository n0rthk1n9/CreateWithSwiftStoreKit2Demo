//
//  PurchaseManager.swift
//  CreateWithSwiftStoreKit2Demo
//
//  Created by Jan Armbrust on 16.06.2025.
//

import StoreKit

class PurchaseManager: ObservableObject {
    @Published var isMeetupPictureCustomer = false

    private var updatesTask: Task<Void, Never>?

    static let shared = PurchaseManager()

    private init() {}

    func process(transaction verificationResult: VerificationResult<Transaction>) async {
        let transaction: Transaction

        switch verificationResult {
        case let .verified(trans):
            transaction = trans
        case .unverified:
            return
        }
        
        Task { @MainActor in
            isMeetupPictureCustomer = true
        }
        
        await transaction.finish()

    }

    func checkForUnfinishedTransactions() async {
        for await transaction in Transaction.unfinished {
            Task.detached(priority: .background) {
                await self.process(transaction: transaction)
            }
        }
    }

    func observeTransactionUpdates() {
        updatesTask = Task { [weak self] in
            for await update in Transaction.updates {
                guard let self else { break }
                await self.process(transaction: update)
            }
        }
    }

    func refreshPurchasedProducts() async {
        for await verificationResult in Transaction.currentEntitlements {
            switch verificationResult {
            case .verified:
                await process(transaction: verificationResult)
            case .unverified:
                return
            }
        }
    }
}
