//
//  CheckerView.m
//  Checkers
//
//  Created by William Chieng on 5/2/12.
//

#import "CheckerView.h"

@implementation CheckerView

@synthesize board = _board;
@synthesize viewController = _viewController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (PixelCoordinates) getPixelCoordinatesFrom: (boardLocation) loc {
    PixelCoordinates pix; 
    pix.x = loc.x * 40;
    pix.y = loc.y * 40;
    return pix;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    int heightOffset = 0;
    [[UIColor colorWithRed:1.0 green:0.84 blue:0 alpha:1] set];

    for (int row=0; row<8; row++) {
        for (int column=0; column < 8; column++) {
            if (row%2 != column%2) {
                CGRect tile = CGRectMake(row*40, heightOffset+column*40, 40, 40);
                UIRectFill(tile);    
            }
        }
    }
    
    // Grab the current context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);

    int **currentBoard = [_board getBoard];
    
    // Draw checker pieces onto board
    for (int row=0; row<8; row++) {
        for (int column=0; column<8; column++) {
            // Don't draw this checker piece if it's being moved
            if (currentPieceInMotion != BoardPieceEmpty && column == touchStartX && row == touchStartY) {
                continue;
            }
            if (currentBoard[column][row] == BoardPieceEmpty) {
                continue;
            }
            if (currentBoard[column][row] == BoardPieceBlack) {
                CGContextSetRGBFillColor(context, 0, 0, 0, 1); // black
            } else if (currentBoard[column][row] == BoardPieceWhite) {
                CGContextSetRGBFillColor(context, 1, 1, 1, 1); // white
            }
            
            boardLocation loc; 
            loc.x = column;
            loc.y = row;
            PixelCoordinates pixCoord = [self getPixelCoordinatesFrom:loc];
            CGContextFillEllipseInRect(context, CGRectMake(pixCoord.x, pixCoord.y, 40, 40));
            CGContextStrokeEllipseInRect(context, CGRectMake(pixCoord.x, pixCoord.y, 40, 40));
        }
    }
    
    // Draw a circle being "dragged" with finger if actually dragging
    if (currentPieceInMotion != BoardPieceEmpty) {
        if (currentPieceInMotion == BoardPieceWhite) {
            CGContextSetRGBFillColor(context, 1, 1, 1, 1);
        } else {
            CGContextSetRGBFillColor(context, 0, 0, 0, 1);
        }
        
        CGContextFillEllipseInRect(context, CGRectMake(motionLocX, motionLocY, 40, 40));
        CGContextStrokeEllipseInRect(context, CGRectMake(motionLocX, motionLocY, 40, 40));
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches began");
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    //NSLog(@"Touch at: (%f,%f)", location.x, location.y);
    
    // Transform pixel coordinates to board coordinates
    boardLocation loc;
    loc.x = (int) floorf(location.x/40);
    loc.y = (int) floorf(location.y/40);
    NSLog(@"Touch at: (%d, %d)", loc.x, loc.y);
    
    // Encode start position
    touchStartX = loc.x;
    touchStartY = loc.y;
    
    currentPieceInMotion = [[self board] getBoardPieceAtLoc:loc];
    //NSLog(@"CurrentPieceInMotion: %d", currentPieceInMotion);
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches moved");
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    // Center the circle drawing, since every circle has a 20-pixel radius
    motionLocX = location.x-20;
    motionLocY = location.y-20;
    
    // Prevent coordinates from going negative
    if (motionLocX < 0) {
        motionLocX = 0;
    }
    if (motionLocY < 0) {
        motionLocY = 0;
    }
    
    // Redraw view
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches ended");
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    boardLocation start;
    start.x = touchStartX;
    start.y = touchStartY;
    
    boardLocation dest;
    dest.x = (int) floorf(location.x/40);
    dest.y = (int) floorf(location.y/40);
    
    [[self viewController] makeMoveFromX:touchStartX Y:touchStartY toNewX:dest.x newY:dest.y];
    
    currentPieceInMotion = BoardPieceEmpty;
    [self setNeedsDisplay];
}

@end
