import Foundation

class DocumentHelper {
    
    // Gera um CPF válido seguindo o algoritmo especificado
    static func generateCPF() -> String {
        // Gerando 9 dígitos aleatórios
        var listaDeCPFs = (1...9).map { _ in Int.random(in: 0...9) }
        
        // Calculando o primeiro dígito verificador
        let primeiroDigito = calculateDigit(for: listaDeCPFs, multiplier: 10)
        listaDeCPFs.append(primeiroDigito)
        
        // Calculando o segundo dígito verificador
        let segundoDigito = calculateDigit(for: listaDeCPFs, multiplier: 11)
        listaDeCPFs.append(segundoDigito)
        
        // Convertendo o array de inteiros para uma única string
        let geradorDeCPF = listaDeCPFs.map { String($0) }.joined()
        return geradorDeCPF
    }
    
    private static var cpfGerados: Set<String> = []
    
    // Gera um CPF único e válido
    static func generateUniqueCPF() -> String {
        var cpf: String
        repeat {
            cpf = generateCPF()
        } while !cpfGerados.insert(cpf).inserted
        return cpf
    }
    
    // Calcula um dígito verificador para o CPF
    private static func calculateDigit(for listaDeCPFs: [Int], multiplier: Int) -> Int {
        var soma = 0
        for i in 0..<listaDeCPFs.count {
            soma += listaDeCPFs[i] * (multiplier - i)
        }
        
        let resto = soma % 11
        if resto < 2 {
            return 0
        } else {
            return 11 - resto
        }
    }
}

/**
let cpfG = DocumentHelper.generateUniqueCPF()
print(cpfG)

método para chamar o cpf em qualquer lugar do projeto
*/