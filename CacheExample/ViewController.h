//
//  ViewController.h
//  CacheExample
//
//  Created by David Beck on 11/15/12.
//  Copyright (c) 2012 ThinkUltimate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *serverImage;
@property (weak, nonatomic) IBOutlet UIImageView *cacheImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *serverIndicator;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *cacheIndicator;

- (IBAction)loadFromServer:(id)sender;
- (IBAction)loadFromCache:(id)sender;
- (IBAction)clearCache:(id)sender;
- (IBAction)testCache:(id)sender;

@end
