//
//  SettingsViewController2.m
//  BrewologyApp
//
//  Created by Nan Damhuis on 11-03-14.
//
//

#import "SettingsViewController2.h"
#import "SWRevealViewController.h"

@interface SettingsViewController2 (){
     UIView *backgroundOfRecipe;
    UIScrollView *recipeScrollView;
}

@end

@implementation SettingsViewController2

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
    {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
       	
        [self.navigationItem setTitle:@"Profile"];
        
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
        

        
        [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
        
        UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"]
                                                                             style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
        
        self.navigationItem.leftBarButtonItem = revealButtonItem;
        
        backgroundOfRecipe = [[UIView alloc] initWithFrame:CGRectMake(5, 70, 310, 490)];
        backgroundOfRecipe.backgroundColor = [UIColor whiteColor];
        
        backgroundOfRecipe.layer.cornerRadius = 5;
        backgroundOfRecipe.layer.masksToBounds = YES;
        backgroundOfRecipe.layer.borderWidth = 0.2f;
        backgroundOfRecipe.layer.borderColor = [UIColor darkGrayColor].CGColor;
        
        recipeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, 310, 450)];
        recipeScrollView.backgroundColor = [UIColor clearColor];
        recipeScrollView.contentSize = CGSizeMake(300, 3000);
        [recipeScrollView setShowsVerticalScrollIndicator:YES];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 245, 320, 50)];
        [label setText:@"Informatie over Materialen"];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor blackColor]];
        [label setTextAlignment:NSTextAlignmentCenter];
        
        
        UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 3000)];
        text.text = @"Wat je moet weten voor je begint:\n We gaan het hebben over filterkoffie. \nDat is de ouderwetse manier van   koffiezetten, \nmaar nu hebben we iets meer kennis dan vroeger om met deze simpele methode een bijzonder lekkere kop koffie te zetten. Met filterkoffie komen heel andere smaken van koffie tot hun recht bij het zetten van espresso, zoals fruit, citrus en specerijen. \n Gebruik ongemalen, verse koffie, dat betekent: binnen een maand na branddatum. Gebrand voor filter. Dit soort koffie is niet te vinden in de supermarkt en kan je het beste direct van een koffiebranderij kopen. \n De smaak van je extractie wordt bepaald door de verhouding koffie tot water en je maalgraad. Deze twee variabelen zorgen voor een bepaalde doorlooptijd. In deze app gebruiken we de doorlooptijd als meetmateriaal: duurde de extractie te lang of te kort en is de smaak hierdoor niet goed? Dan moet je één van de twee variabelen aanpassen. \n En dan heb je natuurlijk apparatuur nodig. Hieronder hebben we wat dingen opgeschreven die je zou kunnen overwegen op het moment dat je apparatuur gaat kopen. \n Het materiaal waar je apparaat van is gemaakt heeft grote invloed op de smaak. \n\n Porselein benadrukt vooral de body en de zoete smaken. Frisheid en levendigheid (aciditeit) raken enigszins op de achtergrond.\n\n Plastic laat de frisheid juist naar voren komen. Verse koffie is hierbij dus een absolute voorwaarde voor een lekkere filter koffie. \n\n Glas zorgt ervoor dat aciditeit, body en zoetheid goed te proeven zijn. \n\n En vervolgens kies je een zetmethode: \n \nV60 zorgt voor een stevige body en is verkrijgbaar in zowel een porseleinen als plastic en glazen uitvoering.\n\n Clever (plastic) lijkt veel op de V60, maar geeft jou controle over de extractietijd door een stop aan de onderkant. Hierdoor krijg je een zeer smaakvolle koffie.\n\n Aeropress (plastic) is een veelzijdige methode. Je kan hier alle kanten mee op. Over het algemeen geeft hij een rijke smaak met lage zuurgraad, zonder bitterheid en een volle body. Door de smalle hals en het roeren krijg je een evenredige extractie ten opzichte van brede filters, die in het midden meer extraheren dan aan de randen.\n\n Chemex (glas) is een prachtige zetmethode voor heldere lichte koffie met zoete en fruitige tonen. Door het dikke filter krijg je een hele “schone” koffie.\n\n Caffetiere (glas met metalen filter) is een veelgebruikte methode. Je krijgt er een smaakvolle koffie van. Wel zal je een residu in je kopje overhouden, doordat er gebruikt wordt gemaakt van een metalen filter in plaats van een papieren. Daarnaast geeft dit filter een metaalsmaak af.";
        
        [self.view addSubview:backgroundOfRecipe];
 
        [backgroundOfRecipe addSubview:recipeScrollView];
               [recipeScrollView addSubview:label];
        [recipeScrollView addSubview:text];
}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
