/*
 Author: Akash Sen
 Singleton Design Pattern (Lazy Loading - Double Lock - Thread Safe)
 */

import Foundation

final class Singleton {
    private static let lock = DispatchSemaphore(value: 1)
    private static var shared: Singleton!
    
    static func getInstance() -> Singleton {
        if shared == nil {  // No need to put lock if instance is already created
            lock.wait()    // To avoid multiple threads to access critical section
            if shared == nil {
                shared = Singleton()
            }
            lock.signal()
        }
        return shared
    }
}


// MARK: Initialization
let obj = Singleton.getInstance()
