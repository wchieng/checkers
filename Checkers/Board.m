//
//  Board.m
//  Checkers
//
//  Created by William Chieng on 5/1/12.  
//

#import "Board.h"

@implementation Board
- (id) init {
    if (self = [super init]) {
        board = malloc(8*sizeof(int *));
        for (int i=0; i<8; i++) {
            board[i] = calloc(8, sizeof(BoardPiece));
        }
        captured = NULL;
    }
    return self;
}

- (BoardPiece) getBoardPieceAtLoc: (boardLocation) loc {
    return board[loc.x][loc.y];
}

- (void) setBoardPiece: (BoardPiece) piece AtLoc: (boardLocation) loc {
    board[loc.x][loc.y] = piece;
}

- (BOOL) boardLocEqual: (boardLocation) loc1 to: (boardLocation) loc2 {
    if (loc1.x == loc2.x && loc1.y == loc2.y) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) hasPathFromStart: (boardLocation) start to: (boardLocation) end using: (BoardPiece) piece {
    //TODO: FINISH THIS
    boardLocation currentLoc = start;
    
    switch (piece) {
        case BoardPieceWKing:
            return NO;
            break;
        
        case BoardPieceWhite:
            //while (![self boardLocEqual: currentLoc to: end]) {
            //}
            if (end.y - start.y == -2) {
                if (end.x - start.x == 2) {
                    // Diagonal forward right
                    // Check if there's a piece immediately in the way
                    boardLocation nearLoc;
                    nearLoc.x = start.x+1;
                    nearLoc.y = start.y-1;
                    if ([self getBoardPieceAtLoc: nearLoc] == BoardPieceBlack || [self getBoardPieceAtLoc: nearLoc] == BoardPieceBKing) {
                        // Capture the enemy!
                        [self setBoardPiece:BoardPieceEmpty AtLoc:nearLoc];
                        return YES;
                    }
                } else if (end.x - start.x == -2) {
                    // Diagonal forward left
                    // Check if there's a piece immediately in the way
                    boardLocation nearLoc;
                    nearLoc.x = start.x-1;
                    nearLoc.y = start.y-1;
                    if ([self getBoardPieceAtLoc: nearLoc] == BoardPieceBlack || [self getBoardPieceAtLoc: nearLoc] == BoardPieceBKing) {
                        // Capture the enemy!
                        [self setBoardPiece:BoardPieceEmpty AtLoc:nearLoc];
                        return YES;
                    }
                }
                return NO;
            }
            break;
        
        case BoardPieceBKing:
            return NO;
            break;
        
        case BoardPieceBlack:
            
            break;
        
        default:
            return NO;
            break;
    }
    return NO;
}

- (void) addCapturedPiece: (boardLocation) loc {
    
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
        if (dest.y <= start.y) {
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
        if (start.y <= dest.y) {
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
        // Do stuff
        [self setBoardPiece:piece AtLoc:dest];
        [self setBoardPiece:BoardPieceEmpty AtLoc:start];
        
        return YES;
    }

    // All else fails
    return NO;
}

@end
