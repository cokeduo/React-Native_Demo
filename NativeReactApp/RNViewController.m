//
//  RNViewController.m
//  NativeReactApp
//
//  Created by 王铎 on 2019/11/13.
//  Copyright © 2019 王铎. All rights reserved.
//

#import "RNViewController.h"
#import <React/RCTRootView.h>

@interface RNViewController ()

@end

@implementation RNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"React-Native";

    //10.1.2.49
    NSString *jsUrl = @"http://localhost:8081/index.ios.bundle?platform=ios";
//    NSString *jsUrl = @"http://10.1.2.49:8081/index.ios.bundle?platform=ios";
    NSURL *jsCodeLocation = [NSURL URLWithString:jsUrl];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"ReactNativeRootView" initialProperties:nil launchOptions:nil];
    self.view = rootView;
    
}


@end
