//
//  Popup.m
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "Popup.h"
#import "UIColor+JD.h"

static const NSTimeInterval PopupLifitime = 3.0;
static const NSTimeInterval PopupAnimationDuration = 0.2;

#define HidenFrame CGRectMake(0, -64, [[UIScreen mainScreen] bounds].size.width, 64);
#define ShownFrame CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 64);

static Popup *CurrentPopup;

@interface Popup ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (nonatomic, strong) NSTimer *removingTimer;

@end

@implementation Popup

+ (void)showPopupWithText:(NSString *)text
                    style:(PopupStyle)style
{
    
    Popup *popup = [Popup popupWithText:text style:style];
    [popup setupTapGesture];
    [popup showInView:[UIApplication sharedApplication].keyWindow];
    [popup removeAfterDelay:PopupLifitime];
}

+ (instancetype)popupWithText:(NSString *)text
                        style:(PopupStyle)style
{
    Popup *popup = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    popup.frame = HidenFrame;
    popup.textLabel.text = text;
    
    switch (style) {
        case PopupStyleSuccess:  popup.backgroundColor = [UIColor jd_green]; break;
        case PopupStyleError:    popup.backgroundColor = [UIColor jd_red]; break;
            
        default:
            break;
    }
    
    return popup;
}

- (void)setupTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popupTap)];
    [self addGestureRecognizer:tap];
}

#pragma mark - Show/hide popup

- (void)showInView:(UIView *)view {
    
    @synchronized ([self class]) {
        
        [CurrentPopup removeAnimated];
        CurrentPopup = self;
        
        self.frame = HidenFrame;
        [view addSubview:self];
        [UIView animateWithDuration:PopupAnimationDuration animations:^{
            self.frame = ShownFrame;
        }];
    }
}

- (void)removeAfterDelay:(NSTimeInterval)delay {
    self.removingTimer = [NSTimer scheduledTimerWithTimeInterval:delay target:self selector:@selector(removeAnimated) userInfo:nil repeats:NO];
}

- (void)removeAnimated {
    if ([self.removingTimer isValid]) {
        [self.removingTimer invalidate];
    }
    [UIView animateWithDuration:PopupAnimationDuration animations:^{
        self.frame = HidenFrame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - Actions

- (void)popupTap {
    [self removeAnimated];
}

@end
