import Foundation

// LBHookMessage

typealias LH = @convention(c) (
    AnyClass,
    Selector,
    UnsafeMutableRawPointer?,
    UnsafeMutableRawPointer?
) -> Int16

// MSFindSymbol

typealias MF = @convention(c) (
    OpaquePointer?,
    UnsafePointer<Int8>
) -> UnsafeMutableRawPointer?

// MSGetImageByName

typealias MG = @convention(c) (
    UnsafePointer<Int8>
) -> OpaquePointer

// MSHookFunction

typealias MH = @convention(c) (
    UnsafeMutableRawPointer,
    UnsafeMutableRawPointer,
    UnsafeMutablePointer<UnsafeMutableRawPointer?>
) -> Void

// MSHookMessageEx

typealias MX = @convention(c) (
    AnyClass,
    Selector,
    IMP,
    UnsafeMutablePointer<IMP?>
) -> Void

// substitute_hook_objc_message

typealias SH = @convention(c) (
    AnyClass,
    Selector,
    UnsafeMutableRawPointer?,
    UnsafeMutableRawPointer?,
    UnsafePointer<Bool>?
) -> Int32
