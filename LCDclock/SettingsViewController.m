//
//  SettingsViewController.m
//  LCDclock
//
//  Created by Jesse Sahli on 5/31/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property NSArray *pickerData;

@end

@implementation SettingsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeColor];
    
    //CAN USE EITHER NSUSERDEFAULTS  <<<OR>>>  ARCHIVE TO PLIST IN USERS FILE SYSTEM USING THE METHODS IN CUSTOM CLASS "PListArchiver"
    
//    if([[PListArchiver getPlistDictionaryObjectForKey:@"militaryTime"] isEqualToString:@"YES"])
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"militaryTime"] == YES){
        [self.clockSwitchOutlet setOn:YES];
        self.clockLabel.text = @"24 hour clock";
    } else {
        [self.clockSwitchOutlet setOn:NO];
        self.clockLabel.text = @"12 hour clock";
    }
    self.pickerData = @[@"Eastern Standard Time", @"Mountain Standard Time", @"Central Standard Time", @"Pacific Standard Time", @"Alaska Standard Time", @"Hawaii Standard Time"];
    self.timeZonePicker.delegate = self;
    self.timeZonePicker.dataSource = self;
    
    NSInteger defaultPickerRow = [[NSUserDefaults standardUserDefaults]integerForKey:@"defaultPickerRow"];
    [self.timeZonePicker selectRow:defaultPickerRow inComponent:0 animated:YES];
}



-(void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)doneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)changeColor {
//    NSString *colorType = [[NSUserDefaults standardUserDefaults]valueForKey:@"backgroundColor"];
    NSString *colorType = [PListArchiver getPlistDictionaryObjectForKey:@"backgroundColor"];
    if([colorType isEqual: @"red"]){
        self.view.backgroundColor = [UIColor colorWithRed:0.996 green:0 blue:0 alpha:1.0];
    } else if([colorType isEqual:@"green"]){
        self.view.backgroundColor = [UIColor colorWithRed:0.208 green:0.608 blue:.365 alpha:1.0];
    } else if([colorType isEqual:@"purple"]){
        self.view.backgroundColor = [UIColor colorWithRed:0.263 green:0.494 blue:0.953 alpha:1.0];
    } else if([colorType isEqual:@"yellow"]){
        self.view.backgroundColor = [UIColor colorWithRed:0.027 green:0.961 blue:0.243 alpha:1.0];
    } else if([colorType isEqual:@"black"]){
        self.view.backgroundColor = [UIColor blackColor];
    }
}


#pragma mark Color Button Actions

- (IBAction)lightGreenButton:(id)sender {
    self.view.backgroundColor = [UIColor colorWithRed:0.027 green:0.961 blue:0.243 alpha:1.0];
    [[NSUserDefaults standardUserDefaults]setObject:@"yellow" forKey:@"backgroundColor"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [PListArchiver writeToPlistDictionary:@"yellow"forKey:@"backgroundColor"];
}

- (IBAction)redButton:(id)sender {
    self.view.backgroundColor = [UIColor colorWithRed:0.996 green:0 blue:0 alpha:1.0];
    [[NSUserDefaults standardUserDefaults]setObject:@"red" forKey:@"backgroundColor"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [PListArchiver writeToPlistDictionary:@"red"forKey:@"backgroundColor"];
}
- (IBAction)purpleButton:(id)sender {
    self.view.backgroundColor = [UIColor colorWithRed:0.263 green:0.494 blue:0.953 alpha:1.0];
    [[NSUserDefaults standardUserDefaults]setObject:@"purple" forKey:@"backgroundColor"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [PListArchiver writeToPlistDictionary:@"purple"forKey:@"backgroundColor"];
}


- (IBAction)greenButton:(id)sender {
    self.view.backgroundColor = [UIColor colorWithRed:0.208 green:0.608 blue:.365 alpha:1.0];
    [[NSUserDefaults standardUserDefaults]setObject:@"green" forKey:@"backgroundColor"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [PListArchiver writeToPlistDictionary:@"green"forKey:@"backgroundColor"];
}


#pragma mark UISwitch method

- (IBAction)clockSwitch:(id)sender {
    if ([sender isOn]) {
        self.clockLabel.text = @"24 hour clock";
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"militaryTime"];
//        [PListArchiver writeToPlistDictionary:@"YES" forKey:@"militaryTime"];
        
    } else {
        self.clockLabel.text = @"12 hour clock";
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"militaryTime"];
//        [PListArchiver writeToPlistDictionary:@"NO" forKey:@"militaryTime"];
    }
}


#pragma mark PickerView methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerData.count;
}



- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerData[row];
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    [[NSUserDefaults standardUserDefaults]setObject:self.pickerData[row] forKey:@"timeZone"];
    [[NSUserDefaults standardUserDefaults]setInteger:row forKey:@"defaultPickerRow"];
    
    [PListArchiver writeToPlistDictionary:self.pickerData[row]forKey:@"timeZone"];
    [PListArchiver writeToPlistDictionary:[NSNumber numberWithInteger:row] forKey:@"timeZone"];
}



@end
