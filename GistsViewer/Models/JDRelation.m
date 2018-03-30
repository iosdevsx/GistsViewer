//
//  JDRelation.m
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDRelation.h"


@interface JDRelation()

@property (nonatomic, readwrite) id objToRelate;
@property (nonatomic, readwrite) SEL selectorToRelate;

@end

@implementation JDRelation

+ (instancetype)relationWithItem:(id)item
                        selector:(SEL)selector {
    JDRelation *relation = [JDRelation new];
    relation.objToRelate = item;
    relation.selectorToRelate = selector;
    
    return relation;
}

@end
