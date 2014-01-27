//
//  PAViewController.m
//  MCLineLabel
//
//  Created by yinjiwang on 14-1-27.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "PAViewController.h"
#import "MCLineLabel.h"
@interface PAViewController ()

@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MCLineLabel *label = [[MCLineLabel alloc] initWithFrame:CGRectMake(50, 200, 300, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor blueColor]];
     [label setLinePostion:MCLineModeMiddle];
    [label setLineType:MCLineDiscontinuous];
    [label setText:@"测试你你是水是是his" andCenter:CGPointMake(200, 240)];
    
    //Taped
    [label WhenTaped:^(id sender) {
        [label setBackgroundColor:[UIColor redColor]];
    }];

    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
