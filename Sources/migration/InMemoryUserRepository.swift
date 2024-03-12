import Foundation

class InMemoryUserRepository: UserRepository {
    private var users: [User] = []
    
    func findById(id: Int) throws -> User {
        if let user = users.first(where: { $0.id == id }) {
            return user
        } else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Usuário não encontrado"])
        }
    }
    
    func findUserByDocument(document: String) throws -> User {
        if let user = users.first(where: {$0.document == document}) {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Usuário não encontrado"])
        }
        return user
    }
    
    func findByEmailOrDocument(email: String, document: String) throws -> User {
        if let user = users.first(where: { $0.email == email || $0.document == document }) {
            return user
        } else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Email ou documento não encontrado"])
        }
    }
    
    func findAll() -> [User] {
        return users
    }
    
    func save(user: User) {
        users.append(user)
    }
    
    func findAll() -> [User] {
        return users
    }
    
    func save(user: User) {
        users.append(user)
    }
}