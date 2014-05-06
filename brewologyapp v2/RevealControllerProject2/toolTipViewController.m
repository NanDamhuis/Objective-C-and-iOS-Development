//
//  toolTipViewController.m
//  BrewologyApp
//
//  Created by Nan Damhuis on 26-03-14.
//
//

#import "toolTipViewController.h"

@interface toolTipViewController (){
    
    UIView *backgroundOfRecipe;
    UIScrollView *recipeScrollView;
    

}

@end

@implementation toolTipViewController

@synthesize myNumber;

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
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:0.19 green:0.11 blue:0.06 alpha:1]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
    
    
    NSDictionary *navBarTitleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor colorWithRed:0.19 green:0.11 blue:0.06 alpha:1],UITextAttributeTextColor,
                                           [UIFont fontWithName:@"NexaBold" size:20.0f],UITextAttributeFont, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleAttributes];
    
    
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 60.0f, 30.0f)];
    UIImage *backImage = [[UIImage imageNamed:@"back_button_normal.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12.0f, 0, 12.0f)];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setBackgroundImage:backImage  forState:UIControlStateNormal];
    [backButton setTitle:@"Done" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    
    backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 70, 310, 490)];
    backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
    
    backgroundOfRecipe.layer.cornerRadius = 5;
    backgroundOfRecipe.layer.masksToBounds = YES;
    backgroundOfRecipe.layer.borderWidth = 0.2f;
    backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 0, 310, 490)];
    recipeScrollView.backgroundColor = [UIColor clearColor];
    recipeScrollView.contentSize = CGSizeMake(300, 700);
    [recipeScrollView setShowsVerticalScrollIndicator:NO];

    
    
    UILabel *titel = [[UILabel alloc] init];
   
    [titel setFrame:CGRectMake(0, -20, 320, 50)];
    [titel setTextAlignment:NSTextAlignmentCenter];
    [titel setFont:[UIFont systemFontOfSize:23.0f]];
    [titel setTextColor:[UIColor colorWithRed:0.19 green:0.11 blue:0.06 alpha:1]];
    
    UILabel *content = [[UILabel alloc] init];
       [content setFrame:CGRectMake(30, -50, 260, 550)];
    [content setTextAlignment:NSTextAlignmentLeft];
    content.numberOfLines = 0.0f;
    [content setTextColor:[UIColor colorWithRed:0.19 green:0.11 blue:0.06 alpha:1]];

    [self.view addSubview:backgroundOfRecipe];
    [backgroundOfRecipe addSubview:recipeScrollView];
    [recipeScrollView addSubview:titel];
    [recipeScrollView addSubview:content];
    
    if(myNumber == 1) {
         [titel setText:@"Over V60"];
        [content setText:@"Typerend voor de V60 is het enkele grote gat onderin, waardoor er meer extractie plaatsvindt dan bij een gewoon filter. Dit resulteert in een koffie met veel body.  "];

    }
    
    else if(myNumber == 2){
        [titel setText:@"Over koffiemaling"];
        [content setText:@"Hoe fijn of grof je je koffie maalt, bepaalt samen met de verhouding koffie tot water voor een belangrijk deel de smaak van je koffie. Hoe langer het duurt voor het water om door de koffie heen te sijpelen, hoe meer smaak het opneemt. Hier kun je dus mee spelen door je koffie grover/fijner te maken en hoger/lager te doseren. "];
        
    }
    
    
    else if(myNumber == 3){
        [titel setText:@"Wat betekent dat allemaal?"];
        [content setText:@"Body: rijkheid van je koffie \n\Zuurgraad: brengt frisheid in je koffie, het geeft leven. \n\nBalans: Is de smaak harmonieus? Mist er iets? Is een bepaalde smaak overheersend?\n\n Nasmaak: blijft de smaak in je mond hangen of is er een hardheid die naar voren komt?"];
    }
    
    else if(myNumber == 4){
        NSLog(@"nope");
    }
    
    else if(myNumber == 5){
        NSLog(@"nope");
    }
    
   
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) goBack {
    
    [UIView beginAnimations:@"animation" context:nil];
    
    [UIView setAnimationDuration:0.5f];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    
    [self.navigationController popViewControllerAnimated:NO];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
