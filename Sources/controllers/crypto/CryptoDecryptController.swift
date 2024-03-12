import CryptoSwift
import RSA

class CryptoDecryptController {
    let database: Database // Classe para conectar ao banco de dados (substitua por implementação real)

    init(database: Database) {
        self.database = database
    }

    func armazenarDados(data: Data, chaveAES: String) -> Bool {
        // Gerar chave privada RSA
        guard let chavePrivada = try? RSA.generate(keySize: 2048, exponent: 65537).privateKey else {
            return false
            //O ? é usado para desempacotar um valor opcional. 
            //Se o valor opcional for nil, a expressão inteira se torna nil.
            
            //guard let é usado para garantir que uma variável opcional não seja nil 
            //e, se for nil, sair do escopo atual.
        }

        // Criptografar dados com AES
        guard let dataCriptografada = encryptAES(data: data, key: chaveAES) else {
            return false
        }

        // Criptografar chave AES com RSA
        guard let chaveAEScriptografada = encryptAES(data: chaveAES.data(using: .utf8)!, key: chavePrivada.description) else {
            return false
        }

        // Criar objeto de dados criptografados
        let dadosCriptografados = DadosCriptografados(data: dataCriptografada, chaveAES: chaveAEScriptografada.description, dataCriacao: Date())

        // Salvar dados no banco de dados (substitua por implementação real)
        return database.salvarDados(dadosCriptografados: dadosCriptografados)
    }

}