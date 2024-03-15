import Foundation

// Classe para gerenciar a conexão ao banco de dados
protocol DatabaseConnection {
    func conectar() -> Bool
}

//let connection = DatabaseConnection(credentials: credentials)
