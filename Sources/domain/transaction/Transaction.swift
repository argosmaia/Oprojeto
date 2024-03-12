import Foundation
import BigDecimal
import User
import LocalDateTime

class Transaction {
    //id tem valor long
    private var id: Int64
    private var amount: BigDecimal
    private var sender: User
    private var receiver: User
    private var timestamp: LocalDateTime
    private var type: TransactionType
    
    init(id: Int64, amount: BigDecimal, sender: User, receiver: User, timestamp: LocalDateTime, type: TransactionType) {
        self.id = id
        self.amount = amount
        self.sender = sender
        self.receiver = receiver
        self.timestamp = timestamp
        self.type = type
    }
}