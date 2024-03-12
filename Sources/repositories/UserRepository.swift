import Foundation

protocol UserRepository {
    func findById(id: Int) throws -> User
    func findUserByDocument(document: String) throws -> User
    func findByEmailOrDocument(email: String, document: String) throws -> User
    func findAll() -> [User]
    func save(user: User)
}