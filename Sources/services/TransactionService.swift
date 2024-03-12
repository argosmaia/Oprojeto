import Foundation
import UserService
import TransactionRepository
import Transaction
import LocalDateTime

class TransactionService: TransactionServiceProtocol {
  let userService: UserService
  let repository: TransactionRepository // Assuming a protocol for transaction storage

  init(userService: UserService, repository: TransactionRepository) {
    self.userService = userService
    self.repository = repository
  }

  func createTransaction(_ transaction: TransactionDTO) throws -> Transaction {
    let sender = userService.findUserById(transaction.senderId)
    let receiver = userService.findUserById(transaction.receiverId)

    try userService.validateTransaction(sender, transaction.value)

    let isAuthorized = authorizeTransaction(sender, transaction.value)
    if !isAuthorized {
      throw NSError(domain: "com.example.picpaysimplificado", code: 1, userInfo: ["message": "Transação não autorizada"])
    }

    var newTransaction = Transaction(amount: transaction.value, sender: sender, receiver: receiver, timestamp: LocalDateTime.now())

    // Implement encryption logic here (if needed)
    // newTransaction.encryptedAmount = ...

    sender.balance -= transaction.value
    receiver.balance += transaction.value

    repository.save(newTransaction)
    userService.saveUser(sender)
    userService.saveUser(receiver)

    notificationService.sendNotification(sender, message: "Transação realizada com sucesso")
    notificationService.sendNotification(receiver, message: "Transação recebida com sucesso")

    return newTransaction
  }

  func authorizeTransaction(_ user: User, _ value: BigDecimal) -> Bool {
    // Simulate external authorization call (assuming you have a more robust mechanism)
    return URLSession.shared.dataTask(with: URL(string: "https://run.mocky.io/v3/5794d450-d2e2-4412-8131-73d0293ac1cc")!) { data, response, error in
      guard let data = data, error == nil else { return }
      let json = try? JSONSerialization.jsonObject(with: data, options: [])
      if let responseDict = json as? Dictionary<String, String>,
         let message = responseDict["message"],
         response?.statusCode == 200 {
        return message.equalsIgnoreCase("Autorizado")
      }
      return false
    }.resume()

    // This function should ideally return a boolean synchronously, you might need to refactor the authorization logic
  }

  func getListOfTransactions() -> [TransactionDTO] {
    return repository.findAll()
  }

}
