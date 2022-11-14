import CoreFoundation

final class IPC {
    static let shared: IPC = .init()
    var observers: [String: (String) -> Void] = [:]

    func observe(
        _ name: String,
        using block: @escaping (String) -> Void
    ) {
        observers[name] = block

        let callback: CFNotificationCallback = { _, _, name, _, _ in
            guard let name = name?.rawValue as String? else {
                return
            }
            
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

    func post(_ name: String) {
        CFNotificationCenterPostNotification(
            CFNotificationCenterGetDarwinNotifyCenter(),
            CFNotificationName(name as CFString),
            nil,
            nil,
            true
        )
    }
}
