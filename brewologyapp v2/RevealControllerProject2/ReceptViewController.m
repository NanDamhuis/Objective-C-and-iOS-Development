//
//  ReceptViewController.m
//  BrewologyApp
//
//  Created by Nan Damhuis on 11-03-14.
//
//

#import "ReceptViewController.h"
#import "SWRevealViewController.h"
#import "FrontViewController.h"
#import "AppDelegate.h"
#import "tooltipButton.h"
#import "toolTipViewController.h"
#import "explanationScreen.h"
#import "ILTranslucentView.h"
#import <QuartzCore/QuartzCore.h>
#import "reflectSlider.h"
#import "HCYoutubeParser.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


@interface ReceptViewController (){
    
    UIView *view;
    
    UIToolbar *recipeProcess;
    UILabel   *step;
    UIScrollView *overView;
    UIButton *prepare;
    UIButton *overview;
    UIButton *beans;
    UIButton *bloom;
    UIButton *enjoy;
    UIView *overViewScreen;
    UIView *preparationScreen;
    UIView *grindScreen;
    UIView *waterScreen;
    UIView *finalScreen;
    
    UIButton *pauseButton;
    

    
    UISwipeGestureRecognizer *removeSwipe;
    
    tooltipButton *toolTip;
    
    UITextField *peopleField;
    
    UILabel *amountOfPeopleQ;
    UILabel *amountOfWater;
    CGRect bounds;
    int waterNumber;
    
    NSString *waterString;
    
    UIView *water;
    NSArray *lijstje;
    
    UIButton *waterfill;
    
    UIPageControl *_pageControl;
    UIScrollView *_scrollView;
    UIPickerView *choosePeople;
    
    explanationScreen *explain;
    explanationScreen *beoordeling;
    
    SWRevealViewController *revealController;

    UITextField *amountOfBeansField;
    UITextField *amountOfWaterField;
    UITextField *amountOfDegreesField;

    int stepInProces;
    int amountOfPeople;
    
    UITextField *nameOfRecipe;
    UILabel *nameOfTool;
    UITextField *timeLapse;
    UILabel *moreinfo;
    UILabel *bonenNodig;
    
        UIView *backgroundOfRecipe;
    UIScrollView *recipeScrollView;
    
    UIView *videoOfRecipe;
    UIView  *imageOfRecipe;

    UIView *videoTumbnail;

    int myNumber;
    int aftelInt;
    
    BOOL recipeStarted;
    BOOL brewingStarted;
    BOOL sliderTouched;
    
    float xPoint;
    float pickerWidth;
    float screenWidth;
    float screenHeight;
    float overzichtHeight;
    
    ILTranslucentView *peopleView;
    ILTranslucentView *preparationOverzicht;
 
    UILabel *needs;
    UIView *users;
    
    UIView *imageOfBeans;
    UILabel *scale;
    
    UIView *waterMeasure;
    UIView *scaleImage;
    UILabel *secondsLabel;
    
    reflectSlider *smaak1;
    reflectSlider *smaak2;
    reflectSlider *smaak3;
    UIButton  *toolTip1;
    UIButton  *toolTip2;
    UIButton  *toolTip3;
    UIButton  *toolTip4;
    
    UIView *imageOfToolView;
    UIView *imageOfRecipeView;
    
    NSTimer *repeatTimer;
    UIButton *timerButton;
    
    NSInteger minisecondsTest;
    NSInteger minutesTest;
    NSInteger secondsTest;
    AVAudioPlayer *player;
    AVAudioPlayer *elevator;
    AVAudioPlayer *elevator2;
    UILabel *introduction;
    UILabel *aftelSeconds;
    
    UIButton *stapTitle;
    UIButton *stapTitle2;
    
    UIButton *coffeeDone;
    UIButton *doneWithIt;
    
    UITextField *amountOfPeeps;
    UIButton *klaar;
    
    UILabel *tip;
    UIView *timer;
    
    int page;
    BOOL *musicIsPlaying;
    UIImage *image;
    UIImageView *img;
    UIPinchGestureRecognizer *twoFingerPinch;
    
    NSTimer *delayTimer;
    int mainInt2;
    
    UISwitch *teBitter;
    UISwitch *nietBitter;
    
    UISwitch *tezuur;
    UISwitch *nietzuur;
    
    UISwitch *bodySwitch;

    UILabel *doorloopTijd;
    

}

@end

@implementation ReceptViewController

@synthesize recipeStarted;
@synthesize pickerView;
@synthesize dataArray;
@synthesize vibrateCount,vibrateTimer;


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
    
    //////// Please ignore this shiznits  ////////
    
    CGRect frame = CGRectMake(0, 0,0,0);
    
    recipeProcess = [[UIToolbar alloc]initWithFrame:frame];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    

    [self.view addSubview:recipeProcess];



    //////// Allrighty go on your way!  ////////
    
    //Set stuff to zero
    
    vibrateCount = 0;
    brewingStarted = NO;
    mainInt2 = 0;
    

    //Set navigationbarstuff + backgroundstuff
    
    
    revealController = [self revealViewController];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:0.25 green:0.17 blue:0.15 alpha:1]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"beansachtergrond.jpg"]]];
	
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(20, 0, 20.0f, 18.0f)];
    UIImage *backImage = [[UIImage imageNamed:@"home.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20.0f, 0, 18.0f)];
    [backButton setBackgroundImage:backImage  forState:UIControlStateNormal];

    [backButton setTitleColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    
    UIButton *resetTheRecipe = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 20.0f, 20.0f)];

    UIImage *backImage2 = [[UIImage imageNamed:@"reset.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20.0f, 0, 20.0f)];

    [resetTheRecipe setBackgroundImage:backImage2 forState:UIControlStateNormal];
    [resetTheRecipe setTitleColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1] forState:UIControlStateNormal];
    [resetTheRecipe addTarget:self action:@selector(resetRecipe) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *resetTheRecipebarButton = [[UIBarButtonItem alloc] initWithCustomView:resetTheRecipe];
    self.navigationItem.rightBarButtonItem = resetTheRecipebarButton;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    //init the pagecontrol/scrollview
    
    int numberOfPages = 7;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320,
                                                                 570)];
    [_scrollView setContentSize:CGSizeMake(numberOfPages*_scrollView.frame.size.width, _scrollView.frame.size.height)];
    [_scrollView setPagingEnabled:YES];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    [_scrollView setDelegate:self];
    [self.view addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _scrollView.frame.size.height-40, _scrollView.frame.size.width, 40)];
    [_pageControl setBackgroundColor:[UIColor clearColor]];

    [_pageControl setNumberOfPages:numberOfPages];
    [_pageControl setCurrentPage:0];

    
    [self.view addSubview:_pageControl];
    
    [self fillPages];
    
    
}

//fill the pages from here on

-(void) fillPages {
    for (int i=0; i<7; i++) {
        CGRect frame = _scrollView.frame;
        frame.origin.x = frame.size.width * i;
        frame.origin.y = 0;
        view = [[UIView alloc] initWithFrame:frame];
        //Setup your view

        [_scrollView addSubview:view];
        
        if(i==0) //Wat gaan we doen?
        {
            
            nameOfRecipe = [[UITextField alloc] initWithFrame:CGRectMake(15, 10, 300, 50)];
            nameOfRecipe.text = @"Brewology V60";
            nameOfRecipe.textColor = [UIColor colorWithRed:0.71 green:0.47 blue:0.24 alpha:1];
            nameOfRecipe.textAlignment = NSTextAlignmentCenter;
            nameOfRecipe.font = [UIFont systemFontOfSize:28.0f];
            nameOfRecipe.textAlignment = NSTextAlignmentLeft;
            nameOfRecipe.delegate = self;
            
            nameOfTool = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 160, 50)];
            nameOfTool.text = @"V60";
            nameOfTool.textColor = [UIColor blackColor];
            nameOfTool.textAlignment = NSTextAlignmentLeft;
            nameOfTool.font = [UIFont systemFontOfSize:17.0f];
            
            timeLapse = [[UITextField alloc] initWithFrame:CGRectMake(210, 70, 80, 50)];
            timeLapse.text = @"2-3 Min";
            timeLapse.textColor = [UIColor blackColor];
            timeLapse.textAlignment = NSTextAlignmentLeft;
            timeLapse.font = [UIFont systemFontOfSize:17.0f];
            timeLapse.delegate = self;
            
            imageOfRecipeView = [[UIView alloc] initWithFrame:CGRectMake(30, 70, 50,41)];
            [imageOfRecipeView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"v60.png"]]];
            
            imageOfToolView = [[UIView alloc] initWithFrame:CGRectMake(150, 65, 50, 50)];
            [imageOfToolView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"stopwatchicon.png"]]];
            
            videoTumbnail = [[UIView alloc] initWithFrame:CGRectMake(15, 160, 280, 158)];
            [videoTumbnail setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"video_placeholder.jpg"]]];
            
//            // Gets an dictionary with each available youtube url
//            NSDictionary *videos = [HCYoutubeParser h264videosWithYoutubeURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=8To-6VIJZRE"]];
//            
//            // Presents a MoviePlayerController with the youtube quality medium
//            MPMoviePlayerViewController *mp = [[[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:[videos objectForKey:@"medium"]]]];
//            [self presentModalViewController:mp animated:YES];
//            
//            // To get a thumbnail for an image there is now a async method for that
//            [HCYoutubeParser thumbnailForYoutubeURL:@"https://www.youtube.com/watch?v=PSuZdioYErs"
//                                      thumbnailSize:YouTubeThumbnailDefaultHighQuality
//                                      completeBlock:^(UIImage *image, NSError *error) {
//                                          if (!error) {
//                                              self.thumbailImageView.image = image;
//                                          }
//                                          else {
//                                              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
//                                              [alert show];
//                                          }
//                                      }];
//            

            
            backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(0, 60, 320, 470)];
            backgroundOfRecipe.backgroundColor = [UIColor colorWithRed:1 green:0.98 blue:0.96 alpha:1];
            
        
            
            recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, 310, 450)];
            recipeScrollView.backgroundColor = [UIColor clearColor];
            recipeScrollView.contentSize = CGSizeMake(300, 450);
            [recipeScrollView setShowsVerticalScrollIndicator:YES];
            
            [view setBackgroundColor:[UIColor clearColor]];
        
            [view addSubview:backgroundOfRecipe];
            
            toolTip1 = [UIButton buttonWithType:UIButtonTypeInfoDark];
            [toolTip1 setTintColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1]];
            [toolTip1 addTarget:self action:@selector(flipTip) forControlEvents:UIControlEventTouchUpInside];
            [toolTip1 setFrame:CGRectMake(235, -5, 80, 80)];
            [backgroundOfRecipe addSubview:recipeScrollView];
            [recipeScrollView addSubview:videoTumbnail];
            [recipeScrollView addSubview:imageOfRecipeView];
            [recipeScrollView addSubview:imageOfToolView];
            [recipeScrollView addSubview:nameOfTool];
            [recipeScrollView addSubview:timeLapse];
            [recipeScrollView addSubview:nameOfRecipe];
            [recipeScrollView addSubview:toolTip1];
            
            delayTimer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(countUp) userInfo:nil repeats:YES];
            [delayTimer fire];
            
        }else if(i==1) //Zet klaar
        {
            
            
            myNumber = 1;
            
            backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 130.0f, 310,390)];
            
            backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
            
            backgroundOfRecipe.layer.cornerRadius = 5;
            backgroundOfRecipe.layer.masksToBounds = YES;
            backgroundOfRecipe.layer.borderWidth = 0.2f;
            backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
            
            recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, 310, 450)];
            recipeScrollView.backgroundColor = [UIColor clearColor];
            recipeScrollView.contentSize = CGSizeMake(300, 500);
            [recipeScrollView setShowsVerticalScrollIndicator:YES];
            
            dataArray = [[NSMutableArray alloc] init];
            
            [dataArray addObject:@"1"];
            [dataArray addObject:@"2"];
            [dataArray addObject:@"3"];
            
            screenWidth = [UIScreen mainScreen].bounds.size.width;
            screenHeight = [UIScreen mainScreen].bounds.size.height;
            overzichtHeight = screenHeight - peopleView.bounds.size.height;
            pickerWidth = screenWidth;
            
            xPoint = screenWidth / 2 - pickerWidth / 2;
            pickerView = [[UIPickerView alloc] init];
            [pickerView setDataSource: self];
            [pickerView setDelegate: self];
            [pickerView setFrame: CGRectMake(0, 620, 320, 100.0f)];
            pickerView.showsSelectionIndicator = YES;
            [pickerView selectRow:0  inComponent:0 animated:YES];
            [pickerView setBackgroundColor:[UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.9f]];
                
            pickerView.layer.borderWidth = 0.2f;
            pickerView.layer.borderColor = [UIColor darkGrayColor].CGColor;
            pickerView.layer.cornerRadius = 3;
            pickerView.layer.masksToBounds = YES;
            
            klaar = [[UIButton alloc] init];
            [klaar setFrame:CGRectMake(250, 650, 50, 50)];
            [klaar addTarget:self action:@selector(removeKeyboard) forControlEvents:UIControlEventTouchUpInside];
            [klaar setTitle:@"Klaar" forState:UIControlStateNormal];
            [klaar setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           
            users = [[UIView alloc] init];
            [users setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"kleinemale.png"]]];
            [users setFrame:CGRectMake(25.0f, 80.0f, 30.0f, 30.0f)];
            
            
            UILabel *aantalPersonen = [[UILabel alloc] initWithFrame:CGRectMake(70.0f, 70.0f, 200, 50)];
            [aantalPersonen setText:@"Hoeveelheid personen"];
            aantalPersonen.textColor = [UIColor blackColor];
            
            amountOfPeeps = [[UITextField alloc] initWithFrame:CGRectMake(260.0f, 75.0f, 40, 40)];
            amountOfPeeps.backgroundColor = [UIColor whiteColor];
            amountOfPeeps.textColor = [UIColor blackColor];
            amountOfPeeps.borderStyle = UITextBorderStyleRoundedRect;
            amountOfPeeps.textAlignment = NSTextAlignmentCenter;
            amountOfPeeps.text = @"1"  ;
           
            UIButton *coverButton = [[UIButton alloc] initWithFrame:CGRectMake(260.0f, 75.0f, 40, 40)];
            coverButton.backgroundColor = [UIColor clearColor];
            [coverButton addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
            
            waterfill = [[UIButton alloc] initWithFrame:CGRectMake(20, 165, 280, 40)];
            [waterfill setBackgroundColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1]];
            [waterfill setTitle:@"Start" forState:UIControlStateNormal];
            [waterfill addTarget:self action:@selector(slideUp) forControlEvents:UIControlEventTouchUpInside];
            
            needs = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 50)];
            [needs setText:@"Zet klaar"];
            [needs setTextAlignment:NSTextAlignmentCenter];
            
            toolTip1 = [UIButton buttonWithType:UIButtonTypeInfoDark];
            [toolTip1 addTarget:self action:@selector(flipTip) forControlEvents:UIControlEventTouchUpInside];
            [toolTip1 setTintColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1]];
            [toolTip1 setFrame:CGRectMake(235, -5, 80, 80)];
            
            nameOfTool = [[UILabel alloc] initWithFrame:CGRectMake(130, 65, 160, 50)];
            nameOfTool.text = @"Een mok";
            nameOfTool.textColor = [UIColor blackColor];
            nameOfTool.textAlignment = NSTextAlignmentLeft;
            nameOfTool.font = [UIFont systemFontOfSize:12.0f];
            
            timeLapse = [[UITextField alloc] initWithFrame:CGRectMake(130, 135, 160, 50)];
            timeLapse.text = @"Een v60 met papieren filter";
            timeLapse.textColor = [UIColor blackColor];
            timeLapse.textAlignment = NSTextAlignmentLeft;
            timeLapse.font = [UIFont systemFontOfSize:12.0f];
           
            
            bonenNodig = [[UILabel alloc] initWithFrame:CGRectMake(180, 185, 160, 100)];
            bonenNodig.text = @"gram bonen";
            bonenNodig.textColor = [UIColor blackColor];
            bonenNodig.textAlignment = NSTextAlignmentLeft;
            bonenNodig.font = [UIFont systemFontOfSize:12.0f];
            bonenNodig.numberOfLines = 0;
            
            
            amountOfBeansField = [[UITextField alloc] initWithFrame:CGRectMake(130, 215, 40, 40)];
            amountOfBeansField.text =@"8";
            amountOfBeansField.textColor = [UIColor blackColor];
            amountOfBeansField.font = [UIFont systemFontOfSize:12.0f];
            amountOfBeansField.borderStyle = UITextBorderStyleRoundedRect;
            amountOfBeansField.textAlignment = NSTextAlignmentCenter;
            amountOfBeansField.delegate = self;
            
            amountOfWaterField = [[UITextField alloc] initWithFrame:CGRectMake(130, 275, 40, 40)];
            amountOfWaterField.text = @"150";
            amountOfWaterField.textColor = [UIColor blackColor];
            amountOfWaterField.font = [UIFont systemFontOfSize:12.0f];
            amountOfWaterField.borderStyle = UITextBorderStyleRoundedRect;
            amountOfWaterField.textAlignment = NSTextAlignmentCenter;
            amountOfWaterField.delegate = self;
            
            amountOfDegreesField = [[UITextField alloc] initWithFrame:CGRectMake(240, 275, 50, 40)];
            amountOfDegreesField.text = @"85-97";
            amountOfDegreesField.textColor = [UIColor blackColor];
            amountOfDegreesField.font = [UIFont systemFontOfSize:12.0f];
            amountOfDegreesField.borderStyle = UITextBorderStyleRoundedRect;
            amountOfDegreesField.textAlignment = NSTextAlignmentCenter;
            amountOfDegreesField.delegate = self;
            
            amountOfWater = [[UILabel alloc] initWithFrame:CGRectMake(180, 270, 320, 50)];
            amountOfWater.text = @"ML water             d C";
            amountOfWater.textColor = [UIColor blackColor];
            amountOfWater.textAlignment = NSTextAlignmentLeft;
            amountOfWater.font = [UIFont systemFontOfSize:12.0f];
            
            scale = [[UILabel alloc] initWithFrame:CGRectMake(130, 345, 320, 50)];
            scale.text = @"Een weegschaal";
            scale.textColor = [UIColor blackColor];
            scale.textAlignment = NSTextAlignmentLeft;
            scale.font = [UIFont systemFontOfSize:12.0f];
            
            imageOfRecipeView = [[UIView alloc] initWithFrame:CGRectMake(32.5, 70, 45, 50)];
            [imageOfRecipeView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"glas.png"]]];
            
            imageOfToolView = [[UIView alloc] initWithFrame:CGRectMake(30, 140, 50, 41)];
            [imageOfToolView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"v60.png"]]];
            
            imageOfBeans = [[UIView alloc] initWithFrame:CGRectMake(30, 210, 50, 50)];
            [imageOfBeans setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"beansicon.png"]]];
            
            waterMeasure = [[UIView alloc] initWithFrame:CGRectMake(30, 280, 50, 50)];
            [waterMeasure setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"measure.png"]]];
            
            scaleImage = [[UIView alloc] initWithFrame:CGRectMake(30, 350, 50, 50)];
            [scaleImage setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"scale.png"]]];
            
            _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
            _tap.enabled = NO;
            [self.view addGestureRecognizer:_tap];
            
            [view addSubview:users];
            [view addSubview:amountOfPeeps];
  

            
            [view addSubview:aantalPersonen];
            [view addSubview:coverButton];
            
            [view addSubview:backgroundOfRecipe];
            [backgroundOfRecipe addSubview:recipeScrollView];
            [recipeScrollView addSubview:needs];

            
            [view bringSubviewToFront:peopleView];
            
            [recipeScrollView addSubview:imageOfBeans];
            [recipeScrollView addSubview:amountOfBeansField];
            [recipeScrollView addSubview:imageOfRecipeView];
            [recipeScrollView addSubview:imageOfToolView];
            [recipeScrollView addSubview:timeLapse];
            [recipeScrollView addSubview:bonenNodig];
            [recipeScrollView addSubview:nameOfTool];
            [recipeScrollView addSubview:waterMeasure];
            [recipeScrollView addSubview:amountOfWater];
            [recipeScrollView addSubview:amountOfWaterField];
            [recipeScrollView addSubview:amountOfDegreesField];
            
            [recipeScrollView addSubview:scale];
            [recipeScrollView addSubview:scaleImage];
        
            [view addSubview:pickerView];
            [self.view addSubview:klaar];
            
            [view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
            
            
        }else if(i==2) //Spoel het filter
        {
            
            
            backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 70, 310, 450)];
            backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
            
            backgroundOfRecipe.layer.cornerRadius = 5;
            backgroundOfRecipe.layer.masksToBounds = YES;
            backgroundOfRecipe.layer.borderWidth = 0.2f;
            backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
        
            recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, 310, 450)];
            recipeScrollView.backgroundColor = [UIColor clearColor];
            recipeScrollView.contentSize = CGSizeMake(300, 500);
            [recipeScrollView setShowsVerticalScrollIndicator:YES];
            
            
            needs = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 50)];
            [needs setTextAlignment:NSTextAlignmentCenter];
            needs.text = @"Maak het filter nat";
            needs.numberOfLines = 0;
            
            UILabel *opwarmen = [[UILabel alloc] initWithFrame:CGRectMake(10, 230, 290, 300)];
            opwarmen.textAlignment = NSTextAlignmentCenter;
            opwarmen.text = @"Zet de V60 op de mok en doe het papieren filter erin. Schenk wat kokend water over het papieren filter. Hiermee verwarm je de V60 en mok voor en haal je bovendien de papiersmaak uit het filter. ";
            opwarmen.numberOfLines = 0;
            
            UIView *rinsAfbeelding = [[UIView alloc] initWithFrame:CGRectMake(70, 80, 180, 204)];
            [rinsAfbeelding setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"rinsen.png"]]];
            
            
            
            [view addSubview:backgroundOfRecipe];
            [backgroundOfRecipe addSubview:recipeScrollView];
            [recipeScrollView addSubview:opwarmen];
            [recipeScrollView addSubview:rinsAfbeelding];
            [recipeScrollView addSubview:needs];
            [view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
        }else if(i==3) //Maal de bonen
        {
            
        
            backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 70, 310, 450)];
            backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
            
            backgroundOfRecipe.layer.cornerRadius = 5;
            backgroundOfRecipe.layer.masksToBounds = YES;
            backgroundOfRecipe.layer.borderWidth = 0.2f;
            backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
           
            recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, 310, 450)];
            recipeScrollView.backgroundColor = [UIColor clearColor];
            recipeScrollView.contentSize = CGSizeMake(300, 450);
            [recipeScrollView setShowsVerticalScrollIndicator:YES];
            
            NSString *soundPath2 = [[NSBundle mainBundle] pathForResource:@"elevator" ofType:@"mp3"];
            
            NSURL *url2 = [NSURL fileURLWithPath:soundPath2];
            elevator = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:NULL];
            [elevator setVolume:1.0];
            
           
            
            UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 50)];
            titleLable.text = @"Maal je bonen";
            [titleLable setFont:[UIFont systemFontOfSize:20.0f]];
            [titleLable setTextAlignment:NSTextAlignmentCenter];
            
            toolTip1 = [UIButton buttonWithType:UIButtonTypeInfoDark];
            [toolTip1 addTarget:self action:@selector(flipTip2) forControlEvents:UIControlEventTouchUpInside];
            [toolTip1 setTintColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1]];
            [toolTip1 setFrame:CGRectMake(235, -5, 80, 80)];

            
            UIView *sand = [[UIView alloc] initWithFrame:CGRectMake(40, 210, 280, 240)];
            [sand setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"maling3.png"]]];
            
            UILabel *maalHetZo = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 280, 150)];
            [maalHetZo setText:@"Maal je bonen ongeveer zo fijn als de maling hieronder"];
            maalHetZo.numberOfLines = 0;
            [maalHetZo setTextAlignment:NSTextAlignmentCenter];
            
            image = [UIImage imageNamed:@"maling3.png"];
            img = [[UIImageView alloc] initWithImage:image];
            img.userInteractionEnabled = YES;
            img.backgroundColor = [UIColor clearColor];
            
            img.contentMode =  UIViewContentModeCenter;
            img.frame = CGRectMake(40, 210, 280, 240);
        
            
            twoFingerPinch = [[UIPinchGestureRecognizer alloc]
                              initWithTarget:self
                              action:@selector(twoFingerPinch:)];
            [img addGestureRecognizer:twoFingerPinch];
            
            
            [view addSubview:backgroundOfRecipe];
            [backgroundOfRecipe addSubview:recipeScrollView];
            
            [recipeScrollView addSubview:titleLable];
            [recipeScrollView addSubview:toolTip1];
            [recipeScrollView addSubview:maalHetZo];
            [recipeScrollView addSubview:img];
            [view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
        }else if(i==4) //Zet klaar 2
        {
            [view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
            
            backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 70, 310, 450)];
            backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
            
            backgroundOfRecipe.layer.cornerRadius = 5;
            backgroundOfRecipe.layer.masksToBounds = YES;
            backgroundOfRecipe.layer.borderWidth = 0.2f;
            backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
            
            UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 50)];
            titleLable.text = @"Zet je apparatuur neer";
            [titleLable setFont:[UIFont systemFontOfSize:20.0f]];
            [titleLable setTextAlignment:NSTextAlignmentCenter];
            
            UILabel *maalHetZo = [[UILabel alloc] initWithFrame:CGRectMake(20, 250, 280, 150)];
            [maalHetZo setText:@"Gooi het water uit je mok en de gemalen koffie in de V60. Zet daarna je mok met V60 bovenop je weegschaal en zet die op 0.  "];
            maalHetZo.numberOfLines = 0;
            [maalHetZo setTextAlignment:NSTextAlignmentCenter];
            
            UIView *rinsAfbeelding = [[UIView alloc] initWithFrame:CGRectMake(70, 70, 180, 204)];
            [rinsAfbeelding setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"opstelling.png"]]];
            
            
            recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, 310, 450)];
            recipeScrollView.backgroundColor = [UIColor clearColor];
            recipeScrollView.contentSize = CGSizeMake(300, 500);
            [recipeScrollView setShowsVerticalScrollIndicator:YES];
            
            [view addSubview:backgroundOfRecipe];
            [backgroundOfRecipe addSubview:recipeScrollView];
            [recipeScrollView addSubview:titleLable];

            
            [recipeScrollView addSubview:maalHetZo];
            [recipeScrollView addSubview:rinsAfbeelding];
            
        }
        else if(i==5) //Water opschenken
        {
            backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 70, 310, 350)];
            backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
            
            backgroundOfRecipe.layer.cornerRadius = 5;
            backgroundOfRecipe.layer.masksToBounds = YES;
            backgroundOfRecipe.layer.borderWidth = 0.2f;
            backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
            
            recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 0, 310, 450)];
            recipeScrollView.backgroundColor = [UIColor clearColor];
            recipeScrollView.contentSize = CGSizeMake(300, 500);
            [recipeScrollView setShowsVerticalScrollIndicator:YES];
            
            timer = [[UIView alloc] initWithFrame:CGRectMake(5, 450, 310, 70)];
            timer.backgroundColor = [UIColor whiteColor];
            
            timer.layer.cornerRadius = 5;
            timer.layer.masksToBounds = YES;
            timer.layer.borderWidth = 0.2f;
            timer.layer.borderColor = [UIColor darkGrayColor].CGColor;
            
            timerButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, 50, 50)];
            [timerButton setBackgroundImage:[UIImage imageNamed:@"play-button"] forState:UIControlStateNormal];
            [timerButton addTarget:self action:@selector(StartAftellen) forControlEvents:UIControlEventTouchUpInside];
            
            pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, 50, 50)];
            [pauseButton setBackgroundImage:[UIImage imageNamed:@"pause-button"] forState:UIControlStateNormal];
            [pauseButton addTarget:self action:@selector(pauseTimer) forControlEvents:UIControlEventTouchUpInside];
            
            doneWithIt = [[UIButton alloc] initWithFrame:CGRectMake(250, 17.5, 35, 35)];
            [doneWithIt setBackgroundImage:[UIImage imageNamed:@"checker.png"] forState:UIControlStateNormal];
            [doneWithIt addTarget:self action:@selector(coffeeIsDone) forControlEvents:UIControlEventTouchUpInside];
            doneWithIt.enabled = false;
            doneWithIt.alpha = 1.0f;
            
            secondsLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 320, 50)];
            secondsLabel.textAlignment = NSTextAlignmentLeft;
            secondsLabel.text = @"00:00";
            secondsLabel.font = [UIFont fontWithName:@"DS-Digital" size:50.0f];
            
            introduction = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 280, 200)];
            introduction.text = @"Schenk zo meteen langzaam een kleine hoeveelheid water op zodat alle koffie nat is. Wacht dan ongeveer 30 seconden tot de koffie niet meer ‘borrelt’. Dit proces heet blooming. Druk op play wanneer je begint met schenken, dan gaat de timer lopen. ";
            
            introduction.textColor = [UIColor blackColor];
            introduction.textAlignment = NSTextAlignmentCenter;
            introduction.font = [UIFont systemFontOfSize:16.0f];
            introduction.numberOfLines = 0;
            
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"beep2" ofType:@"mp3"];
            
            NSURL *url = [NSURL fileURLWithPath:soundPath];
            
    
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
            [player setVolume:1.0];
            
            aftelSeconds = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 500)];
            aftelSeconds.textAlignment = NSTextAlignmentCenter;
            aftelSeconds.textColor = [UIColor blackColor];
            [aftelSeconds setFont:[UIFont systemFontOfSize:80.0f]];
            
            stapTitle = [[UIButton alloc] initWithFrame:CGRectMake(120, 410,100, 50)];
            [stapTitle setTitle:@"Pre-infusie" forState:UIControlStateNormal];
            [stapTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [stapTitle setBackgroundColor:[UIColor clearColor]];
            [stapTitle setFont:[UIFont systemFontOfSize:14.0]];
            [stapTitle addTarget:self action:@selector(opschenken) forControlEvents:UIControlEventTouchUpInside];
            
            stapTitle2 = [[UIButton alloc] initWithFrame:CGRectMake(220, 410, 100, 50)];
            [stapTitle2 setTitle:@"Opschenken" forState:UIControlStateNormal];
            [stapTitle2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [stapTitle2 setBackgroundColor:[UIColor clearColor]];
            [stapTitle2 setFont:[UIFont systemFontOfSize:14.0]];
             [stapTitle2 addTarget:self action:@selector(preInfusion) forControlEvents:UIControlEventTouchUpInside];

            stapTitle2.alpha = 0.4f;
            
            coffeeDone = [[UIButton alloc] initWithFrame:CGRectMake(5, 240, 300, 50)];
            coffeeDone.backgroundColor = [UIColor brownColor];
            [coffeeDone setTitle:@"Stop, mijn koffie is klaar" forState:UIControlStateNormal];
            [coffeeDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [coffeeDone addTarget:self action:@selector(coffeeIsDone) forControlEvents:UIControlEventTouchUpInside];
            coffeeDone.alpha = 0.0f;
            
            
            explain = [[explanationScreen alloc] init];
            explain.alpha = 0;
            UILabel *done = [[UILabel alloc] initWithFrame:CGRectMake(10, 130, 300, 200)];
            done.text = @"Gefeliciteerd! \n \n Je koffie is klaar. Laat hem even afkoelen zodat alle smaken vrijkomen en geniet ervan. In het volgende scherm kun je hem beoordelen.";
            done.textColor = [UIColor whiteColor];
            done.textAlignment = NSTextAlignmentCenter;
            done.font = [UIFont systemFontOfSize:18.0f];
            done.numberOfLines = 0;
            
            UIButton *reflectButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 330, 200, 50)];
            [reflectButton setBackgroundColor:[UIColor whiteColor]];
            [reflectButton setTitle:@"Beoordelen" forState:UIControlStateNormal];
            [reflectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [reflectButton addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:explain];
            [explain addSubview:done];
            [explain addSubview:reflectButton];

            
            [self.view addSubview:aftelSeconds];
            
            [view addSubview:backgroundOfRecipe];
            [view addSubview:timer];
            [view addSubview:stapTitle];
            [view addSubview:stapTitle2];
            [timer addSubview:timerButton];
            [timer addSubview:secondsLabel];
            [timer addSubview:doneWithIt];
            [backgroundOfRecipe addSubview:recipeScrollView];
            [recipeScrollView addSubview:introduction];
            [recipeScrollView addSubview:coffeeDone];
            
            
            [view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
        }
        
        else if(i==6) //beoordelen
        {
            backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 70, 310, 450)];
            backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
            
            backgroundOfRecipe.layer.cornerRadius = 5;
            backgroundOfRecipe.layer.masksToBounds = YES;
            backgroundOfRecipe.layer.borderWidth = 0.2f;
            backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
            
            recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, 310, 450)];
            recipeScrollView.backgroundColor = [UIColor clearColor];
            recipeScrollView.contentSize = CGSizeMake(300, 450);
            [recipeScrollView setShowsVerticalScrollIndicator:YES];
            
            nameOfRecipe = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 50)];
            nameOfRecipe.text = @"Beoordeling";
            nameOfRecipe.textColor = [UIColor blackColor];
            nameOfRecipe.textAlignment = NSTextAlignmentCenter;
            nameOfRecipe.font = [UIFont systemFontOfSize:24.0f];
            
            
            
            teBitter = [[UISwitch alloc] initWithFrame:CGRectMake(220, 120, 0, 0)];
            [teBitter setOnTintColor:[UIColor colorWithRed:0.26 green:0.14 blue:0.07 alpha:1]];
   
            nietBitter = [[UISwitch alloc] initWithFrame:CGRectMake(220, 170, 0, 0)];
            [nietBitter setOnTintColor:[UIColor colorWithRed:0.26 green:0.14 blue:0.07 alpha:1]];
            
            nietzuur = [[UISwitch alloc] initWithFrame:CGRectMake(220, 220, 0, 0)];
            [nietzuur setOnTintColor:[UIColor colorWithRed:0.26 green:0.14 blue:0.07 alpha:1]];
            
            tezuur = [[UISwitch alloc] initWithFrame:CGRectMake(220, 270, 0, 0)];
            [tezuur setOnTintColor:[UIColor colorWithRed:0.26 green:0.14 blue:0.07 alpha:1]];
            
            bodySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(220, 320, 0, 0)];
            [bodySwitch setOnTintColor:[UIColor colorWithRed:0.26 green:0.14 blue:0.07 alpha:1]];

            
            
            UILabel *aciditeit = [[UILabel alloc] initWithFrame:CGRectMake(20,110, 280, 50)];
            aciditeit.text = @"Te zuur";
            
            UILabel *Bitterheid = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 280, 50)];
            Bitterheid.text = @"Niet zuur genoeg";
            UILabel *Body = [[UILabel alloc] initWithFrame:CGRectMake(20, 210, 280, 50)];
            Body.text = @"Te Bitter";
            
            UILabel *Bitterheid2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, 280, 50)];
            Bitterheid2.text = @"Niet bitter genoeg";
            UILabel *aciditeit2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 310, 280, 50)];
            aciditeit2.text = @"Genoeg body";
            
            UIButton *opslaanButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 390, 130, 50)];
            opslaanButton.backgroundColor = [UIColor brownColor];
            [opslaanButton setTitle:@"Geef mij advies" forState:UIControlStateNormal];
            [opslaanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
          
            
            UIButton *opslaanChecker = [[UIButton alloc] initWithFrame:CGRectMake(170, 390, 130, 50)];
            opslaanChecker.backgroundColor = [UIColor brownColor];
            [opslaanChecker setTitle:@"Sla op" forState:UIControlStateNormal];
            [opslaanChecker setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [opslaanChecker addTarget:self action:@selector(showResult) forControlEvents:UIControlEventTouchUpInside];
            
            toolTip1 = [UIButton buttonWithType:UIButtonTypeInfoDark];
            [toolTip1 addTarget:self action:@selector(flipTip3) forControlEvents:UIControlEventTouchUpInside];
            [toolTip1 setTintColor:[UIColor colorWithRed:0.47 green:0.35 blue:0.28 alpha:1]];
            [toolTip1 setFrame:CGRectMake(235, -5, 80, 80)];
            
            UILabel *doorloopLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 150, 50)];
            doorloopLabel.text = @"Totale doorlooptijd:";
        
            doorloopTijd = [[UILabel alloc] initWithFrame:CGRectMake(210, 60, 100, 50)];
            doorloopTijd.text = @"00:00";
            doorloopTijd.font = [UIFont fontWithName:@"DS-Digital" size:30.0f];
            
            beoordeling = [[explanationScreen alloc] init];
            beoordeling.alpha = 0;
            UILabel *done = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 300, 200)];
            done.text = @"Hopelijk heeft je koffie gesmaakt!";
            done.textColor = [UIColor whiteColor];
            done.textAlignment = NSTextAlignmentCenter;
            done.font = [UIFont systemFontOfSize:18.0f];
            done.numberOfLines = 0;
            
            tip = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, 300, 300)];
            tip.textColor = [UIColor whiteColor];
            tip.textAlignment = NSTextAlignmentCenter;
            tip.font = [UIFont systemFontOfSize:15.0f];
            tip.numberOfLines = 0;
            
            UIButton *reflectButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 50, 30, 30)];
            [reflectButton setBackgroundImage:[UIImage imageNamed:@"remove.png"] forState:UIControlStateNormal];

            [reflectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [reflectButton addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];

            UIButton *backtoStart = [[UIButton alloc] initWithFrame:CGRectMake(260, 400, 30, 30)];
            [backtoStart setBackgroundImage:[UIImage imageNamed:@"homebig.png"] forState:UIControlStateNormal];
            [backtoStart addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
            
            [view addSubview:backgroundOfRecipe];
            [backgroundOfRecipe addSubview:recipeScrollView];
            [recipeScrollView addSubview:aciditeit];
            [recipeScrollView addSubview:aciditeit2];
            [recipeScrollView addSubview:Body];
            [recipeScrollView addSubview:Bitterheid];
            [recipeScrollView addSubview:Bitterheid2];
            [backgroundOfRecipe addSubview:opslaanButton];
            [backgroundOfRecipe addSubview:opslaanChecker];

            [recipeScrollView addSubview:nameOfRecipe];
            [recipeScrollView addSubview:toolTip1];
            [recipeScrollView addSubview:teBitter];
            [recipeScrollView addSubview:nietBitter];
            [recipeScrollView addSubview:tezuur];
            [recipeScrollView addSubview:nietzuur];
            [recipeScrollView addSubview:bodySwitch];
            [recipeScrollView addSubview:doorloopTijd];
            [recipeScrollView addSubview:doorloopLabel];
            
            [self.view addSubview:beoordeling];
            [beoordeling addSubview:done];
            [beoordeling addSubview:reflectButton];
            [beoordeling addSubview:tip];
            [beoordeling addSubview:backtoStart];
            
            [view setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]];
            
            sliderTouched = false;
        }
        
        
        
        
    }
    

}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _tap.enabled = YES;
    NSLog(@"YAY KEYBOARD");
    return YES;
}

-(void)hideKeyboard
{
    NSLog(@"HIDETHATSHIT");
    [timeLapse resignFirstResponder];
    _tap.enabled = NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)sender
{
    [sender resignFirstResponder];
    return YES;
}


- (void)changeSwitch:(id)sender{
    if([sender isOn]){
        // Execute any code when the switch is ON
        NSLog(@"Switch is ON");
    } else{
        // Execute any code when the switch is OFF
        NSLog(@"Switch is OFF");
    }
}

- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer
{
    //    NSLog(@"Pinch scale: %f", recognizer.scale);
    if (recognizer.scale >1.0f && recognizer.scale < 1.5f) {
        CGAffineTransform transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
        img.transform = transform;
    }
}

-(void) resetRecipe {
        [repeatTimer invalidate];
     [elevator2 stop];
    [self.navigationItem setTitle:@"Wat gaan we doen?"];
    [self viewDidLoad];
    
    secondsTest = 0;
    minutesTest = 0;
}


-(void) showResult {
    
    [UIView animateWithDuration:0.5 animations:^{
       
        beoordeling.alpha = 1.0f;
        tip.alpha = 1.0f;
    }];
    
    if (teBitter.on && bodySwitch.on && minutesTest >= 2) {
        tip.text = @"Vind je de smaak te overweldigend? Dit komt doordat het water er erg lang over deed om door de koffie heen te stromen. Deze lange extractietijd wordt veroorzaakt door een te fijne maling, te hoge dosering of een combinatie van beide. Maal daarom je koffie de volgende keer wat grover. Je kunt er ook voor kiezen om wat minder koffie te gebruiken of een combinatie van beide. ";
    }
    
    else if([teBitter isOn] && minutesTest >= 2) {
        tip.text = @"Maal je koffie wat grover als je hem te bitter van smaak vond. Wil je wat meer body? Doe dan je dosering iets omhoog. Één gram is vaak al genoeg. ";
    }
    
    else if([tezuur isOn] && [bodySwitch isOn] && minutesTest >= 2) {
        tip.text = @"Vind je je koffie te fris of slaat hij door naar een onprettige zure smaak? Maal dan je koffie een beetje fijner. Als je minder body wilt, kun je ook de dosering wat omlaag doen. ";
    }
    
    else if([tezuur isOn] && minutesTest >= 2) {
                tip.text = @"Als je koffie te weinig smaak heeft kun je de volgende keer wat meer koffie gebruiker. Vind je hem te zurig? Maal dan je bonen een beetje fijner. ";
    }
    
    else if(teBitter.on && minutesTest < 2) {
        tip.text = @"Voor wat meer body moet je de dosering omhoog doen. Vind je de bittere smaak te heftig? Maal dan je koffie iets grover. . ";
    }
    
    else if([tezuur isOn] && [bodySwitch isOn] && minutesTest < 2) {
        tip.text = @"Wil je de zuurgraad omlaag halen en toch de body behouden? Maal dan je koffie wat grover en doseer 1 of 2 gram hoger. Je extractietijd zou dan ongeveer hetzelfde moeten blijven.  ";
    }
    
    else if(tezuur.on && minutesTest < 2) {
        tip.text = @"Je hebt aangegeven dat je koffie weinig smaak heeft. Dit komt doordat het water te snel door de koffie heen stroomde. Dit kun je voorkomen door enerzijds de maling wat fijner te zetten en anderzijds door méér koffie te gebruiker. In dit geval, namelijk een combinatie van een korte extractietijd, hoge zuurgraad en weinig body, zouden we een combinatie van beide aanraden.  ";
    }
    
    else if([teBitter isOn] && [bodySwitch isOn] && minutesTest < 2) {
        tip.text = @"Als je de bitterheid onprettig vindt, kun je je koffie de volgende keer wat grover malen. Om dezelfde body te houden zou je de dosering iets omhoog moeten doen. Wil je wat minder body? Hou de dosering dan hetzelfde ";
    }


    
    
    UILabel *aciditeit = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 280, 50)];
    aciditeit.text = @"Aciditeit";
    
    UILabel *Bitterheid = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 280, 50)];
    Bitterheid.text = @"Bitterheid";
    UILabel *Body = [[UILabel alloc] initWithFrame:CGRectMake(20, 250, 280, 50)];
    Body.text = @"Body";

    
}



-(void) changeValue {
    if ([pickerView selectedRowInComponent:0] == 0) {
        [amountOfPeeps setText:@"1"];

    }
    
    else  if ([pickerView selectedRowInComponent:0] == 1) {
        [amountOfPeeps setText:@"2"];

    }
    
    else  if ([pickerView selectedRowInComponent:0] == 2) {
        [amountOfPeeps setText:@"3"];

    }
}

-(void) showPicker {
    
    [UIView animateWithDuration:0.5 animations:^{
            [pickerView setFrame: CGRectMake(0, 368, 320, 100.0f)];
          [klaar setFrame:CGRectMake(250, 380, 50, 50)];
    }];
    
    UITapGestureRecognizer *tapOutside = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeKeyboard)];
 
    [self.view addGestureRecognizer:tapOutside];
    

}



-(void) removeKeyboard {
    [UIView animateWithDuration:0.5 animations:^{
        [pickerView setFrame: CGRectMake(0, 620, 320, 100.0f)];
        
        [klaar setFrame:CGRectMake(250, 650, 50, 50)];
    }];

    
}

-(void) coffeeIsDone {
    
    [UIView animateWithDuration:0.5 animations:^ {
            explain.alpha = 1;
        page = 2;
         [elevator2 pause];
        musicIsPlaying = NO;
    }];

    [repeatTimer invalidate];
}

-(void) StartAftellen {
    aftelInt = 4;
    timer4 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAftellen) userInfo:nil repeats:YES];
    [timerButton removeTarget:nil
                       action:NULL
             forControlEvents:UIControlEventAllEvents];
    

    if (brewingStarted == NO ) {
        [UIView animateWithDuration:0.5 animations:^{
           introduction.alpha = 0.0f;
        }];
    }
   
}

-(void) countDownAftellen {
    
    
    
    if (brewingStarted == NO) {
        [player play];
        player.numberOfLoops = 0;
        aftelInt -= 1;
        
        
        aftelSeconds.text = [NSString stringWithFormat:@"%i", aftelInt];
    }
    
    
    if (aftelInt == 0 && [pickerView selectedRowInComponent:0] == 0) {
        
        [self startBrewing];
               [UIView animateWithDuration:0.5 animations:^{
           introduction.alpha = 1.0f;
            introduction.text = @"Schenk wanneer de timer op 00:30 staat langzaam en in een kleine cirkelbeweging water op tot 150 gr. Wacht tussendoor even als het niet allemaal tegelijk past.";
            stapTitle.alpha = 1.0f;
            stapTitle2.alpha = 0.4f;


        }];
        
         [elevator2 play];
    }
    
    else if (aftelInt == 0 && [pickerView selectedRowInComponent:0] == 1) {
         [self startBrewing];
        [UIView animateWithDuration:0.5 animations:^{
            introduction.alpha = 1.0f;
            introduction.text = @"Schenk wanneer de timer op 00:30 staat langzaam en in een kleine cirkelbeweging water op tot 300 gr. Wacht tussendoor even als het niet allemaal tegelijk past.";
            stapTitle.alpha = 1.0f;
            stapTitle2.alpha = 0.4f;
            
        }];
        
        [elevator2 play];
    }
    
    else if (aftelInt == 0 && [pickerView selectedRowInComponent:0] == 2) {
         [self startBrewing];
        [UIView animateWithDuration:0.5 animations:^{
            introduction.alpha = 1.0f;
            introduction.text = @"Schenk wanneer de timer op 00:30 staat langzaam en in een kleine cirkelbeweging water op tot 450 gr. Wacht tussendoor even als het niet allemaal tegelijk past.";
            stapTitle.alpha = 1.0f;
            stapTitle2.alpha = 0.4f;
            
        }];
        
        [elevator2 play];
    }
}

-(void) startBrewing {
    [timer4 invalidate];
    brewingStarted = YES;
    [aftelSeconds removeFromSuperview];
    [timerButton removeFromSuperview];
    [self startTimer];
    
    NSLog(@"HAI");
    musicIsPlaying = YES;
    
    NSString *brewingpath = [[NSBundle mainBundle] pathForResource:@"evelator2" ofType:@"mp3"];
    
    NSURL *brewingurl = [NSURL fileURLWithPath:brewingpath];
    
    elevator2 = [[AVAudioPlayer alloc] initWithContentsOfURL:brewingurl error:NULL];
    [elevator2 setVolume:0.6];
    [elevator2 play];

}

-(void) startTimer {
    repeatTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(showTime:) userInfo:nil repeats:YES];
           [timer addSubview:pauseButton];
     [timerButton removeFromSuperview];
     [elevator2 play];
}

-(void) pauseTimer {
    [timer addSubview:timerButton];
    [timerButton addTarget:self action:@selector(startTimer) forControlEvents:UIControlEventTouchUpInside];
    [pauseButton removeFromSuperview];
    [repeatTimer invalidate];
    [elevator2 pause];
}

-(void)showTime:(NSTimer *)repeatTimer
{
   

        secondsTest = secondsTest + 1;
    NSLog(@"tick");
        if (secondsTest == 60)
        {
            secondsTest = 0;
            minutesTest = minutesTest + 1;
        }
    
    
    if (secondsTest == 26) {
        [self bzzz];
        
    }
    
  
    
    else if (secondsTest == 29) {
                [self preInfusion];

       
       }
    secondsLabel.text = [NSString stringWithFormat:@"%02i:%02i",minutesTest,secondsTest];
    doorloopTijd.text = [NSString stringWithFormat:@"%02i:%02i", minutesTest,secondsTest];
}

-(void) countUp {
    if (mainInt2 <= 1000){
        mainInt2 = mainInt2 + 1;
            NSLog(@"%i", mainInt2);
          NSLog(@"hoi");
    }
    
}

-(void) preInfusion {
    [UIView animateWithDuration:1.0 animations:^{
        [stapTitle setFrame:CGRectMake(20, 410, 100, 50)];
        [stapTitle2 setFrame:CGRectMake(120, 410, 100, 50)];
        
        stapTitle.alpha = 0.4;
        stapTitle2.alpha = 1.0;
        
        
        introduction.text = @" Giet nu de rest van het water op. Klik op stop wanneer de straal uit de V60 verandert in gedruppel. Het kan zijn dat er nog wat water in je filter staat, gooit dit weg. Het kan bitter zijn. ";
        
    }];
    
    doneWithIt.enabled = true;

    
}

-(void) opschenken {
 
    NSLog(@"test");
  
    
    if (aftelInt == 0 && [pickerView selectedRowInComponent:0] == 0) {
        

        [UIView animateWithDuration:1.0 animations:^{
            introduction.alpha = 1.0f;
            introduction.text = @"Schenk wanneer de timer op 00:30 staat langzaam en in een kleine cirkelbeweging water op tot 150 gr. Wacht tussendoor even als het niet allemaal tegelijk past.";
            stapTitle.alpha = 1.0f;
            stapTitle2.alpha = 0.4f;
            [stapTitle setFrame:CGRectMake(120, 410, 100, 50)];
            [stapTitle2 setFrame:CGRectMake(220, 410, 100, 50)];
            
            
        }];
        

    }
    
    else if (aftelInt == 0 && [pickerView selectedRowInComponent:0] == 1) {

        [UIView animateWithDuration:0.5 animations:^{
            introduction.alpha = 1.0f;
            introduction.text = @"Schenk wanneer de timer op 00:30 staat langzaam en in een kleine cirkelbeweging water op tot 300 gr. Wacht tussendoor even als het niet allemaal tegelijk past.";
            stapTitle.alpha = 1.0f;
            stapTitle2.alpha = 0.4f;
            [stapTitle setFrame:CGRectMake(120, 410, 100, 50)];
            [stapTitle2 setFrame:CGRectMake(220, 410, 100, 50)];
            
        }];
        

    }
    
    else if (aftelInt == 0 && [pickerView selectedRowInComponent:0] == 2) {

        [UIView animateWithDuration:0.5 animations:^{
            introduction.alpha = 1.0f;
            introduction.text = @"Schenk wanneer de timer op 00:30 staat langzaam en in een kleine cirkelbeweging water op tot 450 gr. Wacht tussendoor even als het niet allemaal tegelijk past.";
            stapTitle.alpha = 1.0f;
            stapTitle2.alpha = 0.4f;
            [stapTitle setFrame:CGRectMake(120, 410, 100, 50)];
            [stapTitle2 setFrame:CGRectMake(220, 410, 100, 50)];
            
        }];
        

    }

}


-(void) bzzz {
    vibrateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(vibratePhone) userInfo:nil repeats:YES];
}

-(void)vibratePhone {
    vibrateCount = vibrateCount +1;
    
    if(vibrateCount <= 3) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        [player play];
        NSLog(@"BZZZZ");
    }
    else {

        [vibrateTimer invalidate];
        
    }
}



-(void) removeView {
    
    [UIView animateWithDuration:0.5f animations:^{
        explain.alpha = 0.0f;
        beoordeling.alpha = 0.0f;
  
   
      }];

    
    [explain performSelector:@selector(removeFromSuperview) withObject:self afterDelay:0.5f ];
   
}

-(void) popBack {
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"backhome");
    
}

-(void)flipTip {
    
    toolTipViewController *toolTipper = [[toolTipViewController alloc] init];
    toolTipper.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
     [toolTipper.navigationItem setTitle:@"Knowhow"];

    
    myNumber = 1;
    toolTipper.myNumber=myNumber;
    
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.5f];
        [self.navigationController pushViewController:toolTipper animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];

    
    NSDictionary *navBarTitleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor colorWithRed:0.19 green:0.11 blue:0.06 alpha:1],UITextAttributeTextColor,
                                           [UIFont fontWithName:@"NexaBold" size:20.0f],UITextAttributeFont, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleAttributes];


    
    
 }

-(void)flipTip2 {
    
    toolTipViewController *toolTipper = [[toolTipViewController alloc] init];
    toolTipper.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [toolTipper.navigationItem setTitle:@"Knowhow"];

    myNumber = 2;
    toolTipper.myNumber=myNumber;
    
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.5f];
    [self.navigationController pushViewController:toolTipper animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    

    NSDictionary *navBarTitleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor colorWithRed:0.19 green:0.11 blue:0.06 alpha:1],UITextAttributeTextColor,
                                           [UIFont fontWithName:@"NexaBold" size:20.0f],UITextAttributeFont, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleAttributes];
    
    
}

-(void)flipTip3 {
    
    toolTipViewController *toolTipper = [[toolTipViewController alloc] init];
    toolTipper.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [toolTipper.navigationItem setTitle:@"Knowhow"];
    
    myNumber = 3;
    toolTipper.myNumber=myNumber;
    
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.5f];
    [self.navigationController pushViewController:toolTipper animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    
    
    NSDictionary *navBarTitleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor colorWithRed:0.19 green:0.11 blue:0.06 alpha:1],UITextAttributeTextColor,
                                           [UIFont fontWithName:@"NexaBold" size:20.0f],UITextAttributeFont, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleAttributes];
    
    
}


- (IBAction)textFieldDone:(id)sender {
    [sender resignFirstResponder];
    
}
- (void) fillWithWater {
    
    if ([peopleField.text isEqualToString:@"1"]) {
        water = [[UIView alloc] initWithFrame:CGRectMake(0, 450, 320, 1000)];
        [amountOfWater setText:@"150ml"];
        NSLog(@"DERP");
    }
    
    else if ([peopleField.text isEqualToString:@"2"]){
        water = [[UIView alloc] initWithFrame:CGRectMake(0, 350, 320, 1000)];
        [amountOfWater setText:@"300ml"];
        NSLog(@"DERP2");
    }
    
    else {
        water = [[UIView alloc] initWithFrame:CGRectMake(0, 250, 320, 1000)];
        [amountOfWater setText:@"450ml"];
        NSLog(@"DERPDEREST");
    }
    
    
    [water setBackgroundColor:[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:0.2f]];
    
    [self.view addSubview:water];
    [self.view sendSubviewToBack:water];
    waterfill.alpha = 0.0f;
    

             
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = _scrollView.frame.size.width;
    page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = page;
    
    
    if (page == 0) {
        [self.navigationItem setTitle:@"Wat gaan we doen?"];
    }
    
    
    else if (page == 1) {
        [self.navigationItem setTitle:@"Zet klaar"];
    }
    
    
    else if (page == 2) {
        
        [self.navigationItem setTitle:@"Schoonspoelen"];
           [elevator pause];
    }
    
    else if (page == 3) {
        
        [self.navigationItem setTitle:@"Malen"];
             [elevator play];
    }
    
    
    
    else if (page == 4) {
        
        [self.navigationItem setTitle:@"Zet klaar"];
        [elevator pause];

    }
    
    else if (page == 5) {
        
        [self.navigationItem setTitle:@"Opschenken"];
       
        if (       musicIsPlaying == YES) {
               [elevator2 play];
        }
      
    }
    
    else if (page == 6) {
        
        [self.navigationItem setTitle:@"Beoordelen"];
      

    }
  
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [dataArray count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [dataArray objectAtIndex: row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [dataArray objectAtIndex: row]);
    
    if ([pickerView selectedRowInComponent:0] == 0) {
        [amountOfPeeps setText:@"1"];
        [amountOfBeansField setText:@"8"];
        amountOfWaterField.text = @"150";
        
    }
    
    else  if ([pickerView selectedRowInComponent:0] == 1) {
        [amountOfPeeps setText:@"2"];
        [amountOfBeansField setText:@"16 gram bonen"];
         amountOfWaterField.text = @"300";
    }
    
    else  if ([pickerView selectedRowInComponent:0] == 2) {
        [amountOfPeeps setText:@"3"];
        [amountOfBeansField setText:@"24 gram bonen"];
         amountOfWaterField.text = @"450";
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([self isMovingFromParentViewController]) {
        //specific stuff for being popped off stacked
            [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    }
}

@end
