//
//  AppDelegate.m
//  B
//
//  Created by 申明达 on 2023/2/27.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UIViewController *vc = [[UIViewController alloc] init];
    
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
