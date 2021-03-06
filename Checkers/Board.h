//
//  Board.h
//  Checkers
//
//  Created by William Chieng on 5/1/12.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@class ViewController;

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

@interface Board : NSObject {
    int** board;
    NSMutableArray *captured;
    ViewController *_viewController;
    
    int whiteCapturedCount; // Amount white player captured
    int blackCapturedCount; // Amount black player captured
    
    int turn;
}

- (BOOL) movePieceFrom: (boardLocation) start to: (boardLocation) dest by: (int) player;
//- (boardLocation *) getCapturedPieces;
- (int **) getBoard;
- (BoardPiece) getBoardPieceAtLoc: (boardLocation) loc;
- (BOOL) isGameOver;
- (int) winner;

@end
