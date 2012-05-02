//
//  Board.m
//  Checkers
//
//  Created by William Chieng on 5/1/12.
//  Copyright (c) 2012 University of California, Berkeley. All rights reserved.
//

#import "Board.h"

@implementation Board
- (id) init {
    if (self = [super init]) {
        board = malloc(8*sizeof(int *));
        for (int i=0; i<8; i++) {
            board[i] = calloc(8, sizeof(BoardPiece));
        }
    }
    return self;
}

- (BoardPiece) getBoardPieceAtLoc: (boardLocation) loc {
    return board[loc.x][loc.y];
}

- (void) setBoardPiece: (BoardPiece) piece AtLoc: (boardLocation) loc {
    board[loc.x][loc.y] = piece;
}

- (BOOL) hasPathFromStart: (boardLocation) start to: (boardLocation) end using: (BoardPiece) piece {
    //TODO: DO THIS.
    return YES;
}

// Returns YES if it was a valid move; else NO
- (BOOL) movePieceFrom: (boardLocation)start to: (boardLocation)dest by: (int) player {
    
    BoardPiece piece = [self getBoardPieceAtLoc:start];
    BoardPiece destPiece = [self getBoardPieceAtLoc:dest];
    
    if (piece == BoardPieceEmpty) {
        return NO;
    }
    
    // Case: Destination occupied
    if (destPiece != BoardPieceEmpty) {
        return NO;
    }
    
    // Case: No moving onto PointOfNoReturn squares    
    // (even, even), (odd, odd) squares are no-gos
    if ((dest.x % 2) == (dest.y % 2)) {
        return NO;
    }
    
    if (player == 0) {
        // White Player
        if (piece > 3) {
            return NO;
        }
        // Case: No moving backwards if not king
        if (dest.y - start.y <= 0) {
            if (piece == BoardPieceWhite) {
                return NO;
            }
        }
    } else {
        // Black Player
        if (piece < 3) {
            return NO;
        }
        // Case: No moving backwards if not king
        if (start.y - dest.y >= 0) {
            if (piece == BoardPieceBlack) {
                return NO;
            }
        }
    }
    
    // Case: Trying to move to nearby diagonal
    if ((abs(dest.y - start.y) == 1) && (abs(dest.x - start.x) == 1)) {
        // Moving backwards already checked above
        [self setBoardPiece:piece AtLoc:dest];
        [self setBoardPiece:BoardPieceEmpty AtLoc:start];
        return YES;
    }
    
    // Case: Captures
    if ([self hasPathFromStart:start to:dest using: piece]) {
        return YES;
    }

    // All else fails
    return NO;
}

@end
