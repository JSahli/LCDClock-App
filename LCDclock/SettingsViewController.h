//
//  SettingsViewController.h
//  LCDclock
//
//  Created by Jesse Sahli on 5/31/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PListArchiver.h"

@interface SettingsViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)doneButton:(id)sender;
- (IBAction)lightGreenButton:(id)sender;
- (IBAction)redButton:(id)sender;
- (IBAction)purpleButton:(id)sender;
- (IBAction)greenButton:(id)sender;
- (IBAction)clockSwitch:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *lightGreenOutlet;
@property (strong, nonatomic) IBOutlet UIButton *redOutlet;
@property (strong, nonatomic) IBOutlet UIButton *purpleOutlet;
@property (strong, nonatomic) IBOutlet UIButton *greenOutlet;


@property (strong, nonatomic) IBOutlet UIPickerView *timeZonePicker;
@property (strong, nonatomic) IBOutlet UISwitch *clockSwitchOutlet;
@property (strong, nonatomic) IBOutlet UILabel *clockLabel;




@end
