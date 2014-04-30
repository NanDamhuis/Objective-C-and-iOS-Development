//
//  ReceptViewController.h
//  BrewologyApp
//
//  Created by Nan Damhuis on 11-03-14.
//
//

#import <UIKit/UIKit.h>



@interface ReceptViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {


  NSTimer *timer4;

}

@property (nonatomic) BOOL recipeStarted;
@property (nonatomic, retain) UIPickerView *pickerView;
@property (nonatomic, retain) NSMutableArray *dataArray;
@property(nonatomic,assign)int vibrateCount;
@property (nonatomic, retain)NSTimer * vibrateTimer;


@end
