class Sessao {
    let usuario: User
    let token: Token
    let dataInicio: Date

    init(usuario: Usuario, token: Token, dataInicio: Date) {
        self.usuario = usuario
        self.token = token
        self.dataInicio = dataInicio
    }

    func isExpirado() -> Bool {
        return token.isExpirado()
    }
}
