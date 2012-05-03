//
//  CheckerView.h
//  Checkers
//
//  Created by William Chieng on 5/2/12.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Board.h"

@class ViewController, Board;

@interface CheckerView : UIView {
    Board *_board;
    ViewController *_viewController;
    int currentPieceInMotion;
    CGFloat motionLocX;
    CGFloat motionLocY;
    int touchStartX;
    int touchStartY;
}
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) ViewController *viewController;
@end
