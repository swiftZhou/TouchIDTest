//
//  ViewController.m
//  TouchTest
//
//  Created by 周海 on 16/7/19.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LAContext *con  = [[LAContext alloc] init];
    NSError *error;
    //判断是否支持密码验证
    /**
     *LAPolicyDeviceOwnerAuthentication 手机密码的验证方式
     *LAPolicyDeviceOwnerAuthenticationWithBiometrics 指纹的验证方式
     */
    
    BOOL can = [con canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];
    if (can) {
        [con evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"验证信息" reply:^(BOOL success, NSError * _Nullable error) {
            NSLog(@"%d,%@",success,error);
        }];
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
