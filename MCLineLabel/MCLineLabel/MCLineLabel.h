//
//  MCLineLabel.h
//  MCLineLabel
//
//  Created by yinjiwang on 14-1-27.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

/*
 enmu top . middle . down
 enmu type  Continuous     -----
            disContinuous  －－－－
 tap Block..
 
 */


typedef  void (^Taped) (id sender);


/* Values for MCLinePosition */
typedef NS_ENUM(NSInteger, MCLinePosition) {
   MCLineModeTop =0,
   MCLineModeMiddle=1,
   MCLineModeDown=2
} NS_ENUM_AVAILABLE_IOS(6_0);



/* Values for MCLineType */
typedef NS_ENUM(NSInteger, MCLineType) {
    MCLineContinuous  =0,
    MCLineDiscontinuous
} NS_ENUM_AVAILABLE_IOS(6_0);



#import <UIKit/UIKit.h>

@interface MCLineLabel : UILabel

@property (nonatomic, assign) MCLinePosition   linePostion;

@property (nonatomic, assign) MCLineType       lineType;

-(void)WhenTaped:(Taped)tap;

- (void)setText:(NSString *)text andCenter:(CGPoint)center;

@end
