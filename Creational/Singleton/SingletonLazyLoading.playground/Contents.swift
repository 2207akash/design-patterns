/*
    Author: Akash Sen
    Singleton Design Pattern (Lazy Loading - Not Thread Safe)
*/

import Foundation

final class Singleton {
    private static var shared: Singleton?
    private init() {}
    
    static func getInstance() -> Singleton {
        guard let shared = shared else {
            let newInstance = Singleton()
            self.shared = newInstance
            return newInstance
        }
        return shared
    }
}


// MARK: Initialization
let obj = Singleton.getInstance()
