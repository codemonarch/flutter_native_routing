#import "NativeRouting.h"
#import <native_routing/native_routing-Swift.h>

@implementation NativeRouting
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativeRouting registerWithRegistrar:registrar];
}
@end
