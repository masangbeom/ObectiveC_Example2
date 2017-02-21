//
//  ViewController.h
//  ObjectiveC_Example2
//
//  Created by sangbeom ma on 2017. 2. 21..
//  Copyright © 2017년 favorie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) MainViewController *mainViewController;

@end

