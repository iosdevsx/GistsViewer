//
//  Popup.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PopupStyle) {
    PopupStyleSuccess,
    PopupStyleError,
};

@interface Popup : UIView

+ (void)showPopupWithText:(NSString *)text
                    style:(PopupStyle)style;

@end
