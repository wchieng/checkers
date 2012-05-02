//
//  ViewController.m
//  Checkers
//
//  Created by William Chieng on 5/1/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Top Bar
    CGRect topRect = CGRectMake(0, 0, 320, 80);
    UIView *topBar = [[UIView alloc] initWithFrame:topRect];
    topBar.backgroundColor = [UIColor blackColor];
    [[self view] addSubview:topBar];
    
    // Bottom Bar
    CGRect bottomRect = CGRectMake(0, 400, 320, 80);
    UIView *botBar = [[UIView alloc] initWithFrame:bottomRect];
    botBar.backgroundColor = [UIColor blackColor];
    [[self view] addSubview:botBar];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
