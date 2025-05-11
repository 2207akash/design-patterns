/*
    Author: Akash Sen
    Singleton Design Pattern (Lazy Loading - Not Thread Safe)
*/

import Foundation

final class Singleton {
    private static var shared: Singleton!
    private init() {}
    
    static func getInstance() -> Singleton {
        if shared == nil {
            shared = Singleton()
        }
        return shared
    }
}


// MARK: Initialization
let obj = Singleton.getInstance()
