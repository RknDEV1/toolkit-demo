import SwiftUI

enum AnimationTiming {
    /// Fast entrance (screens, headers)
    static let entrance = Animation.easeOut(duration: 0.28)

    /// Snappy spring for feedback (toasts, cards, buttons)
    static let spring = Animation.spring(response: 0.32, dampingFraction: 0.78)

    /// Quick state change
    static let quick = Animation.easeInOut(duration: 0.18)

    /// Stagger delay between elements
    static func delay(_ index: Double) -> Animation {
        .easeOut(duration: 0.28).delay(index * 0.05)
    }
}
