import Foundation

// Definição da estrutura UserDTO
struct UserDTO {
    let firstName: String
    let lastName: String
    let document: String
    let email: String
    let password: String
    let balance: Decimal
    let userType: UserType
}