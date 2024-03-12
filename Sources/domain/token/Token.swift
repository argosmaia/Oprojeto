import Foundation
import CryptoKit // Para gerar tokens seguros

class Token {
    let valor: String
    let dataExpiracao: Date

    init(valor: String, dataExpiracao: Date) {
        self.valor = valor
        self.dataExpiracao = dataExpiracao
    }

    // chama a classe ValidadorToken e seu método validarToken
    func isValido() -> Bool {
        let validador = ValidadorToken(tokenService: TokenService())
        return validador.validarToken(valor)
    }
}
