import Foundation

class User {
    let id: Int
    let firstName: String
    let lastName: String
    let document: String
    let email: String
    let password: String
    let balance: Decimal
    let userType: UserType

    init(id: Int, firstName: String, lastName: String, document: String, email: String, password: String, balance: Decimal, userType: UserType) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.document = document
        self.email = email
        self.password = password
        self.balance = balance
        self.userType = userType
    }

    convenience init(dto: UserDTO) {
        self.init(id: 0, firstName: firstName, lastName: lastName, document: document, email: email, password: password, balance: balance, userType: userType)
    }
}