import Cocoa

// VARIABLES AND CONSTANT
var name = "Ted"
name = "Rebecca"

// This is a constant and is immutable
let user = "Daphne"
print(user)

// STRINGS
let actor = "Tom Cruise"
let emoji = "🏃🏽‍♂️‍➡️"
let quote = "He tapped a sign saying \"Believe\" and walked away."
let movie = """
A day in
the life of an
Apple engineer
"""

print(actor.count) // number of letters in actor constant
print(quote.hasPrefix("He")) // true, beings with "He"

// NUMBERS
let score = 10
let higherScore = score + 10
let halvedScore = score / 2

var counter = 10
counter += 5 // 15

let number = 120
print(number.isMultiple(of: 3)) // Similar to the % operator in JS

let id = Int.random(in: 1...100) // Generate a random number between a range

// DOUBLE (FLOATING POINT NUMBER)
let newScore = 3.0 // Different than 3, cannot be compared to Int

// BOOLEAN
let goodDogs = true
let gameOver = false

var isSaved = false
isSaved.toggle() // Flips bool to true

// JOINING STRINGS
let personName = "Taylor"
let age = 26
let message = "I'm \(name) and I'm \(age) years old"

// ARRAY
var colors = ["Red", "Green", "Blue"] // Array of strings
let numbers = [4, 8, 15, 16] // Array of Ints
var readings = [0.1, 0.5, 0.8] // Array of Doubles

colors.append("Tartan") // Adds to end of Array. Must match types of array items
colors.remove(at: 0) // Removes first item of array
print(colors.contains("Octarine")) // searches array

// DICTIONARIES
let employee = [
    "name": "Taylor",
    "job": "Singer"
]

print(employee["job", default: "Unknown"]) // prints "Singer"

// SETS
var setNumbers = Set([1, 1, 3, 5, 7, 9])
print(setNumbers) // removes duplicates, order is random

setNumbers.insert(10) // adds to Set
setNumbers.contains(11) // Runs instantly

// ENUMS
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .friday // Shorthand

// TYPE ANNOTATION
var typeScore: Double = 0

let player: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var albums: Array<String> = ["Red", "Fearless"]
var moreAlbums: [String] = ["1989", "Evermore"] // Shorthand for Array
var endUser: Dictionary<String, String> = ["id": "@acordova"]
var otherUser: [String: String] = ["id": "@hellacutty"] // Shorthand for Dictionary
var books: Set<String> = Set(["The Bluest Eyes", "Foundation"])

var teams: [String] = [String]() // Empty array of strings
var clues = [String]() // Shorthand for empty array of strings

// CONDITIONALS
let votingAge = 16

if votingAge < 12 {
    print("You can't vote")
} else if votingAge < 18 {
    print("You can vote soon")
} else {
    print("You can vote")
}

// SWITCH
enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

// Switch cases need to be exhaustive
switch forecast {
case .sun:
    print("A nice day")
case .rain:
    print("Pack an umbrella")
default:
    print("Should be ok")
}

// TERNARY
let newAge = 18
let canVote = newAge >= 18 ? "yes" : "no"
print(canVote)

// LOOPS
let platforms = ["iOS", "macOS", "watchOS", "tvOS"]

for os in platforms {
    print("Swift works on \(os)")
}

// Loops through a range of 1 through 12 INCLUDING 12
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// Loops through a range of 1 through 12 EXCLUDING 12
for i in 1..<12 {
    print("5 x \(i) is \(5 * i)")
}

// Loop without an iterator
var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

// While Loop
var count = 10

while count > 0 {
    print("\(count)…")
    count -= 1
}
print("Go!")

let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        continue // skips iteration
    }
    
    print("Found picture: \(file)")
}

for file in files {
    if file.hasSuffix(".jpg") == false {
        break // skips the rest of the loop
    }
    
    print("Found picture: \(file)")
}

// FUNCTIONS
func printTimesTable(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(number: 8)

// Function return
func rollDice() -> Int {
    return Int.random(in: 1...6) // "return" can be removed since this is 1 line of code
}

let result = rollDice()
print(result)

// TUPLES
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let artistUser = getUser()
print("Name: \(artistUser.firstName) \(artistUser.lastName)")

// Destructuring
var (firstName, lastName) = getUser()
// var (firstName, _) = getUser() omits the variable you don't want (e.g., "lastName)

// FUNCTION PARAMETERS
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO WORLD"
let stringResult = isUppercase(string)
print(stringResult)

// "for" is used when calling the function
// "number" is used internally
func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 4)

// DEFAULT PARAMETER VALUES
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)")
    } else {
        print("Hi, \(person)")
    }
}

greet("Tim")
greet("Taylor", formal: true)

// ERROR HANDLING IN FUNCTIONS
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if (password.count < 5) {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

// Must have generic catch error at the end
do {
    let result = try checkPassword("12345")
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage")
} catch {
    print("There was an error")
}

// CLOSURES
let sayHello = {
    print("Hi there")
}

sayHello()

// "in" marks the end of our parameters and return type
let sayHelloAgain = { (name: String) -> String in
    "Hi, \(name)"
}

let team = ["Gloria", "Susanne", "Tiffany", "Tasha"]
// Trailing closure shorthand
// Filters can be shortend as follows:
// let onlyT = team.filter { $0.hasPrefix("T") }
let onlyT = team.filter({ (name: String) -> Bool in
    name.hasPrefix("T")
})
print(onlyT)

// STRUCT
// Structs automatically creates a memberwise initializer (init)
struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    // "mutating" keyword required to change values within Struct
    mutating func removeFromSale() {
        isReleased = false
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()

// Struct Computed Propertis
struct Employee {
    let name: String
    var vacationAllowed = 14
    var vacationTaken = 0
    
    // Calculated dynamically every time vacationRemaining is called
    var vacationRemaining: Int {
        // default "get"
        vacationAllowed - vacationTaken
    }
    
    var newVacationRemaining: Int {
        get {
            vacationAllowed - vacationTaken
        }
        
        set {
            vacationAllowed = vacationTaken + newValue
        }
    }
}

// Property Observers
struct Game {
    var score = 0 {
        // Rarely used, fires before score is set
        willSet {
            print("Calculating score…")
        }
        
        // Fires after score is set
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3

// CUSTOM INITIALIZERS
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

// ACCESS CONTROL
// private: no read/write
// private(set): external can read, internal read/write
// fileprivate: anything inside the current file can read
// public: any read/write

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

let account = BankAccount(funds: 100)
print(account.funds)
// account.funds += 1000 // ERROR

// STATIC PROPERTIES AND METHODS
struct AppData {
    static let version = "1.3 beta 2"
    static let settingsFile = "settings.json"
}

print(AppData.version)

// CLASSES
// Differences from Structs:
// 1. Classes can inherit from other Classes

class NewEmployee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day")
    }
}

class Developer: NewEmployee {
    func work() {
        print("I'm coding for \(hours) hours a day")
    }
    
    // Override parent method
    override func printSummary() {
        print("I spend \(hours) hours a day fighting over tabs over spaces")
    }
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()

// 2. Classes do not get automatic initializers
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    // Child classes must init parent class properties
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        
        // Must call super LAST with parent properties
        super.init(isElectric: isElectric)
    }
}

// 3. All copies of a class share one set of data
class Actor {
    var name = "Nicolas Cage"
}

var actor1 = Actor()
var actor2 = actor1

actor1.name = "Tom Cruise"
print(actor1.name) // Value is "Tom Cruise"
print(actor2.name) // Value is "Tom Cruise"

// 4. Classes can deinitialize when the last reference is destroyed (runs automatically)
class Site {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Site \(id): I've been created")
    }
    
    deinit {
        print("Site \(id): I've been destroyed")
    }
}

for i in 1...3 {
    let site = Site(id: i)
    print("Site \(site.id): I'm in control")
}

// 5. Classes let us change variable properties even if the class is a constant
class Singer {
    var name = "Adele" // variable
}

let singer = Singer() // constant
singer.name = "Justin"

print(singer.name) // "Justin"

// PROTOCOLS
// Define functionality other types must support (TypeScript Interface)
// Does not contain code; only specifying variables, methods, etc.
protocol NewVehicle {
    var name: String { get } // read only
    var currentPassengers: Int { get set } // read/write
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct NewCar: NewVehicle {
    // From protocol
    let name = "Car"
    
    // From protocol
    var currentPassengers = 1
    
    // From protocol
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    // From protocol
    func travel(distance: Int) {
        print("I'm driving \(distance)mi")
    }
    
    // Specific to NewCar
    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: NewVehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let newCar = NewCar()
commute(distance: 100, using: newCar)

// EXTENSIONS
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // mutating required when new values aren't created
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var newQuote = "   The truth is rarely pure and rarely simple   "
var trimmed = newQuote.trimmed() // Creates a new value that is trimmed
newQuote.trim() // Trims the original string

let newLyrics = """
But I keep cruising
Can't stop, won't stop moving
"""

print(newLyrics.lines.count) // 2

// PROTOCOL EXTENSIONS
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]
if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

// OPTIONALS
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"] // type is "String?" (? denotes optional), value is nil as it does not exist

// Unwrapping the optional
// if let: run if optional exists
// If true, marioOpposite becomes a variable and is available in the body
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

// guard let:
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return // MUST EXIT SCOPE FOR FAIL CASE
    }
    
    // number is available after the guard if the condition passes
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: 4)

// Nil coalescing
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

let input = ""
let nilNumber = Int(input) ?? 0 // because Int(input) will fail, it will be set to the default provided
print(nilNumber)

// Optional Chaining
let starkNames = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = starkNames.randomElement()?.uppercased() // If randomElement returns a valid case, uppercase it
print("Next in line: \(chosen ?? "No one")") // if optional fails, set default provided

// Optional Try
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

// Check if error is thrown
// Actual error not returned!
// If you care about which error is thrown, use do try
if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
