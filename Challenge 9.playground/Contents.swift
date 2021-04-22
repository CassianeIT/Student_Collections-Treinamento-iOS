import UIKit


 //Deve retornar true
var frase1 = "The quick brown fox jumps over the lazy dog"
 //Deve retornar false
var frase2 = "The quick brown fox jumped over the lazy dog"


func verificaRegex (frase: String) -> Bool {
    // traz a quant de letras
  //  let frase = String ()
    let range = NSRange(location: 0, length: frase.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[a-z]a...z{1}")

    let regexResult = regex.firstMatch(in: frase, options: [], range: range) != nil
    
    if !regexResult {
        return false
    }

    return true
}


verificaRegex(frase: "The quick brown fox jumps over the lazy dog")
verificaRegex(frase: "The quick brown fox jumped over the lazy dog")


// Função da internet
func isPangram(_ string: String) -> Bool {
    var isPan = true
    "abcdefghijklmnopqrstuvwxyz".forEach({
        if !string.lowercased().contains($0) { isPan = false }
    })
    return isPan
}

isPangram("The quick brown fox jumps over the lazy dog")
isPangram("The quick brown fox jumped over the lazy dog")




// Função para validar o CEP
func validateZipCode(zipCode: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[0-9]{2}[0-9]{3}-[0-9]{3}$", options: [.caseInsensitive])

    let regexResult = regex.firstMatch(in: zipCode, options:[], range: NSMakeRange(0, zipCode.utf8.count)) != nil

    if !regexResult {
        return false
    }

    return true
}

validateZipCode(zipCode: "80310-410")
validateZipCode(zipCode: "teste")






// Solução do Jonatan
let alfabet = "abcdefghijklmnopqrstuvwxyz "
var x = "The quick brown fox jumps over the lazy dog"
var total = 0

for letter in alfabet {
    if x.lowercased().contains(letter) {
        total += 1
    }
}
total > 26 ? print("Is Pangrams") : print("Is not Pangrams")

///--------------------------------

//extension NSRegularExpression {
//    func testes(_ string: String) -> Bool {
//        let range = NSRange(location: 0, length: string.utf16.count)
//        return firstMatch(in: string, options: [], range: range) != nil
//    }
//}
//
//extension String {
//    static func ~= (lhs: String, rhs: String) -> Bool {
//        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
//        let range = NSRange(location: 0, length: lhs.utf16.count)
//        return regex.firstMatch(in: lhs, options: [], range: range) != nil
//    }
//}
//
//"The quick brown fox jumped over the lazy dog" ~= "[a-z]"
