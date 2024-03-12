import Foundation
import CryptoKit // Para gerar tokens seguros

class ValidadorToken: TokenService {
    private let tokenService: TokenService

    init(tokenService: TokenService) {
        self.tokenService = tokenService
    }

    func validarToken(_ token: String) -> Bool {
        return tokenService.validarToken(token)
    }
}