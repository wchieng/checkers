//
//  CheckerView.h
//  Checkers
//
//  Created by William Chieng on 5/2/12.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface CheckerView : UIView {
    ViewController *_viewController;
}
@property (retain) IBOutlet ViewController *_viewController;
@end
