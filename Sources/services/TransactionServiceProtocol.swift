import Foundation
import TransactionDTO

protocol TransactionServiceProtocol {
    func getTransactions() -> [TransactionDTO]
}
