//
//  StructMyLibrary.swift
//  My Library
//
//  Created by Curitiba on 22/03/21.
//

import Foundation

struct Book: Codable {
    var image: String
    var title: String
    var authors: String

// MARK: - Array Books

static var archiveURL: URL {
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
            in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent("books")
            .appendingPathExtension("plist")
        
        return archiveURL
    }

static var bookArray: [Book] {
    return [
        Book(image: "A Guide to Tea", title: "A Guide to Tea", authors: "Adagio Teas"),
        Book(image: "Blasting for Health", title: "Blasting Optimum for Health Recipe Book", authors: "NutriBullet"),
        Book(image: "Bosch", title: "Bosch", authors: "Laurinda Dixon"),
        Book(image: "Date to Lead", title: "Date to Lead", authors: "Brené Brown"),
        Book(image: "Doodle All Year", title: "Doodle All Year", authors: "Taro Gomi"),
        Book(image: "Drawing People", title: "Drawing People", authors: "Barbara Bradley"),
        Book(image: "Drinking Saints", title: "Drinking  with the Saints", authors: "Michael P. Foley"),
        Book(image:  "Ein Neues Land", title: "Ein Neues Land", authors: "Shaun Tan"),
        Book(image: "Goya", title: "The Life and Complete Work Francisco Goya", authors: "P. Gassier & J Wilson"),
        Book(image: "How to Draw Cats", title: "How to Draw Cats", authors: "Janet Rancan"),
        Book(image: "Pressed Fairy Book", title: "Lady Cottington's Pressed Fairy Book", authors: "Lady Cottington"),
        Book(image: "What to Say", title: "What to Say When You Talk to Yourself", authors: "Shad Helmstetter")
    ]
  }
    
    // Verificacao se tem o arquivo
static func saveToFile(books: [Book]) {
    let encoder = PropertyListEncoder()
    do {
        let encodedBooks = try? encoder.encode(books)
        try encodedBooks?.write(to: archiveURL)
    } catch {
        print("Error encoding emojis: \(error)")
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
