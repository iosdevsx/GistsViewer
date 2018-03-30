//
//  JDFileCell.m
//  GistsViewer
//
//  Created by Yury Loginov on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDFileCell.h"
#import "JDFile.h"


@interface JDFileCell()

@property (weak, nonatomic) IBOutlet UILabel *filenameLabel;
@property (weak, nonatomic) IBOutlet UILabel *filetypeLabel;

@end

@implementation JDFileCell

- (void)setupWithFile:(JDFile *)file {
    self.filenameLabel.text = file.filename;
    self.filetypeLabel.text = file.type;
}

@end
