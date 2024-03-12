import Foundation 

class UserController {
    let userService: UserService

    init(userService: UserService) {
        self.userService = userService
    }

    func createUser(user: UserDTO) -> User {
        let novoUsuario = userService.createUser(user: user)
        return novoUsuario
    }

    func getAllUsers() -> [User] {
        let users = userService.getAllUsers()
        return users
    }

    func findbyEmailorDocument(email: String, document: String) throws-> User {
        return try userService.findbyEmailorDocument(email: email, document: document)
    }
}