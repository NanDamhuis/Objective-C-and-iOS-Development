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

*/

#import "RearViewController.h"

#import "SWRevealViewController.h"
#import "FrontViewController.h"
#import "SettingsViewController2.h"
#import "ToolsViewController.h"


@interface RearViewController(){
    
    UIView *menubg;
       UILabel *menu;

}

@end

@implementation RearViewController

@synthesize screenfill;



- (void)viewDidLoad
{
	[super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blurrybg.jpg"]]];
    
    
    menu = [[UILabel alloc] init];
    [menu setText:@"Menu"];
    [menu setFrame:CGRectMake(20, 30, 200, 30)];
    [menu setTextAlignment:NSTextAlignmentCenter];
    [menu setTextColor:[UIColor blackColor]];
    [menu setFont:[UIFont fontWithName:@"NexaBold" size:30.0f]];
    
	
    UIButton *materialenButton = [[UIButton alloc] init];
    [materialenButton setFrame:CGRectMake(20, 250, 200, 20)];
    [materialenButton setBackgroundColor:[UIColor clearColor]];
    [materialenButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [materialenButton setTitle:@"Materialen" forState:UIControlStateNormal];
    [materialenButton addTarget:self action:@selector(goToMaterialen)forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *homeButton = [[UIButton alloc] init];
    [homeButton setFrame:CGRectMake(20, 200, 200, 20)];
    [homeButton setBackgroundColor:[UIColor clearColor]];
    [homeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [homeButton setTitle:@"Recepten" forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(goToHome)forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *toolsButton = [[UIButton alloc] init];
    [toolsButton setFrame:CGRectMake(20, 300, 200, 20)];
    [toolsButton setBackgroundColor:[UIColor clearColor]];
    [toolsButton setTitle:@"Instellingen" forState:UIControlStateNormal];
    [toolsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [toolsButton addTarget:self action:@selector(goToSettings) forControlEvents:UIControlEventTouchUpInside];
    
    menubg = [[UIView alloc] init];
    [menubg setFrame:CGRectMake(0, 0, 320, 600)];
    [menubg setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.2f]];
    
    screenfill = [[UIView alloc] initWithFrame:CGRectMake(260, 60, 200, 550)];
    screenfill.backgroundColor = [UIColor redColor];
    
    
      [self.view addSubview:menubg];
    [self.view addSubview:toolsButton];
    [self.view addSubview:homeButton];
    [self.view addSubview:materialenButton];
    [self.view addSubview:menu];

 
    [self.navigationController setNavigationBarHidden:YES];
    
}

-(void) addStuff {
    [self.view addSubview:screenfill];
    

}

-(void) goToHome {
    SWRevealViewController *revealController = [self revealViewController];
    UIViewController *frontViewController = revealController.frontViewController;
    UINavigationController *frontNavigationController =nil;
    
    if ( [frontViewController isKindOfClass:[UINavigationController class]] )
        frontNavigationController = (id)frontViewController;
    
    
    if ( ![frontNavigationController.topViewController isKindOfClass:[FrontViewController class]] )
    {
        FrontViewController *frontView = [[FrontViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontView];
            frontView.receptOverView.backgroundColor = [UIColor redColor];
        [revealController pushFrontViewController:navigationController animated:YES];
        
        
    }
    
    else
    {
        [revealController revealToggleAnimated:YES];
    }
}

-(void) goToSettings {
    SWRevealViewController *revealController = [self revealViewController];
    UIViewController *frontViewController = revealController.frontViewController;
    UINavigationController *frontNavigationController =nil;
    
    if ( [frontViewController isKindOfClass:[UINavigationController class]] )
        frontNavigationController = (id)frontViewController;
    
    if ( ![frontNavigationController.topViewController isKindOfClass:[ToolsViewController class]] )
    {
        ToolsViewController *toolsView = [[ToolsViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:toolsView];
        [revealController pushFrontViewController:navigationController animated:YES];

    }
    
    else
    {
        [revealController revealToggleAnimated:YES];
    }
}

-(void) goToMaterialen {
    SWRevealViewController *revealController = [self revealViewController];
    UIViewController *frontViewController = revealController.frontViewController;
    UINavigationController *frontNavigationController =nil;
    
    if ( [frontViewController isKindOfClass:[UINavigationController class]] )
        frontNavigationController = (id)frontViewController;
    

    if ( ![frontNavigationController.topViewController isKindOfClass:[SettingsViewController2 class]] )
    {
        SettingsViewController2 *settingView = [[SettingsViewController2 alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:settingView];
        [revealController pushFrontViewController:navigationController animated:YES];
    }
    
    else
    {
        [revealController revealToggleAnimated:YES];
    }
}



//



@end