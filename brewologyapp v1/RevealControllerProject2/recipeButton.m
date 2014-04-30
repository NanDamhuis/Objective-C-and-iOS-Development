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
    
    [self setFrame:CGRectMake(10, 90, 300, 70)];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setFont:[UIFont systemFontOfSize:14.0f]];
    [self setTitleColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1] forState:UIControlStateNormal];
    [self setTitle:text.text forState:UIControlStateNormal];
    text.text = @"HAI";

    recipeImage = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 50, 41)];
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0.2f;
    self.layer.borderColor = [UIColor darkGrayColor].CGColor;

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
