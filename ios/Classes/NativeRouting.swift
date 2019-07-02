import Flutter

public func nativeRouting(block:(_ r: NativeRouting.Type) -> Void) {
    block(NativeRouting.self)
}

public class NativeRouting {

    private static let channelName = "com.rarnu.flutter/routing"

    public static func register(with registrar: FlutterPluginRegistrar) {
        FlutterMethodChannel.init(name: channelName, binaryMessenger: registrar.messenger()).setMethodCallHandler { (call, result) in
            let m = channelList[call.method]
            if (m != nil) {
                result(m!(call.arguments as! [String: Any?]))
            } else {
                // error
                result(nil)
            }
        }
    }
    
    private static var channelList = [String: (params: [String: Any?]) -> Any?]()
    public class func register(_ messenager: FlutterBinaryMessenger) {
        FlutterMethodChannel.init(name: channelName, binaryMessenger: messenager).setMethodCallHandler { (call, result) in
            let m = channelList[call.method]
            if (m != nil) {
                result(m!(call.arguments as! [String: Any?]))
            } else {
                // error
                result(nil)
            }
        }
    }
    public class func route(_ name: String, block: @escaping(_ params: [String: Any?]) -> Any?) {
        channelList[name] = block
    }
    
    public class func routeList(_ name: String, block: @escaping(_ params: [String: Any?]) -> [Any?]?) {
        channelList[name] = block
    }
    
    public class func routeMap(_ name: String, block: @escaping(_ params: [String: Any?]) -> [AnyHashable: Any?]?) {
        channelList[name] = block
    }
    public class func routeObj(_ name: String, block: @escaping(_ params: [String: Any?]) -> [String: Any?]?) {
        channelList[name] = block
    }
    public class func routeObjList(_ name: String, block:@escaping(_ params:[String: Any?]) -> [[String: Any?]]?) {
        channelList[name] = block
    }
    public class func routeObjMap(_ name: String, block:@escaping(_ params: [String: Any?]) -> [AnyHashable: [String: Any?]]?) {
        channelList[name] = block
    }
    
}
