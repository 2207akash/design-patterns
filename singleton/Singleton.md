# Singleton Design Pattern

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

## Technical Comparison

| Stage | Action | Memory State |
| :--- | :--- | :--- |
| **App Launch** | Binary loaded into RAM | No `Singleton` instance exists. |
| **Accessing `obj`** | `Singleton.init()` is triggered | Memory allocated; `init` logic runs. |
| **Subsequent Access** | Return existing reference | No allocation; instant return. |

---