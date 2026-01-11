/*
    Author: Akash Sen
    Singleton Design Pattern
    
    Want to read more? Find the documentation here: https://github.com/2207akash/design-patterns/blob/main/Singleton/Singleton.md
*/

import Foundation

// MARK: Singleton Class
final class Singleton {
    static let shared = Singleton()
    
    private init() {
        // Private initialization to ensure just one instance is created.
    }
    
    func someBusinessLogic() {
        // Implementation of business logic
    }
}


// Usage
let singletonInstance = Singleton.shared
singletonInstance.someBusinessLogic()