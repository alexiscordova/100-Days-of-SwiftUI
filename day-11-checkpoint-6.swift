import Cocoa

struct Car {
    let model: String
    let seats: Int
    private(set) var currentGear: Int = 0 {
        didSet {
            print("New current gear: \(currentGear)")
        }
    }
    
    mutating func changeGears(_ gearChange: Int) {
        if currentGear + gearChange > 0 && currentGear + gearChange <= 10 {
            print("Gear successfully changed to \(gearChange)")
            currentGear += gearChange
        } else {
            print("Cannot change gear to \(currentGear + gearChange)")
        }
    }
}

var mySubaru = Car(model: "Crosstrek", seats: 5)
mySubaru.changeGears(2)
mySubaru.changeGears(5)
mySubaru.changeGears(-7) // this wont work because currentGear == 0
