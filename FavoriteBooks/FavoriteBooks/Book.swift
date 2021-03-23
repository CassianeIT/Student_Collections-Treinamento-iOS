import Foundation

struct Book: CustomStringConvertible, Codable {
    let title: String
    let author: String
    let genre: String
    let length: String
    
    var description: String {
        return "\(title) is written by \(author) in the \(genre) genre and is \(length) pages long"
    }
    
    static var archiveURL: URL {
            let documentsDirectory =
                FileManager.default.urls(for: .documentDirectory,
                in: .userDomainMask).first!
            let archiveURL =
                documentsDirectory.appendingPathComponent("books")
                .appendingPathExtension("plist")
            
            return archiveURL
        }
    
    static var sampleBooks: [Book] {
       return []
        
    }
    
    // Verificacao se tem o arquivo
static func saveToFile(books: [Book]) {
    let encoder = PropertyListEncoder()
    do {
        let encodedBooks = try? encoder.encode(books)
        try encodedBooks?.write(to: archiveURL)
    } catch {
        print("Error encoding books: \(error)")
    }
}
    
    // leitura do arquivo
static func loadFromFile() -> [Book]? {
        guard let booksData = try? Data(contentsOf: Book.archiveURL) else { // primeiro ve se o arquivo ta la, se tiver passa pelo guard
            return nil
        }
      print(Book.archiveURL)
        do { // ai ele faz a leitura
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: booksData)
            return decodedBooks
        } catch {
            print("Error decoding books: \(error)")
            return nil
        }
    }

}

