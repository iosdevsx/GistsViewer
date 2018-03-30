//
//  JDFilesDetailViewController.m
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesDetailViewController.h"
#import "JDFilesDetailViewOutput.h"
#import <WebKit/WebKit.h>


@interface JDFilesDetailViewController()

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation JDFilesDetailViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDFilesDetailViewInput

- (void)setupInitialStateWithContent:(NSString *)content {
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.webView loadHTMLString:content baseURL:nil];
}

-(WKWebView *)webView {
    if (!_webView) {
        _webView = [WKWebView new];
    }
    return _webView;
}

@end
