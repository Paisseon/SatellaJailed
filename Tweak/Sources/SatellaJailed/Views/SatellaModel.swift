import Combine

@available(iOS 15, *)
final class SatellaModel: ObservableObject {
    @Published var isShowing: Bool = false
    static let shared: SatellaModel = .init()
    private init() {}
}
