import Combine
import SwiftUI

// Just used to store the visibility state of the preferences view 

@available(iOS 14, *)
final class SatellaVM: ObservableObject {
    @Published var isShowing: Bool = false
    
    init() {}
}
