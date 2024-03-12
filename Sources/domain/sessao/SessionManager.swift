protocol SessionManager {
    func iniciarSessao(para usuario: Usuario) -> Sessao
    func validarSessao(_ token: String) -> Bool
    func invalidarSessao(_ token: String)
}