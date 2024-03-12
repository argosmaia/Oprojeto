class GerenciadorSessao: SessionManager {

    private let Database: Database // Classe para interagir com o BD

    init(Database: Database) {
        self.Database = Database
    }

    func iniciarSessao(para usuario: Usuario) -> Sessao {
        let token = gerarToken()
        let dataInicio = Date()
        let sessao = Sessao(usuario: usuario, token: token, dataInicio: dataInicio)

        // Salvar a sessão no banco de dados
        Database.salvarSessao(sessao)

        return sessao
    }

    func validarSessao(_ token: String) -> Bool {
        // Buscar a sessão no banco de dados pelo token
        guard let sessao = Database.buscarSessao(porToken: token) else {
            return false
        }

        return !sessao.isExpirado()
    }

    func invalidarSessao(_ token: String) {
        // Apagar a sessão no banco de dados pelo token
        Database.apagarSessao(porToken: token)
    }

    // Função para gerar um token seguro
    private func gerarToken() -> Token {
        let valor = UUID().uuidString
        let dataExpiracao = Date().addingTimeInterval(TimeInterval(minutes: 5)) // Expira em 5 minutos
        return Token(valor: valor, dataExpiracao: dataExpiracao)
    }
}
