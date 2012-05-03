//
//  Board.h
//  Checkers
//
//  Created by William Chieng on 5/1/12.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@class ViewController;

@interface Board : NSObject {
    int** board;
    NSMutableArray *captured;
    ViewController *_viewController;
}

- (BOOL) movePieceFrom: (boardLocation) start to: (boardLocation) dest by: (int) player;
- (boardLocation *) getCapturedPieces;
- (int **) getBoard;
- (BoardPiece) getBoardPieceAtLoc: (boardLocation) loc;

@end
