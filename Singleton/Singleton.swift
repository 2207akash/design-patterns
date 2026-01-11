// See documentation: [Singleton.md](Singleton.md)

import Foundation

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