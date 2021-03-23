import Foundation

//Model
struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

////Dados
//let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.", timestamp: Date())
//// Acesso a pasta documentos
//let documentsDirectory =
//   FileManager.default.urls(for: .documentDirectory,
//   in: .userDomainMask).first!
//
//// Caminho do arquivo
//let archiveURL =
//   documentsDirectory.appendingPathComponent("notes_test")
//   .appendingPathExtension("plist")
//print(archiveURL)
//
//
//// Esquema de codificação (encoding)
//let propertyListEncoder = PropertyListEncoder()
//let encodedNotes = try? propertyListEncoder.encode(newNote)
//
//// Gravação do arquivo
//try? encodedNotes?.write(to: archiveURL, options: .noFileProtection)
//
//if let encodedNote = try? propertyListEncoder.encode(newNote) {
//    print(encodedNote)
//    // Leitura (decodificação do arquivo)
//    let propertyListDecoder = PropertyListDecoder()
//    if let decodedNote = try?
//       propertyListDecoder.decode(Note.self, from: encodedNote) {
//        print(decodedNote)
//    }
//}
// para procurar a pasta pegar o caminho do print archiveURL (ex: /Users/.. abrir finder, parte superior clicar em Ir -> Ir para a pasta -> colar link, obs tirar o fille

// Agora persistindo um array

let note1 = Note(title: "Note One", text: "This is a sample note.", timestamp: Date())
let note2 = Note(title: "Note Two", text: "This is another sample note.", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())
let notes = [note1, note2, note3]

let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
   in: .userDomainMask).first!
let archiveURL =
   documentsDirectory.appendingPathComponent("notes_test")
   .appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNotes = try? propertyListEncoder.encode(notes)

try? encodedNotes?.write(to: archiveURL,
   options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrievedNotesData = try? Data(contentsOf: archiveURL),
    let decodedNotes = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNotesData) {
    print(decodedNotes)
}
