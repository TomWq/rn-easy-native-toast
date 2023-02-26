#import "RnToast.h"
#import <UIKit/UIKit.h>

@implementation RnToast
RCT_EXPORT_MODULE()

// 定义默认的 padding 值
static NSDictionary *defaultPadding = @{@"top": @16, @"left": @24, @"bottom": @16, @"right": @24};

RCT_EXPORT_METHOD(show:(NSString *)message)
{


  dispatch_async(dispatch_get_main_queue(), ^{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    CGSize maxSize = CGSizeMake(window.frame.size.width - ([defaultPadding[@"left"] doubleValue] + [defaultPadding[@"right"] doubleValue] + 20), MAXFLOAT);
    CGSize textSize = [message boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]}
                                             context:nil].size;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width + [defaultPadding[@"left"] doubleValue] + [defaultPadding[@"right"] doubleValue], textSize.height + [defaultPadding[@"top"] doubleValue] + [defaultPadding[@"bottom"] doubleValue])];
    label.center = window.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = message;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.font = [UIFont systemFontOfSize:17.0];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    label.layer.cornerRadius = 10;
    label.clipsToBounds = YES;
    [window addSubview:label];
      [UIView animateWithDuration:2.0 animations:^{
          label.alpha = 0;
              } completion:^(BOOL finished) {
                  [UIView animateWithDuration:2.0 animations:^{
                      label.alpha = 0.0;
                  } completion:^(BOOL finished) {
                      [label removeFromSuperview];
                  }];
              }];
  });
}



// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeRnToastSpecJSI>(params);
}
#endif

@end
