//
//  GCHelper.m
//  Checkers
//
//  

#import "GCHelper.h"

@implementation GCHelper
@synthesize gameCenterAvailable;

static GCHelper *sharedHelper = nil;
+ (GCHelper *) sharedInstance {
    if (sharedHelper == nil) {
        sharedHelper = [[GCHelper alloc] init];
    }
    return sharedHelper;
}

- (BOOL) isGameCenterAvailable {
    // Check to make sure GKLocalPlayer API is available
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    
    // Make sure device is running iOS 4.1+
    NSString *requiredVer = @"4.1";
    NSString *curSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVerSupported = ([curSysVer compare:requiredVer options:NSNumericSearch] != NSOrderedAscending);
    
    return (gcClass && osVerSupported);
}

- (id)init {
    if ((self = [super init])) {
        gameCenterAvailable = [self isGameCenterAvailable];
        if (gameCenterAvailable) {
            NSNotificationCenter *nc = 
            [NSNotificationCenter defaultCenter];
            [nc addObserver:self 
                   selector:@selector(authenticationChanged) 
                       name:GKPlayerAuthenticationDidChangeNotificationName 
                     object:nil];
        }
    }
    return self;
}

- (void)authenticationChanged {    
    
    if ([GKLocalPlayer localPlayer].isAuthenticated && !userAuthenticated) {
        NSLog(@"Authentication changed: player authenticated.");
        userAuthenticated = TRUE;           
    } else if (![GKLocalPlayer localPlayer].isAuthenticated && userAuthenticated) {
        NSLog(@"Authentication changed: player not authenticated");
        userAuthenticated = FALSE;
    }
    
}

- (void) authenticateLocalUser {
    if (!gameCenterAvailable) {
        return;
    }
    
    NSLog(@"Authenticating local user...");
    if ([GKLocalPlayer localPlayer].authenticated == NO) {
        [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:nil];
    } else {
        NSLog(@"Already authenticated.");
    }
}

@end
