/*
    Author: Akash Sen
    Factory Design Pattern
*/

import Foundation

// MARK: Product Interface
protocol Band {
    func play()
}

// MARK: Concrete Products
final class PopBand: Band {
    func play() {
        print("Playing Pop Music")
    }
}

final class RockBand: Band {
    func play() {
        print("Playing Rock Music")
    }
}

// MARK: Creator Interface
protocol BandFactoryProtocol {
    func createBand() -> Band
}

// MARK: Concrete Creators
final class PopBandFactory: BandFactoryProtocol {
    func createBand() -> Band {
        return PopBand()
    }
}

final class RockBandFactory: BandFactoryProtocol {
    func createBand() -> Band {
        return RockBand()
    }
}


// MARK: Initialization
class Client {
    private var bandFactory: BandFactoryProtocol
    
    init(bandFactory: BandFactoryProtocol) {
        self.bandFactory = bandFactory
    }
    
    func getBand() -> Band {
        return bandFactory.createBand()
    }
}

let client = Client(bandFactory: RockBandFactory())
client.getBand().play()
