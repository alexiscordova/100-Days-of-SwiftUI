import Cocoa

// HWS Checkpoint 8
// Make a protocol that describes a building
// Your protocol should require the following:
//     A property storing how many rooms it has
//     A property storing the cost as an Integer
//     A property storing the name of the estate agent selling the building
//     A method for printing the sales summary of the building
// Create two structs, House and Office, that conform to our protocol

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var agentName: String { get }
    func salesSummary()
}

extension Building {
    func salesSummary() {
        print("This building is being sold by \(agentName). It has \(rooms) rooms and costs $\(cost)")
    }
}

struct House: Building {
    var rooms = 5
    var cost = 899_999
    var agentName = "Brian Eustis"
    func salesSummary() {
        print("This home is being sold by \(agentName). It has \(rooms) rooms and costs $\(cost)")
    }
}

struct Office: Building {
    var rooms = 25
    var cost = 4_500_001
    var agentName = "Laurent Martini"

}

var pdxHouse = House()
pdxHouse.salesSummary()

let theOffice = Office()
theOffice.salesSummary()
