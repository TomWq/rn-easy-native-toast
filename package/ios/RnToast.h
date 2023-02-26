
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNRnToastSpec.h"

@interface RnToast : NSObject <NativeRnToastSpec>
#else
#import <React/RCTBridgeModule.h>

@interface RnToast : NSObject <RCTBridgeModule>
#endif

@end



