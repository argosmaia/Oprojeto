import CryptoSwift
import RSA

class DadosCriptografados {

    let dataCriptografada: Data
    let chaveAES: String
    let dataCriacao: Date

    init(data: Data, chaveAES: String) {
        self.dataCriptografada = data
        self.chaveAES = chaveAES
        self.dataCriacao = Date()
    }

    // Função para descriptografar os dados usando a chave privada RSA
    func descriptografar(chavePrivada: String) -> Data? {
        // Gerar objeto de criptografia
        let criptografia = Criptografia()

        // Descriptografar chave AES com RSA
        guard let chaveAESDescriptografada = criptografia.decryptAES(data: dataCriptografada, key: chavePrivada) else {
            return nil
        }

        // Descriptografar dados com chave AES
        return criptografia.decryptAES(data: chaveAESDescriptografada, key: chaveAES)
    }
}