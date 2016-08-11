
#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (readonly, nonatomic) CGFloat maxX;   //右边界距离屏幕左边框
@property (readonly, nonatomic) CGFloat maxY;   //下边界距离屏幕上边框

@end
