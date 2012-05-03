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
@synthesize board = _board;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setBoard: [[Board alloc] init]];
    
    // Top Bar
    CGRect topRect = CGRectMake(0, 0, 320, 70);
    UIView *topBar = [[UIView alloc] initWithFrame:topRect];
    topBar.backgroundColor = [UIColor grayColor];
    [[self view] addSubview:topBar];
    
    // Bottom Bar
    CGRect bottomRect = CGRectMake(0, 390, 320, 70);
    UIView *botBar = [[UIView alloc] initWithFrame:bottomRect];
    botBar.backgroundColor = [UIColor grayColor];
    [[self view] addSubview:botBar];
    
    // Checkerboard
    CGRect checkerRect = CGRectMake(0, 70, 320, 320);
    CheckerView *checkerView = [[CheckerView alloc] initWithFrame:checkerRect];
    [checkerView setBoard:[self board]];
    [checkerView setViewController:self];
    checkerView.backgroundColor = [UIColor colorWithRed:0.06 green:0.3 blue:0.57 alpha:1];
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

// Regretting a few design decisions...
- (BOOL) makeMoveFromX:(int)startX Y:(int)startY toNewX:(int)destX newY:(int)destY {
    boardLocation start;
    start.x = startX;
    start.y = startY;
    
    boardLocation dest;
    dest.x = destX;
    dest.y = destY;
    
    return [[self board] movePieceFrom:start to:dest by:1];
}

@end
