import Combine

@available(iOS 14, *)
final class SatellaViewModel: ObservableObject {
    // MARK: Lifecycle

    init() {}

    // MARK: Internal

    @Published var isShowing: Bool = false
}
