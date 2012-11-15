//
//  ViewController.m
//  CacheExample
//
//  Created by David Beck on 11/15/12.
//  Copyright (c) 2012 ThinkUltimate. All rights reserved.
//

#import "ViewController.h"


#define TestURL @"http://tnku.co/CS4yLBN6MEnw23lJ8ryp"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadFromServer:(id)sender
{
	[self.serverIndicator startAnimating];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:TestURL]
											 cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
										 timeoutInterval:30.0];
	[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
		if (error == nil) {
			UIImage *image = [UIImage imageWithData:data];
			self.serverImage.image = image;
			
			self.serverImage.backgroundColor = [UIColor lightGrayColor];
		} else {
			self.serverImage.image = nil;
			
			self.serverImage.backgroundColor = [UIColor redColor];
		}
		
		[self.serverIndicator stopAnimating];
	}];
}

- (IBAction)loadFromCache:(id)sender
{
	[self.cacheIndicator startAnimating];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:TestURL]
											 cachePolicy:NSURLRequestReturnCacheDataDontLoad
										 timeoutInterval:30.0];
	[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
		if (error == nil) {
			UIImage *image = [UIImage imageWithData:data];
			self.cacheImage.image = image;
			
			self.cacheImage.backgroundColor = [UIColor lightGrayColor];
		} else {
			self.cacheImage.image = nil;
			
			self.cacheImage.backgroundColor = [UIColor redColor];
		}
		
		[self.cacheIndicator stopAnimating];
	}];
}

- (IBAction)clearCache:(id)sender
{
	[[NSURLCache sharedURLCache] removeAllCachedResponses];
}

- (IBAction)testCache:(id)sender
{
	NSLog(@"[[NSURLCache sharedURLCache] currentDiskUsage]: %d", [[NSURLCache sharedURLCache] currentDiskUsage]);
}

@end
