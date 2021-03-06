//
//  Emoji.swift
//  EmojiDictonary
//
//  Created by Curitiba on 12/03/21.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String

static var archiveURL: URL {
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
            in: .userDomainMask).first!
        let archiveURL =
            documentsDirectory.appendingPathComponent("emojis")
            .appendingPathExtension("plist")
        
        return archiveURL
    }
   
    static var sampleEmojis: [Emoji] {
       return [
        Emoji(symbol: "π", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "π", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "π", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "π§βπ»", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
        Emoji(symbol: "π’", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
        Emoji(symbol: "π", name: "Elephant", description:"A gray elephant.", usage: "good memory"),
        Emoji(symbol: "π", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "π²", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "βΊοΈ", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "π", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "π", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "π€", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "π", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
    ]
    }
    
    // Verificacao se tem o arquivo
static func saveToFile(emojis: [Emoji]) {
    let encoder = PropertyListEncoder()
    do {
        let encodedEmojis = try? encoder.encode(emojis)
        try encodedEmojis?.write(to: archiveURL)
    } catch {
        print("Error encoding emojis: \(error)")
    }
    
}
    
    // leitura do arquivo
static func loadFromFile() -> [Emoji]? {
        guard let emojisData = try? Data(contentsOf: Emoji.archiveURL) else { // primeiro ve se o arquivo ta la, se tiver passa pelo guard
            return nil
        }
      print(Emoji.archiveURL)
        do { // ai ele faz a leitura
            let decoder = PropertyListDecoder()
            let decodedEmojis = try decoder.decode([Emoji].self, from: emojisData)
            return decodedEmojis
        } catch {
            print("Error decoding emojis: \(error)")
            return nil
        }
    }

}
