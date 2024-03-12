import CryptoSwift
import RSA

class Crypto {
    static func generateRSAKey() -> Result<RSAKey, Error> {
        let keySize = 2048
        let exponent = 65537
        let chave 
        // Gerar par de chaves com geração obrigatória
        return try RSA.generate(keySize: keySize, e: exponent)
    }
    // // Função para criptografar uma mensagem com a chave pública
    // static func encryptRSA(message: String, publicKey: RSAKey) -> Result<Data, Error> {
    //     return Result {
    //         let clearMessage = try ClearMessage(string: message, using: .utf8)
    //         let encryptedMessage = try clearMessage.encrypted(with: publicKey, padding: .PKCS1)
    //         return encryptedMessage.data
    //     }
    // } 

    // Função para criptografar dados com AES usando uma chave
    func encryptAES(data: Data, key: String) -> Data? {
        // Definir parâmetros de criptografia AES
        let aes = AES(key: key, blockMode: .CBC, iv: "0123456789012345")

        // Criptografar dados
        return try? aes.encrypt(data)
    }

    // Função para descriptografar dados com AES usando uma chave
    func decryptAES(data: Data, key: String) -> Data? {
        // Definir parâmetros de criptografia AES
        let aes = AES(key: key, blockMode: .CBC, iv: "0123456789012345")

        // Descriptografar dados
        return try? aes.decrypt(data)
    }

}