import CoreFoundation

final class IPC {
    static let shared                         = IPC()
    var observers: [String: (String) -> Void] = [:]
    
    func addObserver(`as` name: String, using block: @escaping (String) -> Void) {
        observers[name] = block
    
        let callback: CFNotificationCallback  = { _, _, name, _, _ in
            guard let name = name?.rawValue as String? else { return }
            IPC.shared.observers[name]?(name)
        }
    
        CFNotificationCenterAddObserver(
            CFNotificationCenterGetDarwinNotifyCenter(),
            Unmanaged.passUnretained(self).toOpaque(),
            callback,
            name as CFString,
            nil,
            .deliverImmediately
        )
    }
}