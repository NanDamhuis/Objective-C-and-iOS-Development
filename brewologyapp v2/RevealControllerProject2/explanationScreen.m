//
//  explanationScreen.m
//  BrewologyApp
//
//  Created by Nan Damhuis on 31-03-14.
//
//

#import "explanationScreen.h"
#import "ReceptViewController.h"

@implementation explanationScreen {
    UIScrollView *recipeScrollView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f]];
        [self setFrame:CGRectMake(0, 50, 320, 480)];
        

        
        
    }
    return self;
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
