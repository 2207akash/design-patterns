/*
    Author: Akash Sen
    Factory Design Pattern
*/

import Foundation

// MARK: Band Types
enum BandType {
    case pop, rock
}

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
    func createBand(type: BandType) -> Band
}

// MARK: Concrete Creator
final class ConcreteBandFactory: BandFactory {
    func createBand(type: BandType) -> Band {
        switch type {
        case .pop:
            return PopBand()
        case .rock:
            return RockBand()
        }
    }
}

// MARK: Initialization
class Client {
    private var bandFactory: BandFactory
    
    init(bandFactory: BandFactory) {
        self.bandFactory = bandFactory
    }
    
    func getBand(type: BandType) -> Band {
        return bandFactory.createBand(type: type)
    }
}

let client = Client(bandFactory: ConcreteBandFactory())
let band = client.getBand(type: .rock)
band.play()
