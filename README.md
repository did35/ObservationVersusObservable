# Manage observable objects in Swift

Apple introduced a new framework called Observation, which provides an updated way to create and manage observable objects in Swift. This new framework aims to streamline state management and improve performance in SwiftUI applications. Here's how it fits into the context of observable objects:


### New `Observation` Framework in iOS 17
The `Observation` framework introduces a new way to mark objects and properties as observable, reducing boilerplate and improving code clarity. It offers a more refined approach compared to the previous `ObservableObject` and `@Published` pattern.

### Using the `@Observable` Macro in iOS 17
The `@Observable` macro is part of this new framework and simplifies the creation of observable objects. Here’s how you can use it:

```swift
import Observation

@Observable
class ContentViewModel {
    var someText = "Hello from ContentViewModel for iOS17+ with @Observable macro"
}
```

### Key Differences and Benefits
1. **Reduced Boilerplate**: Similar to the `@Observable` macro introduced in iOS 16, but now part of a more cohesive framework designed for better integration and performance.
2. **Automatic Observability**: Properties in classes marked with `@Observable` are automatically observable, reducing the need for `@Published`.
3. **Performance Improvements**: The new framework is optimized for performance, making state changes more efficient.
4. **Cleaner Code**: Less code to write and maintain, leading to cleaner and more readable codebases.

### Comparison with Previous Approaches
#### Traditional `ObservableObject` and `@Published`
```swift
class ContentViewModeliOS16: ObservableObject {
    @Published var someText = "Hello from ContentViewModel for iOS16+ conforming to the ObservableObject protocol"
}
```
- **Explicit Control**: You have to explicitly mark each property with `@Published`.
- **Familiarity**: This approach is familiar to developers who have been using SwiftUI since its inception.

#### New `@Observable` Macro in iOS 17
```swift
import Observation

@Observable
class ContentViewModel {
    var someText = "Hello from ContentViewModel for iOS17+ with @Observable macro"
}
```
- **Simplicity**: Reduces the need for boilerplate code.
- **Automatic Observability**: Properties are automatically observable, making the code cleaner and less error-prone.
- **Part of the New Observation Framework**: Offers improved performance and better integration with SwiftUI.

### Conclusion and Recommendation
For new projects targeting iOS 17 and later, using the new `Observation` framework with the `@Observable` macro is highly recommended. It provides a modern, streamlined approach to managing state in SwiftUI, with improved performance and reduced boilerplate.

For existing projects or if you need to maintain compatibility with older versions of iOS, you might continue using `ObservableObject` and `@Published`. However, as you transition to iOS 17, consider refactoring to use the new framework to take advantage of its benefits.



## @Observation Ignored

In the new Observation framework introduced with iOS 17, you can control the observability of individual properties within an `@Observable` class by using the `@ObservationIgnored` attribute. This allows you to exclude specific properties from being observed, which can be useful if you have properties that do not need to trigger view updates or if you want to reduce overhead.

### Example
Here's how you can use the `@ObservationIgnored` attribute:

```swift
import Observation

@Observable
class ContentViewModel {
    var someText = "Hello from ContentViewModel for iOS17+ with @Observable macro"
    
    @ObservationIgnored
    var nonObservableText = "This text is not observable"
}
```

### Explanation
- **`@Observable`**: This macro marks the class as observable, making all properties automatically observable by default.
- **`@ObservationIgnored`**: This attribute is applied to properties that you do not want to be observable. In this case, `nonObservableText` will not trigger any view updates when it changes.

### Detailed Breakdown
1. **Default Behavior**:
   - When a class is marked with `@Observable`, all its properties are, by default, observable.
   - Changes to these properties will automatically notify any SwiftUI views that are observing this class, leading to view updates.

2. **Using `@ObservationIgnored`**:
   - By marking a property with `@ObservationIgnored`, you explicitly exclude it from being observed.
   - Changes to this property will not trigger view updates, which can be useful for properties that are not relevant to the UI or for performance optimization.

### When to Use `@ObservationIgnored`
- **Non-UI Properties**: Use it for properties that do not impact the user interface and hence do not need to be observed.
- **Performance Optimization**: Exclude properties that change frequently but do not need to trigger UI updates, reducing unnecessary recomputations and improving performance.
- **Separation of Concerns**: Maintain a clear separation between data that affects the UI and data that does not, making your code more maintainable.

### Example Use Case
Consider a view model for a settings screen where some properties, like `lastUpdatedTimestamp`, do not need to be observable:

```swift
import Observation

@Observable
class SettingsViewModel {
    var username = "User123"
    var isDarkModeEnabled = false
    
    @ObservationIgnored
    var lastUpdatedTimestamp = Date()
}
```

In this example:
- `username` and `isDarkModeEnabled` are observable and will trigger view updates when changed.
- `lastUpdatedTimestamp` is not observable, so changes to it will not affect the UI, making the code more efficient.

### Conclusion
The `@ObservationIgnored` attribute provides a way to fine-tune the observability of properties within an `@Observable` class in iOS 17's Observation framework. This allows you to optimize performance and maintain clarity in your code by ensuring that only relevant properties are observed.
