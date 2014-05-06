//
//  recipeButton.m
//  BrewologyApp
//
//  Created by Nan Damhuis on 27-03-14.
//
//

#import "recipeButton.h"


@implementation recipeButton {
    UIView *arrow;
    UIView *recipeImage;
    UILabel *text;
    
}

@synthesize name;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
    }
    

    arrow = [[UIView alloc] initWithFrame:CGRectMake(250, 22.5, 25, 25)];
    [arrow setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"arrow.png"]]];
    arrow.alpha = 0.5f;
    
    [self setFrame:CGRectMake(0, 71, 320, 70)];
    [self setBackgroundColor:[UIColor colorWithRed:1 green:0.98 blue:0.96 alpha:1]];
    [self setFont:[UIFont systemFontOfSize:14.0f]];
    [self setTitleColor:[UIColor colorWithRed:0.71 green:0.47 blue:0.24 alpha:1] forState:UIControlStateNormal];
    [self setTitle:text.text forState:UIControlStateNormal];
    text.text = @"HAI";

    recipeImage = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 50, 41)];
    
  
    self.layer.borderWidth = 0.8f;
    self.layer.borderColor = [UIColor colorWithRed:0.76 green:0.76 blue:0.76 alpha:1].CGColor;

    recipeImage = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 50, 41)];

    
    [self addSubview:arrow];
    [self addSubview:recipeImage];

    return self;


    
}



-(void) checkName {
    if([self.name isEqualToString:@"v60"]){
          [recipeImage setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"v60.png"]]];
    }
    
    else if([self.name isEqualToString:@"aeropress"]){
        [recipeImage setFrame:CGRectMake(18, 15, 31, 50)];
          [recipeImage setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"aeropress.png"]]];

    }
    
    else if([self.name isEqualToString:@"chemex"]){
           [recipeImage setFrame:CGRectMake(18, 15, 32, 50)];
        [recipeImage setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"chemex.png"]]];
  
    }
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
