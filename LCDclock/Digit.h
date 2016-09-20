//
//  Digit.h
//  LCDclock
//
//  Created by Jesse Sahli on 5/24/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Digit : UIView

@property (strong, nonatomic) IBOutlet UIView *top;
@property (strong, nonatomic) IBOutlet UIView *topLeft;
@property (strong, nonatomic) IBOutlet UIView *topRight;
@property (strong, nonatomic) IBOutlet UIView *middle;
@property (strong, nonatomic) IBOutlet UIView *bottomRight;
@property (strong, nonatomic) IBOutlet UIView *bottomLeft;
@property (strong, nonatomic) IBOutlet UIView *bottom;
@property (strong, nonatomic) IBOutlet UIView *digitView;

- (void)displayForValue: (NSInteger) value;

- (void)digitColorChange: (UIColor*) color;



@end
