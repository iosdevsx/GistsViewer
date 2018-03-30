//
//  FilesListResponseObject.h
//  GistsViewer
//
//  Created by Юрий Логинов on 30.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JSONModel.h"

@protocol JDFile;

@interface FilesListResponseObject : JSONModel

@property (nonatomic, strong) NSArray <JDFile> *files;

@end
