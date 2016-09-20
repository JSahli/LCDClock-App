//
//  ViewController.m
//  LCDclock
//
//  Created by Jesse Sahli on 5/24/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)changeColor;
- (void)handleSwipeLeftRecognizer:(UISwipeGestureRecognizer*) swipeLeftRecognizer;

@end

@implementation ViewController

//For Persistence: CAN USE EITHER NSUSERDEFAULTS  <<<OR>>>  ARCHIVE TO PLIST IN USERS FILESYSTEM USING THE METHODS CUSTOM CLASS "PListArchiver"
//some code in this project uses NSUserDefaults & some uses archiving



- (void)viewDidLoad {
    [super viewDidLoad];
    self.backgroundImageArray = [[NSMutableArray alloc]initWithObjects:@"blackscreen.png", @"SaharaDesert.jpg", @"TropicalOcean.jpg",@"AlaskanNLights.png", nil];
    [self.settingsOutlet setHidden:true];
    self.view.backgroundColor = [UIColor blackColor];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer) userInfo:nil repeats:true];
    
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeLeftRecognizer:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftRecognizer];
    
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeRightRecognizer:)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRightRecognizer];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapRecognizer:)];
    [self.view addGestureRecognizer:tapRecognizer];
   
    //This is just code to check if my writing to the file system is working as expected
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pListPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Trial.plist"];
    NSString *checkRead = [NSString stringWithContentsOfFile:pListPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", checkRead);
}



-(void)viewDidAppear:(BOOL)animated {
    
    [self loadBackgroundColor];
    [self changeColor];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)settingsButton:(id)sender {
    [self performSegueWithIdentifier:@"showSettings" sender:nil];
}



#pragma mark Gesture Handling Methods

- (void)handleTapRecognizer: (UITapGestureRecognizer*) tapRecognizer {
    if ([self.settingsOutlet isHidden]) {
        [UIView animateWithDuration:0.5 animations:^{
            [self.settingsOutlet setHidden:false];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            [self.settingsOutlet setHidden:true];
        }];
    }
}



- (void)handleSwipeLeftRecognizer:(UISwipeGestureRecognizer*) swipeLeftRecognizer {
    [UIView animateWithDuration:0.5 animations:^{
        
        self.imageCounter++;
        if (self.imageCounter == self.backgroundImageArray.count) {
            self.imageCounter = 0;
        }
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.backgroundImageArray[self.imageCounter]]];
    }];
    [[NSUserDefaults standardUserDefaults]setInteger:self.imageCounter forKey:@"backgroundImage"];
    
    [PListArchiver writeToPlistDictionary:[NSNumber numberWithInteger:self.imageCounter ]forKey:@"backgroundImage"];
    NSLog(@"%@", [PListArchiver getPlistDictionaryObjectForKey:@"backgroundImage"]);
    
}



- (void)handleSwipeRightRecognizer:(UISwipeGestureRecognizer*) swipeRightRecognizer {
    [UIView animateWithDuration:0.5 animations:^{
        
        self.imageCounter--;
        if (self.imageCounter == -1) {
            self.imageCounter = 3;
        }

        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.backgroundImageArray[self.imageCounter]]];
        [[NSUserDefaults standardUserDefaults]setInteger:self.imageCounter forKey:@"backgroundImage"];
        
        [PListArchiver writeToPlistDictionary:[NSNumber numberWithInteger:self.imageCounter ]forKey:@"backgroundImage"];
        NSLog(@"%@", [PListArchiver getPlistDictionaryObjectForKey:@"backgroundImage"]);
    }];
}



#pragma mark Clock Color Methods

- (void)loadBackgroundColor{
    
    NSNumber *backgroundNumber =[PListArchiver getPlistDictionaryObjectForKey:@"backgroundImage"];
    NSInteger backgroundInteger = [backgroundNumber integerValue];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:self.backgroundImageArray[backgroundInteger]]]];
}



- (void)changeColor {
//    NSString *colorType = [[NSUserDefaults standardUserDefaults]valueForKey:@"backgroundColor"];
    NSString *colorType = [PListArchiver getPlistDictionaryObjectForKey:@"backgroundColor"];
    if([colorType isEqual: @"red"]){
        [self changeLCDColor:[UIColor colorWithRed:0.996 green:0 blue:0 alpha:1.0]];
        self.amPmLabel.textColor =[UIColor colorWithRed:0.996 green:0 blue:0 alpha:1.0];
    } else if([colorType isEqual:@"green"]){
        [self changeLCDColor:[UIColor colorWithRed:0.208 green:0.608 blue:.365 alpha:1.0]];
        self.amPmLabel.textColor = [UIColor colorWithRed:0.208 green:0.608 blue:.365 alpha:1.0];
    } else if([colorType isEqual:@"purple"]){
        [self changeLCDColor:[UIColor colorWithRed:0.263 green:0.494 blue:0.953 alpha:1.0]];
        self.amPmLabel.textColor = [UIColor colorWithRed:0.263 green:0.494 blue:0.953 alpha:1.0];
    } else if([colorType isEqual:@"yellow"]){
       [self changeLCDColor:[UIColor colorWithRed:0.027 green:0.961 blue:0.243 alpha:1.0]];
        self.amPmLabel.textColor = [UIColor colorWithRed:0.027 green:0.961 blue:0.243 alpha:1.0];
    }
    self.clockContainer.backgroundColor = [UIColor clearColor];
    self.tensHourDigit.backgroundColor = [UIColor clearColor];
    self.hourDigit.backgroundColor = [UIColor clearColor];
    self.tensMinDigit.backgroundColor = [UIColor clearColor];
    self.minDigit.backgroundColor = [UIColor clearColor];
    self.tensSecDigit.backgroundColor = [UIColor clearColor];
    self.secDigit.backgroundColor = [UIColor clearColor];
}



- (void)changeLCDColor:(UIColor*) LCDColor {
    [self.tensHourDigit digitColorChange:LCDColor];
    [self.hourDigit digitColorChange:LCDColor];
    [self.tensMinDigit digitColorChange:LCDColor];
    [self.minDigit digitColorChange:LCDColor];
    [self.tensSecDigit digitColorChange:LCDColor];
    [self.secDigit digitColorChange:LCDColor];
    [self.topColon setBackgroundColor:LCDColor];
    [self.bottomColon setBackgroundColor:LCDColor];
}


- (void)timer {
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour
                                    | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSInteger second = [components second];
    
    NSString* timeZone = [[NSUserDefaults standardUserDefaults]valueForKey:@"timeZone"];
//    NSString* timeZone = [PListArchiver getPlistDictionaryObjectForKey:@"timeZone"];
    
    if([timeZone  isEqual: @"Eastern Standard Time"]){
        hour = hour;
    } else if([timeZone isEqual:@"Central Standard Time"]){
        hour = hour - 1;
    } else if([timeZone isEqual:@"Mountain Standard Time"]){
        hour = hour - 2;
    } else if([timeZone isEqual:@"Pacific Standard Time"]){
        hour = hour - 3;
    } else if([timeZone isEqual:@"Alaska Standard Time"]){
        hour = hour - 4;
    } else if([timeZone isEqual:@"Hawaii Standart Time"]){
        hour = hour - 6;
    }
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"militaryTime"] == NO){
        [self.amPmLabel setHidden:NO];
        if(hour > 12){
            hour = hour - 12;
            self.amPmLabel.text = @"PM";
        } else {
            self.amPmLabel.text = @"AM";
        }
    } else {
        [self.amPmLabel setHidden:YES];
    }
    
    [self.secDigit displayForValue:(second % 10)];
    [self.tensSecDigit displayForValue:(second/10)];
    [self.minDigit displayForValue:(minute % 10)];
    [self.tensMinDigit displayForValue:(minute/10)];
    [self.hourDigit displayForValue:(hour % 10)];
    [self.tensHourDigit displayForValue:(hour/10)];
    
}


@end
