//
//  JDFile.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JSONModel.h"

@protocol JDFile;

@interface JDFile : JSONModel

@property (nonatomic, strong) NSString <Optional> *filename;
@property (nonatomic, strong) NSString <Optional> *type;
@property (nonatomic, strong) NSString <Optional> *language;
@property (nonatomic, strong) NSString <Optional> *raw_url;
@property (nonatomic, strong) NSString <Optional> *content;
@property (nonatomic, assign) int32_t size;

@end
