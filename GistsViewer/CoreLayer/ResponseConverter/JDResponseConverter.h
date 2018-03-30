//
//  JDResponseConverter.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDResponseConverter <NSObject>

- (NSDictionary *)convertJSONByAddingsFilesKey:(NSArray *)json;
- (NSDictionary *)convertedJSON:(NSArray *)json byReplacingDictionaryToArrayByKey:(NSString *)key;
- (NSDictionary *)convertedJSONDictionary:(NSDictionary *)json byReplacingDictionaryToArrayByKey:(NSString *)key;

- (NSDictionary *)convertedJSONByAddingMainDataKey:(NSArray *)json;

@end
