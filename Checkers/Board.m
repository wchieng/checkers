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

// Returns YES if it was a valid move; else NO
- (BOOL) makeMoveFrom:(boardLocation)start to:(boardLocation)dest by:(int)player {
    
    return YES;
}

@end
