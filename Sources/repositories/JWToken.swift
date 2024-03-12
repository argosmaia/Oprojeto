import Foundation
import CryptoKit // Para gerar tokens seguros


class JWToken: Token {
    
    let header: JWTHeader
    let payload: JWTPayload
    let signature: String
    
    init(usuario: Usuario) {
        let header = JWTHeader(algorithm: "HS256", type: "JWT")
        let payload = JWTPayload(iss: "Seu emissor", sub: usuario.id, aud: "Seu público", exp: Date().addingTimeInterval(3600)) // 1 hora de expiração
        let signingInput = "\(header.base64EncodedString()) . \(payload.base64EncodedString())"
        let signature = HMAC.sha256(key: "Sua chave secreta".data(using: .utf8)!, message: signingInput.data(using: .utf8)!).base64EncodedString()
        
        self.header = header
        self.payload = payload
        self.signature = signature
        
        super.init(valor: "\(header).\(payload).\(signature)", dataExpiracao: payload.exp)
    }
}