//
//  ViewController.h
//  Checkers
//
//  Created by William Chieng on 5/1/12.
//

#import <UIKit/UIKit.h>
#import "Board.h"
#import "CheckerView.h"

@class Board, CheckerView;

typedef struct {
    int x;
    int y;
} PixelCoordinates;

typedef struct {
    int x;
    int y;
} boardLocation;

typedef enum {
    BoardPieceEmpty = 0,
    BoardPieceWhite = 1,
    BoardPieceWKing = 2,
    BoardPieceBlack = 3,
    BoardPieceBKing = 4
} BoardPiece;

@interface ViewController : UIViewController {
    Board *_board;
    CheckerView *_checkerView;
}

@end
