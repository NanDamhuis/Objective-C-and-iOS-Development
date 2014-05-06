/*

 Copyright (c) 2013 Joan Lluch <joan.lluch@sweetwilliamsl.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

 Original code:
 Copyright (c) 2011, Philip Kluz (Philip.Kluz@zuui.org)
*/

#import "FrontViewController.h"
#import "SWRevealViewController.h"
#import "RearViewController.h"
#import "ReceptViewController.h"
#import "AppDelegate.h"

#import "ILTranslucentView.h"
#import "recipeButton.h"
#import <Quartzcore/Quartzcore.h>

@interface FrontViewController() {
   
    ILTranslucentView*buttonBackGround;

    UISearchBar *searchBarru;
    SWRevealViewController *revealController;

    UIView *searchBarHolder;
    
    BOOL *blockStuff;
    UIView *screenFill;
    
    
}


@end

@implementation FrontViewController

@synthesize name;
@synthesize menuKlapped;
@synthesize receptOverView;


#pragma mark - View lifecycle


- (void)viewDidLoad
{
	[super viewDidLoad];
    
    
    [self.navigationItem setTitle:@"Brewology"];
    
    menuKlapped = false;
    
    NSDictionary *navBarTitleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIColor colorWithRed:0.26 green:0.14 blue:0.07 alpha:1],UITextAttributeTextColor,
                                           [UIFont fontWithName:@"NexaBold" size:20.0f],UITextAttributeFont, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleAttributes];
    self.revealViewController.rearViewRevealWidth = 120;
 

    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    revealController = [self revealViewController];
    
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *revealButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, 22, 22)];
    UIImage *revealImage = [[UIImage imageNamed:@"menucircles.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 22, 0, 22)];
    [revealButton setBackgroundImage:revealImage forState:UIControlStateNormal];
    [revealButton addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [revealButton addTarget:self action:@selector(blockContent) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithCustomView:revealButton];
                                
   
    
    UIButton *searchButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, 22, 22)];
    UIImage *searchImage = [[UIImage imageNamed:@"searchglass.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 22, 0, 22)];
    [searchButtonItem setBackgroundImage:searchImage forState:UIControlStateNormal];
    [searchButtonItem addTarget:revealController action:@selector(searchbarTest) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *searchButtonBarButton = [[UIBarButtonItem alloc] initWithCustomView:searchButtonItem];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    self.navigationItem.rightBarButtonItem = searchButtonBarButton;
    
  
    UIView *brewIcon = [[UIView alloc] initWithFrame:CGRectMake(140, 10, 50, 50)];
    
    [brewIcon setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"brewicon2.png"]]];
    
    //Tijdelijke buttons
    
    recipeButton *recipeButton1 = [[recipeButton alloc] init];
    [recipeButton1 setTitle:@"Brewology V60" forState:UIControlStateNormal];
    [recipeButton1 setFrame:CGRectMake(0, 70, 320, 70)];
    [recipeButton1 addTarget:self action:@selector(pushRecipe)forControlEvents:UIControlEventTouchUpInside];
    recipeButton1.name =@"v60";
    recipeButton *recipeButton2 = [[recipeButton alloc] init];
    [recipeButton2 setTitle:@"Brewology Aeropress" forState:UIControlStateNormal];
    [recipeButton2 addTarget:self action:@selector(pushRecipe)forControlEvents:UIControlEventTouchUpInside];
    [recipeButton2 setFrame:CGRectMake(0, 140, 320, 70)];
    recipeButton2.name =@"aeropress";
    recipeButton *recipeButton3 = [[recipeButton alloc] init];
    [recipeButton3 setTitle:@"Brewology Chemex" forState:UIControlStateNormal];
    [recipeButton3 addTarget:self action:@selector(pushRecipe)forControlEvents:UIControlEventTouchUpInside];
    [recipeButton3 setFrame:CGRectMake(0, 210, 320, 70)];
    recipeButton3.name =@"chemex";
    recipeButton *recipeButton4 = [[recipeButton alloc] init];
    [recipeButton4 setTitle:@"Inverted Aeropress" forState:UIControlStateNormal];
    [recipeButton4 addTarget:self action:@selector(pushRecipe)forControlEvents:UIControlEventTouchUpInside];
    [recipeButton4 setFrame:CGRectMake(0, 280, 320, 70)];
      recipeButton4.name =@"aeropress";
    recipeButton *recipeButton5 = [[recipeButton alloc] init];
    [recipeButton5 setTitle:@"Test V60" forState:UIControlStateNormal];
    [recipeButton5 addTarget:self action:@selector(pushRecipe)forControlEvents:UIControlEventTouchUpInside];
    [recipeButton5 setFrame:CGRectMake(0, 350, 320, 70)];
      recipeButton5.name =@"v60";
    recipeButton *recipeButton6 = [[recipeButton alloc] init];
    [recipeButton6 setTitle:@"Test Press" forState:UIControlStateNormal];
    [recipeButton6 addTarget:self action:@selector(pushRecipe)forControlEvents:UIControlEventTouchUpInside];
    [recipeButton6 setFrame:CGRectMake(0, 420, 320, 70)];
    recipeButton6.name =@"chemex";
    recipeButton *recipeButton7 = [[recipeButton alloc] init];
    [recipeButton7 setTitle:@"Test Chemex" forState:UIControlStateNormal];
    [recipeButton7 addTarget:self action:@selector(pushRecipe)forControlEvents:UIControlEventTouchUpInside];
    [recipeButton7 setFrame:CGRectMake(0, 490, 320, 70)];
    recipeButton7.name =@"chemex";
    recipeButton *recipeButton8 = [[recipeButton alloc] init];
    [recipeButton8 setTitle:@"Zware V60" forState:UIControlStateNormal];
    [recipeButton8 addTarget:self action:@selector(pushRecipe)forControlEvents:UIControlEventTouchUpInside];
    [recipeButton8 setFrame:CGRectMake(0, 560, 320, 70)];
    recipeButton8.name =@"v60";

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    receptOverView = [[UIScrollView alloc] init];
    [receptOverView setFrame:CGRectMake(0, -70, 320, screenHeight + 70)];
    [receptOverView setBackgroundColor:[UIColor clearColor]];
    
    receptOverView.contentSize = CGSizeMake(320, 630);
    [receptOverView setShowsVerticalScrollIndicator:NO];
    
    receptOverView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    searchBarru = [[UISearchBar alloc] init];
    [searchBarru setFrame:CGRectMake(0, 20, 320, 50)];
    searchBarru.showsCancelButton=YES;
    searchBarru.delegate =self;
    
    [self.view addSubview:receptOverView];
    [receptOverView addSubview:recipeButton2];

    [receptOverView addSubview:recipeButton3];
    [receptOverView addSubview:recipeButton4];
    [receptOverView addSubview:recipeButton5];
    [receptOverView addSubview:recipeButton6];
    [receptOverView addSubview:recipeButton7];
    [receptOverView addSubview:recipeButton1];
    [receptOverView addSubview:recipeButton8];
    
    [receptOverView addSubview:brewIcon];
    
    [recipeButton1 checkName];
    [recipeButton2 checkName];
    [recipeButton3 checkName];
    [recipeButton4 checkName];
    [recipeButton5 checkName];
    [recipeButton6 checkName];
    [recipeButton7 checkName];
    [recipeButton8 checkName];
   

    blockStuff = false;
}

-(void) blockContent {

    if (blockStuff == true) {
            NSLog(@"unblock");
        blockStuff = false;
        [screenFill removeFromSuperview];
    }
    
    else {
        NSLog(@"block");
          blockStuff = true;
        screenFill = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 600)];
        screenFill.backgroundColor = [UIColor clearColor];
        [self.view addSubview:screenFill];
        
        
    }
    
}


-(void) searchbarTest {

    
    searchBarHolder = [[UIView alloc] initWithFrame:CGRectMake(0, -70, 320, 70)];
   
    
    [self.navigationController.view addSubview:searchBarHolder];
    [searchBarHolder addSubview:searchBarru];
    

    searchBarHolder.layer.zPosition = 10000;
    
    [UIView animateWithDuration:0.3f animations:^{
        [searchBarHolder setFrame:CGRectMake(0, 0, 320, 70)];
    }];
    

 
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBarru {
    
    [searchBarru resignFirstResponder];
    NSLog(@"cancelClicked");
    [UIView animateWithDuration:0.3f animations:^{
        [searchBarHolder setFrame:CGRectMake(0, -70, 320, 70)];
        
    }];
   
    
}


-(void) removeSearchBar {
    [searchBarru resignFirstResponder];
}


- (void)pushRecipe
{
	ReceptViewController *recipe1Controller = [[ReceptViewController alloc] init];
	
	[self.navigationController pushViewController:recipe1Controller animated:YES];
    [recipe1Controller.navigationItem setTitle:@"Wat gaan we doen?"];
    
    
        [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:0.71 green:0.47 blue:0.24 alpha:1]];
    
    [self.navigationController.navigationBar removeGestureRecognizer:revealController.panGestureRecognizer];
    
}




@end