import Foundation
import Fakery

class UserFactory {
    let faker = Faker(locale: "pt-BR") // Set locale to Brazilian Portuguese

    func generateUserDTO() -> UserDTO {
        let document = DocumentHelper.generateUniqueCPF()
        let firstName = faker.name.firstName()
        let lastName = faker.name.lastName()
        let email = faker.internet.email()
        let password = faker.internet.password()
        let balance = Decimal(Double.random(in: 0..<1000)) // Random balance between 0 and 1000
        
        return UserDTO(
            firstName: firstName,
            lastName: lastName,
            document: document,
            email: email,
            password: password,
            balance: balance,
            userType: userType
        )
    }
}