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
    
    

    
	
    UIButton *materialenButton = [[UIButton alloc] init];
    [materialenButton setFrame:CGRectMake(0, 120, 120, 120)];
    [materialenButton setBackgroundColor:[UIColor colorWithRed:0.36 green:0.23 blue:0.15 alpha:1]];
    [materialenButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [materialenButton setTitle:@"Profiel" forState:UIControlStateNormal];
    [materialenButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [materialenButton addTarget:self action:@selector(goToMaterialen)forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *homeButton = [[UIButton alloc] init];
    [homeButton setFrame:CGRectMake(0, 0, 120, 120)];
    [homeButton setBackgroundColor:[UIColor colorWithRed:0.45 green:0.31 blue:0.21 alpha:1]];
    [homeButton setTitle:@"Home" forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(goToHome)forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *toolsButton = [[UIButton alloc] init];
    [toolsButton setFrame:CGRectMake(0, 240, 120, 120)];
    [toolsButton setBackgroundColor:[UIColor colorWithRed:0.45 green:0.31 blue:0.21 alpha:1]];
    [toolsButton setTitle:@"Materialen" forState:UIControlStateNormal];
    [toolsButton addTarget:self action:@selector(goToSettings) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *emptyButton = [[UIButton alloc] init];
    [emptyButton setFrame:CGRectMake(0, 360, 120, 120)];
    [emptyButton setTitle:@"Instellingen" forState:UIControlStateNormal];
    [emptyButton setBackgroundColor:[UIColor colorWithRed:0.36 green:0.23 blue:0.15 alpha:1]];
    [emptyButton addTarget:self action:@selector(goToHome)forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *emptyButton2 = [[UIButton alloc] init];
    [emptyButton2 setFrame:CGRectMake(0, 480, 120, 400)];
    [emptyButton2 setBackgroundColor:[UIColor colorWithRed:0.45 green:0.31 blue:0.21 alpha:1]];
    [emptyButton2 addTarget:self action:@selector(goToHome)forControlEvents:UIControlEventTouchUpInside];
    

    
    screenfill = [[UIView alloc] initWithFrame:CGRectMake(260, 60, 200, 550)];
    screenfill.backgroundColor = [UIColor redColor];
    
    
      [self.view addSubview:menubg];
    [self.view addSubview:toolsButton];
    [self.view addSubview:homeButton];
    [self.view addSubview:materialenButton];
    [self.view addSubview:menu];
    [self.view addSubview:emptyButton];
    [self.view addSubview:emptyButton2];

 
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
//    SWRevealViewController *revealController = [self revealViewController];
//    UIViewController *frontViewController = revealController.frontViewController;
//    UINavigationController *frontNavigationController =nil;
//    
//    if ( [frontViewController isKindOfClass:[UINavigationController class]] )
//        frontNavigationController = (id)frontViewController;
//    
//    if ( ![frontNavigationController.topViewController isKindOfClass:[ToolsViewController class]] )
//    {
//        ToolsViewController *toolsView = [[ToolsViewController alloc] init];
//        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:toolsView];
//        [revealController pushFrontViewController:navigationController animated:YES];
//
//    }
//    
//    else
//    {
//        [revealController revealToggleAnimated:YES];
//    }
}

-(void) goToMaterialen {
//    SWRevealViewController *revealController = [self revealViewController];
//    UIViewController *frontViewController = revealController.frontViewController;
//    UINavigationController *frontNavigationController =nil;
//    
//    if ( [frontViewController isKindOfClass:[UINavigationController class]] )
//        frontNavigationController = (id)frontViewController;
//    
//
//    if ( ![frontNavigationController.topViewController isKindOfClass:[SettingsViewController2 class]] )
//    {
//        SettingsViewController2 *settingView = [[SettingsViewController2 alloc] init];
//        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:settingView];
//        [revealController pushFrontViewController:navigationController animated:YES];
//    }
//    
//    else
//    {
//        [revealController revealToggleAnimated:YES];
//    }
}



//



@end