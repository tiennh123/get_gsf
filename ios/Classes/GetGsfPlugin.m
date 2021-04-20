#import "GetGsfPlugin.h"
#if __has_include(<get_gsf/get_gsf-Swift.h>)
#import <get_gsf/get_gsf-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "get_gsf-Swift.h"
#endif

@implementation GetGsfPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGetGsfPlugin registerWithRegistrar:registrar];
}
@end
