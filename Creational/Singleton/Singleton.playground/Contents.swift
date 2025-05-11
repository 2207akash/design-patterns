/*
    Author: Akash Sen
    Singleton Design Pattern
*/

import Foundation

final class Singleton {
    static let shared = Singleton()
    private init() {}
}


// MARK: Initialization
let obj = Singleton.shared
