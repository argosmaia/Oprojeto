// Classe para interagir com o banco de dados
class Database {
    private let connection: DatabaseConnection

    init(connection: DatabaseConnection) {
        self.connection = connection
    }

    func salvarDados(data: Data) -> Bool {
        // Lógica para salvar dados no banco de dados
        return "lógica para salvar dados no banco de dados"
    }

    func getData(withID id: Int) -> Data? {
        // Lógica para recuperar dados do banco de dados
        return "lógica para recuperar dados do banco de dados"    
    }
}

// let database = Database(connection: connection)

// database.save(data: ...)
// let data = database.getData(withID: ...)