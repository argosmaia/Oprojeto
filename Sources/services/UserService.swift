import Foundation

class UserService {
    let repository: InMemoryUserRepository
    
    init(repository: InMemoryUserRepository) {
        self.repository = repository
    }
    
    func createUser(data: UserDTO) -> User {
        let newUser = User(dto: data)
        repository.save(user: newUser)
        return newUser
    }
    
    func getAllUsers() -> [User] {
        return repository.findAll()
    }
}