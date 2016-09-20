//
//  Digit.m
//  LCDclock
//
//  Created by Jesse Sahli on 5/24/16.
//  Copyright © 2016 sahlitude. All rights reserved.
//

#import "Digit.h"

@implementation Digit



- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        
         UIView *digit = [[[NSBundle mainBundle]loadNibNamed:@"Digit" owner:self options:kNilOptions]objectAtIndex:0];
        digit.frame = self.bounds;
        [self setClipsToBounds:true];
        
        //add Nib to UIVIEW
        [self addSubview:digit];
    }
    return self;
}



- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
    }
    return self;
}



- (void)displayForValue: (NSInteger) value {
    
    switch (value) {
        case 0:
            [self.middle setHidden:true];
            [self.top setHidden:false];
            [self.bottomRight setHidden:false];
            [self.topRight setHidden:false];
            [self.topLeft setHidden:false];
            [self.bottom setHidden:false];
            [self.bottomLeft setHidden:false];
            break;
            
        case 1:
            [self.top setHidden:true];
            [self.topLeft setHidden:true];
            [self.bottomLeft setHidden:true];
            [self.middle setHidden:true];
            [self.bottom setHidden:true];
            [self.topRight setHidden:false];
            [self.bottomRight setHidden:false];
            break;
        
        case 2:
            [self.topLeft setHidden:true];
            [self.bottomRight setHidden:true];
            [self.bottomLeft setHidden:false];
            [self.middle setHidden:false];
            [self.bottom setHidden:false];
            [self.topRight setHidden:false];
            [self.top setHidden:false];
            break;
            
        case 3:
            [self.topLeft setHidden:true];
            [self.bottomLeft setHidden:true];
            [self.bottomRight setHidden:false];
            [self.middle setHidden:false];
            [self.bottom setHidden:false];
            [self.topRight setHidden:false];
            [self.top setHidden:false];
            break;
            
        case 4:
            [self.top setHidden:true];
            [self.bottom setHidden:true];
            [self.bottomLeft setHidden:true];
            [self.topRight setHidden:false];
            [self.topLeft setHidden:false];
            [self.bottomRight setHidden:false];
            [self.middle setHidden:false];
            break;
            
        case 5:
            [self.topRight setHidden:true];
            [self.bottomLeft setHidden:true];
            [self.topLeft setHidden:false];
            [self.bottomRight setHidden:false];
            [self.middle setHidden:false];
            [self.top setHidden:false];
            [self.bottom setHidden:false];
            break;
            
        case 6:
            [self.topRight setHidden:true];
            [self.topLeft setHidden:false];
            [self.bottomRight setHidden:false];
            [self.middle setHidden:false];
            [self.top setHidden:false];
            [self.bottom setHidden:false];
            [self.bottomLeft setHidden:false];
            break;
        
        case 7:
            [self.topLeft setHidden:true];
            [self.bottomLeft setHidden:true];
            [self.middle setHidden:true];
            [self.bottom setHidden:true];
            [self.top setHidden:false];
            [self.bottomRight setHidden:false];
            [self.topRight setHidden:false];
            break;
        
        case 8:
            [self.topLeft setHidden:false];
            [self.bottomLeft setHidden:false];
            [self.middle setHidden:false];
            [self.bottom setHidden:false];
            [self.top setHidden:false];
            [self.bottomRight setHidden:false];
            [self.topRight setHidden:false];
            break;
        
        case 9:
            [self.bottomLeft setHidden:true];
            [self.bottom setHidden:true];
            [self.top setHidden:false];
            [self.bottomRight setHidden:false];
            [self.topRight setHidden:false];
            [self.topLeft setHidden:false];
            [self.middle setHidden:false];
            
        default:
            break;
    }
}



- (void)digitColorChange: (UIColor*) color {
    [self.topLeft setBackgroundColor:color];
    [self.bottomLeft setBackgroundColor:color];
    [self.middle setBackgroundColor:color];
    [self.bottom setBackgroundColor:color];
    [self.top setBackgroundColor:color];
    [self.bottomRight setBackgroundColor:color];
    [self.topRight setBackgroundColor:color];
    
}



@end
