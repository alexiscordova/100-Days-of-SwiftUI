import Cocoa

enum changeGearDirections {
    case up, down
}

struct Car {
    let model: String
    let seats: Int
    let maxGear = 5
    private(set) var currentGear: Int = 0 {
        didSet {
            print("Gear changed!")
            print("New current gear: \(currentGear)")
        }
    }
    
    mutating func changeGears(_ gearChange: changeGearDirections) {
        if gearChange == changeGearDirections.up && currentGear < maxGear {
            currentGear += 1
        } else if gearChange == changeGearDirections.down && currentGear > 0 {
            currentGear -= 1
        } else {
            print("Cannot change gears")
        }
    }
}

var mySubaru = Car(model: "Crosstrek", seats: 5)
mySubaru.changeGears(changeGearDirections.up)
mySubaru.changeGears(changeGearDirections.up)
mySubaru.changeGears(changeGearDirections.down)
mySubaru.changeGears(changeGearDirections.down)
mySubaru.changeGears(changeGearDirections.down) // Won't work, currentGear == 0
