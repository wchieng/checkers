//
//  CheckerView.h
//  Checkers
//
//  Created by William Chieng on 5/2/12.
//  Copyright (c) 2012 University of California, Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Board.h"

@class ViewController, Board;

@interface CheckerView : UIView {
    ViewController *_viewController;
    Board *_board;
}

@end
