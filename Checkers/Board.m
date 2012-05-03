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
        
        // Allocate and initialize board to all empty pieces
        board = malloc(8*sizeof(int *));
        for (int i=0; i<8; i++) {
            board[i] = calloc(8, sizeof(BoardPiece));
        }
        
        // Add the black pieces at their starting points
        for (int row=0; row<3; row++) {
            for (int column=0; column<8; column++) {
                if (row%2 != column%2) {
                    board[column][row] = BoardPieceBlack;
                }
            }
        }
        
        // Add the white pieces at their starting points
        for (int row=5; row<8; row++) {
            for (int column=0; column<8; column++) {
                if (row%2 != column%2) {
                    board[column][row] = BoardPieceWhite;
                }
            }
        }
        
        captured = NULL;
        whiteCapturedCount = 0;
        blackCapturedCount = 0;
        
        turn = 0; // white goes first, I guess
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
    //boardLocation currentLoc = start;
    
    switch (piece) {
        case BoardPieceWKing:
            // Will implement later
            return NO;
            break;
        
        case BoardPieceWhite:
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
                        whiteCapturedCount += 1;
                        
                        // Check to see if you can make another capture
                        boardLocation nextLocLeft;
                        nextLocLeft.x = end.x-1;
                        nextLocLeft.y = end.y-1;
                        
                        boardLocation nextLeftDest;
                        nextLeftDest.x = end.x-2;
                        nextLeftDest.y = end.y-2;
                        
                        boardLocation nextLocRight;
                        nextLocRight.x = end.x+1;
                        nextLocRight.y = end.y-1;
                        
                        boardLocation nextRightDest;
                        nextRightDest.x = end.x+2;
                        nextRightDest.y = end.y-2;
                        
                        if (([self getBoardPieceAtLoc:nextLocLeft] == BoardPieceBlack && [self getBoardPieceAtLoc:nextLeftDest] == BoardPieceEmpty) || ([self getBoardPieceAtLoc:nextLocRight] == BoardPieceBlack && [self getBoardPieceAtLoc:nextRightDest] == BoardPieceEmpty)) {
                            turn = !turn;
                        }
                        
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
                        whiteCapturedCount += 1;
                        
                        // Check to see if you can make another capture
                        boardLocation nextLocLeft;
                        nextLocLeft.x = end.x-1;
                        nextLocLeft.y = end.y-1;
                        
                        boardLocation nextLeftDest;
                        nextLeftDest.x = end.x-2;
                        nextLeftDest.y = end.y-2;
                        
                        boardLocation nextLocRight;
                        nextLocRight.x = end.x+1;
                        nextLocRight.y = end.y-1;
                        
                        boardLocation nextRightDest;
                        nextRightDest.x = end.x+2;
                        nextRightDest.y = end.y-2;
                        
                        if (([self getBoardPieceAtLoc:nextLocLeft] == BoardPieceBlack && [self getBoardPieceAtLoc:nextLeftDest] == BoardPieceEmpty) || ([self getBoardPieceAtLoc:nextLocRight] == BoardPieceBlack && [self getBoardPieceAtLoc:nextRightDest] == BoardPieceEmpty)) {
                            turn = !turn;
                        }
                        
                        return YES;
                    }
                }
                return NO;
            }
            break;
        
        case BoardPieceBKing:
            // Will implement later
            return NO;
            break;
        
        case BoardPieceBlack:
            if (end.y - start.y == 2) {
                if (end.x - start.x == 2) {
                    // Down right
                    boardLocation nearLoc;
                    nearLoc.x = start.x+1;
                    nearLoc.y = start.y+1;
                    if ([self getBoardPieceAtLoc: nearLoc] == BoardPieceWhite || [self getBoardPieceAtLoc: nearLoc] == BoardPieceWKing) {
                        // Capture the enemy!
                        [self setBoardPiece:BoardPieceEmpty AtLoc:nearLoc];
                        blackCapturedCount += 1;
                        
                        // Check to see if you can make another capture
                        boardLocation nextLocLeft;
                        nextLocLeft.x = end.x-1;
                        nextLocLeft.y = end.y+1;
                        
                        boardLocation nextLeftDest;
                        nextLeftDest.x = end.x-2;
                        nextLeftDest.y = end.y+2;
                        
                        boardLocation nextLocRight;
                        nextLocRight.x = end.x+1;
                        nextLocRight.y = end.y+1;
                        
                        boardLocation nextRightDest;
                        nextRightDest.x = end.x+2;
                        nextRightDest.y = end.y+2;
                        
                        if (([self getBoardPieceAtLoc:nextLocLeft] == BoardPieceWhite && [self getBoardPieceAtLoc:nextLeftDest] == BoardPieceEmpty) || ([self getBoardPieceAtLoc:nextLocRight] == BoardPieceWhite && [self getBoardPieceAtLoc:nextRightDest] == BoardPieceEmpty)) {
                            turn = !turn;
                        }
                        
                        return YES;
                    }
                } else if (end.x - start.x == -2) {
                    // Down left
                    boardLocation nearLoc;
                    nearLoc.x = start.x-1;
                    nearLoc.y = start.y+1;
                    if ([self getBoardPieceAtLoc: nearLoc] == BoardPieceWhite || [self getBoardPieceAtLoc: nearLoc] == BoardPieceWKing) {
                        // Capture the enemy!
                        [self setBoardPiece:BoardPieceEmpty AtLoc:nearLoc];
                        blackCapturedCount += 1;
                        
                        // Check to see if you can make another capture
                        boardLocation nextLocLeft;
                        nextLocLeft.x = end.x-1;
                        nextLocLeft.y = end.y+1;
                        
                        boardLocation nextLeftDest;
                        nextLeftDest.x = end.x-2;
                        nextLeftDest.y = end.y+2;
                        
                        boardLocation nextLocRight;
                        nextLocRight.x = end.x+1;
                        nextLocRight.y = end.y+1;
                        
                        boardLocation nextRightDest;
                        nextRightDest.x = end.x+2;
                        nextRightDest.y = end.y+2;
                        
                        if (([self getBoardPieceAtLoc:nextLocLeft] == BoardPieceWhite && [self getBoardPieceAtLoc:nextLeftDest] == BoardPieceEmpty) || ([self getBoardPieceAtLoc:nextLocRight] == BoardPieceWhite && [self getBoardPieceAtLoc:nextRightDest] == BoardPieceEmpty)) {
                            turn = !turn;
                        }
                        
                        return YES;
                    }
                }
            }
            return NO;
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
    
    player = turn;
    
    if ([self isGameOver]) {
        return NO;
    }
    
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
        if (turn == 1) {
            return NO;
        }
        // Trying to move a black piece
        if (piece > 2) {
            return NO;
        }
        // Case: No moving backwards if not king
        if (dest.y >= start.y) {
            if (piece == BoardPieceWhite) {
                return NO;
            }
        }
    } else {
        // Black Player
        if (turn == 0) {
            return NO;
        }
        // Trying to move a white piece
        if (piece < 3) {
            return NO;
        }
        // Case: No moving backwards if not king
        if (start.y >= dest.y) {
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
        
        turn = !turn;
        
        return YES;
    }
    
    // Case: Captures
    if ([self hasPathFromStart:start to:dest using: piece]) {
        // Do stuff
        [self setBoardPiece:piece AtLoc:dest];
        [self setBoardPiece:BoardPieceEmpty AtLoc:start];
        
        turn = !turn;
        
        return YES;
    }

    // All else fails
    return NO;
}

- (int **) getBoard {
    return board;
}

- (BOOL) isGameOver {
    return (whiteCapturedCount == 12 || blackCapturedCount == 12);
}

- (int) winner {
    if (![self isGameOver]) {
        return -1;
    }
    if (whiteCapturedCount == 12) {
        return 0;
    } else {
        return 1;
    }
}

@end
