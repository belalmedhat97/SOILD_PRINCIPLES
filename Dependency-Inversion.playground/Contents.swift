import Foundation


// The idea of Dependency Inversion Principle:
// ###########################################
///  HIGH LEVEL MODULES SHOULD NOT DEPEND UPON LOW LEVEL MODULES. BOTH SHOULD DEPEND UPON ABSTRACTIONS. ( protocols)
///  ABSTRACTIONS SHOULD NOT DEPEND UPON DETAILS. DETAILS SHOULD DEPEND UPON ABSTRACTIONS. ( protocols)
///  High-level modules should not depend on low-level modules. With this theory, high level modules like the view controller, should not depend directly on low level things, like a networking component. Instead, it should depend on abstractions or in Swift term, protocol. The point here is to reduce coupling.

//MARK: - Bad Practice Example
// The problem with the code below is that high level module ViewController is tightly coupled with low level module NetworkRequest
class ViewController {

    private let networkRequest: NetworkRequest

    init(network: NetworkRequest) {
        self.networkRequest = network
    }

    func connectNetwork() {
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
protocol NetworkProtocol {
    func connect()
}

class ViewControllerA {

    private let networkRequest: NetworkProtocol

    init(network: NetworkProtocol) {
        self.networkRequest = network
    }

    func connectNetwork() {
        networkRequest.connect()
    }
}

class NetworkRequestA: NetworkProtocol {
    func connect() {
        print("added DIP")
        // Connect to the database
    }
}
let Da = ViewController(network: NetworkRequest())
let DaA = ViewControllerA(network: NetworkRequestA())
Da.connectNetwork()
DaA.connectNetwork()
