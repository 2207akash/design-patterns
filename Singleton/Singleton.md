# Swift Singleton Initialization Documentation

## Initialization Timing
In Swift, the `Singleton` object is loaded **on first use** (Lazy Initialization), not at app launch. 

Even when declared as a global variable or a static property, Swift optimizes memory by deferring the creation of the instance until the code execution actually requires it.

---

## Core Technical Details

### 1. Lazy by Default
In Swift, `static` properties are implicitly `lazy`. Even though the `lazy` keyword isn't explicitly written, the compiler ensures the `init()` is only called when `Singleton.shared` is accessed for the first time.

### 2. Thread Safety
Swift's static initialization is **thread-safe**. The language uses an internal `dispatch_once` mechanism to ensure that even if multiple threads access the Singleton simultaneously for the first time, the object is initialized exactly once.

### 3. Memory Impact
* **Pre-Launch:** Only the metadata/pointer for the object exists.
* **Post-First Use:** The object is allocated on the **Heap** and persists for the lifetime of the app.

---

## Technical Comparison ✅

A quick, user-friendly walkthrough of what happens when the app runs and the Singleton is used:

- **App launch** — The app binary is loaded, but **no** Singleton instance is created yet.
- **First access** — When you first call `Singleton.shared`, the instance is **created and initialized**; memory is allocated and any `init()` logic runs.
- **Subsequent access** — Later calls return the **same** instance immediately with **no additional allocation**.

**Quick table**

| Stage | What happens | Result |
| --- | --- | --- |
| App launch | App starts, code loaded | No instance created yet |
| First access | `Singleton.shared` accessed | Instance created & initialized |
| Subsequent access | `Singleton.shared` used again | Same instance returned (fast) |

---