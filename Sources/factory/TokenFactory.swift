class TokenFactory {
    static func criarToken(tipo: TokenType, para usuario: Usuario) -> Token  {
        switch tipo {
        case .jwt:
            return JWToken(usuario: usuario)
        case .oauth:
            return OAuthToken(usuario: usuario)
        }
    }
}