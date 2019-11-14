//
//  ViewController.m
//  NativeReactApp
//
//  Created by 王铎 on 2019/11/13.
//  Copyright © 2019 王铎. All rights reserved.
//

#import "ViewController.h"
#import "RNViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Native ViewController";
}

- (IBAction)gotoReactNative:(UIButton *)sender {
    [self.navigationController pushViewController:[RNViewController new] animated:YES];
}
    

@end
