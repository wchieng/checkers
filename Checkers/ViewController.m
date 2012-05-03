//
//  ViewController.m
//  Checkers
//
//  Created by William Chieng on 5/1/12.
//

#import "ViewController.h"
#import "CheckerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Top Bar
    CGRect topRect = CGRectMake(0, 0, 320, 70);
    UIView *topBar = [[UIView alloc] initWithFrame:topRect];
    topBar.backgroundColor = [UIColor grayColor];
    //[[self view] addSubview:topBar];
    
    // Bottom Bar
    CGRect bottomRect = CGRectMake(0, 390, 320, 70);
    UIView *botBar = [[UIView alloc] initWithFrame:bottomRect];
    botBar.backgroundColor = [UIColor grayColor];
    //[[self view] addSubview:botBar];
    
    // Checkerboard
    CGRect checkerRect = CGRectMake(0, 70, 320, 320);
    UIView *checkerView = [[CheckerView alloc] initWithFrame:checkerRect];
    checkerView.backgroundColor = [UIColor colorWithRed:0.06 green:0.3 blue:0.57 alpha:1];
    //checkerView.backgroundColor = [UIColor colorWithRed:1.0 green:0.84 blue:0 alpha:1];
    [[self view] addSubview:checkerView];
    
    
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
