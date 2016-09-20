//
//  ViewController.h
//  LCDclock
//
//  Created by Jesse Sahli on 5/24/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "Digit.h"
#import "PListArchiver.h"


@import UIKit;

@interface ViewController : UIViewController<NSCoding>

@property (strong, nonatomic) IBOutlet UIView *clockContainer;
@property (strong, nonatomic) IBOutlet UIView *topColon;
@property (strong, nonatomic) IBOutlet UIView *bottomColon;
@property (strong, nonatomic) IBOutlet Digit *tensHourDigit;
@property (strong, nonatomic) IBOutlet Digit *hourDigit;
@property (strong, nonatomic) IBOutlet Digit *tensMinDigit;
@property (strong, nonatomic) IBOutlet Digit *minDigit;
@property (strong, nonatomic) IBOutlet Digit *tensSecDigit;
@property (strong, nonatomic) IBOutlet Digit *secDigit;
- (IBAction)settingsButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *settingsOutlet;
@property (strong, nonatomic) IBOutlet UILabel *amPmLabel;

@property (nonatomic) NSMutableArray *backgroundImageArray;
@property (nonatomic) NSInteger imageCounter;

@end

