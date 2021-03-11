/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, Comparable, and Codable

 Create a `Human` class with two properties: `name` of type `String` and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
//class Human {
//    var name: String
//    var age: Int
//
//    init (name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//let cassi = Human(name: "Cassiane", age: 24)
//print(cassi)
/*:
 Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
 */
//class Human: CustomStringConvertible {
//    var description: String {
//        return "Specie: Human, Name: \(name), Age: \(age)"
//    }
//
//    var name: String
//    var age: Int
//
//    init (name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//let cassi = Human(name: "Cassiane", age: 24)
//print(cassi)

/*:
 Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether your two previously initialized `Human` objects are equal to each other (using `==`). Then print the result of a boolean expression evaluating whether your two previously initialized `Human` objects are not equal to each other (using `!=`).
 */
//class Human: CustomStringConvertible, Equatable {
//
//    var description: String {
//            return "Specie: Human, Name: \(name), Age: \(age)"
//        }
//    static func == (lhs: Human, rhs: Human) -> Bool {
//        return lhs.name == rhs.name && lhs.age == rhs.age
//    }
//
//
//    var name: String
//    var age: Int
//
//    init (name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//let cassi = Human(name: "Cassiane", age: 24)
//let joao = Human(name: "João", age: 19)
//
//let teste = cassi == joao
//// ou
//print(cassi == joao)
//print(cassi != joao)
//
//print(teste)


/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable {
    static func < (lhs: Human, rhs: Human) -> Bool {
        return lhs.age > rhs.age
    }
    
   
    var description: String {
            return "Specie: Human, Name: \(name), Age: \(age)"
        }
    static func == (lhs: Human, rhs: Human) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    
    var name: String
    var age: Int
    
    init (name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let cassi = Human(name: "Cassiane", age: 24)
let joao = Human(name: "João", age: 19)

let teste = cassi == joao
// ou
print(cassi == joao)
print(cassi != joao)

print(teste)

// 3 novas instancias para usar o Comrable
let maria = Human(name: "Maria", age: 21)
let joaoo = Human(name: "Joaoo", age: 21)
let marcos = Human(name: "Marcos", age: 27)
let ana = Human(name: "Ana", age: 30)

let people = [maria, joaoo, marcos, ana]

let sortedpeople = people.sorted(by: <)
/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored and print it to the console.
 */
import Foundation
// JsonEncoder é uma classe do swift e precisa do import foudation

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(maria) {
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
}

//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
