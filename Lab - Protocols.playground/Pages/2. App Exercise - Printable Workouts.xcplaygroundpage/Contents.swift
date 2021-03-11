/*:
 ## App Exercise - Printable Workouts

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 The `Workout` objects you have created so far in app exercises don't show a whole lot of useful information when printed to the console. They also aren't very easy to compare or sort. Throughout these exercises, you'll make the `Workout` class below adopt certain protocols that will solve these issues.
 */
class Workout: CustomStringConvertible, Equatable, Comparable, Codable {
    static func < (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier < rhs.identifier
    }
    
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var description: String {
        return "Fiz meu exercicio \(identifier), no tempo \(time), percorri a distância de \(distance)"
    }
    
    var distance: Double
    var time: Double
    var identifier: Int

    init(distance: Double, time: Double, identifier: Int) {
        self.distance = distance
        self.time = time
        self.identifier = identifier
    }
}

/*:
 Make the `Workout` class above adopt the `CustomStringConvertible` protocol so that printing an instance of `Workout` will provide useful information in the console. Create an instance of `Workout`, give it an identifier of 1, and print it to the console.
 */
var myworkout = Workout(distance: 20, time: 1.30, identifier: 1)
var mysecondworkout = Workout(distance: 20, time: 1.30, identifier: 2)

print(myworkout)

/*:
 Make the `Workout` class above adopt the `Equatable` protocol. Two `Workout` objects should be considered equal if they have the same identifier. Create another instance of `Workout`, giving it an identifier of 2, and print a boolean expression that evaluates whether it is equal to the first `Workout` instance you created.
 */
print(myworkout == mysecondworkout)

/*:
 Make the `Workout` class above adopt the `Comparable` protocol so that you can easily sort multiple instances of `Workout`. `Workout` objects should be sorted based on their identifier.

 Create three more `Workout` objects, giving them identifiers of 3, 4, and 5. Then create an array called `workouts` of type `[Workout]` and assign it an array literal with all five `Workout` objects you have created. Place the objects in the array out of order. Then create another array called `sortedWorkouts` of type `[Workout]` that is the `workouts` array sorted by identifier.
 */
var workout3 = Workout(distance: 33, time: 1.20, identifier: 4)

let wordkouts = [myworkout, mysecondworkout, workout3]
let sortedworkout = wordkouts.sorted(by: >)

/*:
 Make the `Workout` class above adopt the `Codable` protocol so that you can easily encode `Workout` objects as data that can be stored between app launches. Use a `JSONEncoder` to encode one of your `Workout` instances. Then use the encoded data to initialize a `String` and print it to the console.
 */
import Foundation

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(myworkout) {
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
}


//: [Previous](@previous)  |  page 2 of 5  |  [Next: Exercise - Create a Protocol](@next)
