import Foundation
import Fakery

class UserSeeder {
    private let userFactory = UserFactory()
    private let database: DatabaseManager // Dependency injection for database interaction

    init(database: DatabaseManager) {
        self.database = database
    }

    func seed(numberOfUsers: Int) throws {
        for _ in 0..<numberOfUsers {
            let userDTO = userFactory.generateUserDTO()
            try database.createUser(userDTO: userDTO)
        }
    }
}