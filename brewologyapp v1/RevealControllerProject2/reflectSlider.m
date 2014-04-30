//
//  reflectSlider.m
//  BrewologyApp
//
//  Created by Nan Damhuis on 26-03-14.
//
//

#import "reflectSlider.h"

@implementation reflectSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
    }
    
    [self setThumbImage:[UIImage imageNamed:@"boontje.png"] forState:UIControlStateNormal];
    [self setMinimumTrackTintColor:[UIColor redColor]];
    [self setMaximumTrackImage:[UIImage imageNamed:@"bar1.png"] forState:UIControlStateNormal];

    self.minimumValue = 1.0;
    self.maximumValue = 10.0;
    self.continuous = YES;
    self.value = 5.0;
    return self;
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
    
    
    return CGRectInset ([super thumbRectForBounds:bounds trackRect:rect value:value], 10, 10);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
