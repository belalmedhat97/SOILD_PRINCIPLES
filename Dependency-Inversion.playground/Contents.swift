import Foundation


// The idea of Dependency Inversion Principle:
// ###########################################
///  HIGH LEVEL MODULES SHOULD NOT DEPEND UPON LOW LEVEL MODULES. BOTH SHOULD DEPEND UPON ABSTRACTIONS. ( protocols)
///  ABSTRACTIONS SHOULD NOT DEPEND UPON DETAILS. DETAILS SHOULD DEPEND UPON ABSTRACTIONS. ( protocols)
///  High-level modules should not depend on low-level modules. With this theory, high level modules like the view controller, should not depend directly on low level things, like a networking component. Instead, it should depend on abstractions or in Swift term, protocol. The point here is to reduce coupling.

//MARK: - Bad Practice Example
// The problem with the code below is that high level module DatabaseController is tightly coupled with low level module NetworkRequest
class DatabaseController {

    private let networkRequest: NetworkRequest

    init(network: NetworkRequest) {
        self.networkRequest = network
    }

    func connectDatabase() {
        networkRequest.connect()
    }
}

class NetworkRequest {
    func connect() {
            // connect to the database
        print("voliate DIP")

    }
}
//MARK: - Good Practice Example
// The way to go around is probably to use protocol to avoid tight coupling.
protocol Database {
    func connect()
}

class DatabaseControllerA {

    private let database: Database

    init(db: Database) {
        self.database = db
    }

    func connectDatabase() {
        database.connect()
    }
}

class NetworkRequestA: Database {
    func connect() {
        print("added DIP")
        // Connect to the database
    }
}
let Da = DatabaseController(network: NetworkRequest())
let DaA = DatabaseControllerA(db: NetworkRequestA())
Da.connectDatabase()
DaA.connectDatabase()
