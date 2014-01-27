

//
//  MCLineLabel.m
//  MCLineLabel
//
//  Created by yinjiwang on 14-1-27.
//  Copyright (c) 2014年 yinjiwang. All rights reserved.
//

#import "MCLineLabel.h"

@interface MCLineLabel()
{
    UIControl *_actionView;
    
    Taped      retTap;
}

- (void)setup;

- (CGFloat)offsetY;
@end

@implementation MCLineLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self setUserInteractionEnabled:TRUE];
    
    _linePostion =MCLineModeDown;
    _actionView = [[UIControl alloc] initWithFrame:self.bounds];
    [_actionView setBackgroundColor:[UIColor clearColor]];
    [_actionView addTarget:self action:@selector(appendHighlightedColor:) forControlEvents:UIControlEventTouchDown];
    [_actionView addTarget:self
                    action:@selector(removeHighlightedColor)
          forControlEvents:UIControlEventTouchCancel |
     UIControlEventTouchUpInside |
     UIControlEventTouchDragOutside |
     UIControlEventTouchUpOutside];
    [self addSubview:_actionView];
    [self sendSubviewToBack:_actionView];
}

- (CGFloat)offsetY
{
    CGFloat offset =0;
    if (_linePostion ==MCLineModeTop) {
        offset=0;
    }
    else if(_linePostion ==MCLineModeMiddle)
    {
        offset =self.bounds.size.height/2;
    }
    else
    {
        offset =self.bounds.size.height;
    }
    return offset;
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super drawRect:rect];
 
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ctx, self.textColor.CGColor);  // set as the text's color

    CGContextSetLineWidth(ctx, 2.0f);

  if (_lineType == MCLineDiscontinuous)
  {
      CGFloat dashArray[] = {10,2};
      CGContextSetLineDash(ctx, 0, dashArray, 4);
  }
    CGFloat offset = [self offsetY];
    CGSize fontSize =[self.text sizeWithFont:self.font
                                    forWidth:self.frame.size.width
                               lineBreakMode:NSLineBreakByTruncatingTail];
    
    CGPoint leftPoint = CGPointMake(0,
                                    offset);
    CGPoint rightPoint = CGPointMake(fontSize.width,
                                     offset);
    CGContextMoveToPoint(ctx, leftPoint.x, leftPoint.y);
    CGContextAddLineToPoint(ctx, rightPoint.x, rightPoint.y);
    CGContextStrokePath(ctx);
}



- (void)setText:(NSString *)text andCenter:(CGPoint)center
{
    [super setText:text];
    CGSize fontSize =[self.text sizeWithFont:self.font
                                    forWidth:self.frame.size.width
                               lineBreakMode:NSLineBreakByTruncatingTail];
    NSLog(@"%f   %f", fontSize.width, fontSize.height);
    [self setNumberOfLines:0];
    [self setFrame:CGRectMake(0, 0, fontSize.width, fontSize.height)];
    [self setCenter:center];
}

#pragma mark - UIControl...

- (void)appendHighlightedColor:(id)sender
{
    retTap(sender);
}

- (void)removeHighlightedColor
{
    self.backgroundColor = [UIColor clearColor];
}

-(void)WhenTaped:(Taped)tap
{
    retTap =tap;
}

@end
