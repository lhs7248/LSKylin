//
//  ViewController.m
//  LSKylin
//
//  Created by lhs7248 on 2019/11/12.
//  Copyright © 2019 lhs7248. All rights reserved.
//

#import "ViewController.h"
#import "LSKylinManager.h"
#import "LSKylinManagerDefine.h"

@interface ViewController ()

@end

@implementation ViewController

LSKLN_FUNCTIONS_EXPORT(ViewController, LSKylinSTAGE_KEY_A){
    NSLog(@"%s---%d",__FUNCTION__,__LINE__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    
    NSLog(@"===============执行在LSKylinSTAGE_KEY_B 阶段=================");

    [[LSKylinManager sharedInstance] executeArrayForKey:@LSKylinSTAGE_KEY_B];
    
}


@end
