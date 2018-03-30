//
//  JDRelation.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDRelation : NSObject

@property (nonatomic, readonly) id objToRelate;
@property (nonatomic, readonly) SEL selectorToRelate;

+ (instancetype)relationWithItem:(id)item
                        selector:(SEL)selector;

@end
