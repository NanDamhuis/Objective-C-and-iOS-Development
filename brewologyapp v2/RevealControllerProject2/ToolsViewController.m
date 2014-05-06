//
//  ToolsViewController.m
//  BrewologyApp
//
//  Created by Nan Damhuis on 11-03-14.
//
//

#import "ToolsViewController.h"
#import "SWRevealViewController.h"

@interface ToolsViewController (){
    UIView *backgroundOfRecipe;
}

@end

@implementation ToolsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	[self.navigationItem setTitle:@"Settings"];
    
    //    UILabel* tlabel=[[UILabel alloc] initWithFrame:CGRectMake(110,0, 100, 50)];
    //    tlabel.text=self.navigationItem.title;
    //    [tlabel setTextColor:[UIColor grayColor]];
    //    tlabel.backgroundColor =[UIColor clearColor];
    //    [tlabel setFont:[UIFont fontWithName:@"NexaBold" size:23.0f]];
    
    //    self.navigationItem.titleView=tlabel;
    
    NSDictionary *navBarTitleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor brownColor],UITextAttributeTextColor,
                                           [UIFont fontWithName:@"NexaBold" size:20.0f],UITextAttributeFont, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleAttributes];
        [self.view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 310, 2)];
    line.backgroundColor = [UIColor grayColor];
    
    SWRevealViewController *revealController = [self revealViewController];
    
    backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 70, 310, 490)];
    backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
    
    backgroundOfRecipe.layer.cornerRadius = 5;
    backgroundOfRecipe.layer.masksToBounds = YES;
    backgroundOfRecipe.layer.borderWidth = 0.2f;
    backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 245, 320, 50)];
    [label setText:@"Settings"];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor blackColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    
    
    [self.view addSubview:backgroundOfRecipe];
    [backgroundOfRecipe addSubview:label];

    
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"]
                                                                         style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonItem;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
