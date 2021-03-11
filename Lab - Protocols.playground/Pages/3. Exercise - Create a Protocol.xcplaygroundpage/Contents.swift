/*:
 ## Exercise - Create a Protocol

 Create a protocol called `Vehicle` with two requirements: a nonsettable `numberOfWheels` property of type `Int` and a function called `drive()`.
 */
protocol Vehicle {
    var numberOfwheels: Int { get }
    func drive()
}

/*:
 Define a `Car` struct that implements the `Vehicle` protocol. `numberOfWheels` should return a value of 4, and `drive()` should print "Vroom, vroom!" Create an instance of `Car`, print its number of wheels, then call `drive()`.
 */
struct Car: Vehicle {
    var numberOfwheels: Int {
        return 4
    }
    
    func drive() {
        print("Moving")
    }
    
    
}

let kwid = Car()
kwid.numberOfwheels
kwid.drive()
/*:
 Define a `Bike` struct that implements the `Vehicle` protocol. `numberOfWheels` should return a value of 2, and `drive()` should print "Begin pedaling!" Create an instance of `Bike`, print its number of wheels, then call `drive()`.
 */
struct Bike: Vehicle {
    var numberOfwheels: Int {
        return 2
    }
    func drive() {
        print("Pedalando")
    }
}

let caloi = Bike()
caloi.numberOfwheels
caloi.drive()
//: [Previous](@previous)  |  page 3 of 5  |  [Next: App Exercise - Similar Workouts](@next)
