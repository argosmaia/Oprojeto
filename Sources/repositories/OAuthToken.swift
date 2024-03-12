class OAuthToken: Token {
    
    let tokenType: String
    let accessToken: String
    let refreshToken: String?
    let expiresIn: Int?
    
    init(usuario: Usuario) {
        // Simulação de requisição para obter token OAuth
        let tokenResponse = ["token_type": "bearer", "access_token": "ABCD1234", "refresh_token": "XYZ9876", "expires_in": 3600]
        
        self.tokenType = tokenResponse["token_type"]!
        self.accessToken = tokenResponse["access_token"]!
        self.refreshToken = tokenResponse["refresh_token"]
        self.expiresIn = tokenResponse["expires_in"] as? Int
        
        let dataExpiracao = Date().addingTimeInterval(Double(expiresIn!))
        super.init(valor: accessToken, dataExpiracao: dataExpiracao)
    }
}
