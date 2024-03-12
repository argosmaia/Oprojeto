import Foundation
import CryptoKit // Para gerar tokens seguros

struct JWTPayload: Codable {
    let iss: String // Emissor
    let sub: String // Assunto
    let aud: String // Público
    let exp: Date // Expiração
}