//
//  ForksListResponseObject.h
//  GistsViewer
//
//  Created by Юрий Логинов on 30.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JSONModel.h"

@interface ForksListResponseObject : JSONModel

@property (nonatomic, strong) NSArray *forks;

@end
