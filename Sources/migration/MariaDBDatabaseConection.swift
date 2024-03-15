import Foundation
import MariaDB

// Implementação da conexão MariaDB
// Implementação da conexão MariaDB
class MariaDBDatabaseConnection: DatabaseConnection {
    private let host: String
    private let user: String
    private let password: String
    private let database: String
    private var connection: MariaDB.Connection?

    init(host: String, credentials: DatabaseCredentials, database: String) {
        self.host = host
        self.user = credentials.username
        self.password = credentials.password
        self.database = database
    }

    func conectar() -> Bool {
        do {
            // Crie uma instância de configuração do MariaDB
            let config = MariaDB.Configuration(
                host: host,
                username: user,
                password: password,
                database: database
            )

            // Conecte ao banco de dados MariaDB
            connection = try MariaDB.Connection(configuration: config)
            try connection?.connect()

            // Verifique se a conexão foi bem-sucedida
            if connection?.isConnected ?? false {
                print("Conexão com o banco de dados MariaDB estabelecida.")
                return true
            } else {
                print("Erro ao conectar ao banco de dados MariaDB.")
                return false
            }
        } catch {
            // Trate erros de conexão
            print("Erro ao conectar ao banco de dados MariaDB: \(error)")
            return false
        }
    }
}