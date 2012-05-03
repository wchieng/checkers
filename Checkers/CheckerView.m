//
//  CheckerView.m
//  Checkers
//
//  Created by William Chieng on 5/2/12.
//  Copyright (c) 2012 University of California, Berkeley. All rights reserved.
//

#import "CheckerView.h"

@implementation CheckerView

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
    
    for (int row=0; row<8; row++) {
        for (int column=0; column<8; column++) {
            if (currentBoard[row][column] == BoardPieceBlack) {
                CGContextSetRGBFillColor(context, 0, 0, 0, 1); // black
                boardLocation loc; 
                loc.x = row;
                loc.y = column;
                PixelCoordinates pixCoord = [self getPixelCoordinatesFrom:loc];
                CGContextFillEllipseInRect(context, CGRectMake(pixCoord.x, pixCoord.y, 40, 40));
            } else if (currentBoard[row][column] == BoardPieceWhite) {
                CGContextSetRGBFillColor(context, 1, 1, 1, 1); // white
                boardLocation loc; 
                loc.x = row;
                loc.y = column;
                PixelCoordinates pixCoord = [self getPixelCoordinatesFrom:loc];
                CGContextFillEllipseInRect(context, CGRectMake(pixCoord.x, pixCoord.y, 40, 40));
            }
        }
    }
    
}


@end
