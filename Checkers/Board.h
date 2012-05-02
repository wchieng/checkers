//
//  Board.h
//  Checkers
//
//  Created by William Chieng on 5/1/12.
//

#import <UIKit/UIKit.h>

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
}

- (BOOL) movePieceFrom: (boardLocation) start to: (boardLocation) dest by: (int) player;
- (boardLocation *) getCapturedPieces;

@end
