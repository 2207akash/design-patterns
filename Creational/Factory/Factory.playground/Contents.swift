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
protocol BandFactory {
    func createBand() -> Band
}

// MARK: Concrete Creators
final class RockBandFactory: BandFactory {
    func createBand() -> Band {
        return RockBand()
    }
}

final class PopBandFactory: BandFactory {
    func createBand() -> Band {
        return PopBand()
    }
}

// MARK: Initialization
class Client {
    private var bandFactory: BandFactory
    
    init(bandFactory: BandFactory) {
        self.bandFactory = bandFactory
    }
    
    func getBand() -> Band {
        return bandFactory.createBand()
    }
}

let client = Client(bandFactory: PopBandFactory())
let band = client.getBand()
band.play()
