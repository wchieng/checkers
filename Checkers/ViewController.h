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

@interface ViewController : UIViewController {
    Board *_board;
    CheckerView *_checkerView;
    int _player; // 0 if white, 1 if black
}
@property (nonatomic, retain) Board* board;
@property (nonatomic) int player;

- (BOOL) makeMoveFromX: (int)startX Y: (int)startY toNewX: (int) destX newY: (int) destY;

@end
