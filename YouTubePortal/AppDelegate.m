//
//  AppDelegate.m
//  YouTubePortal
//
//  Created by Carlton Gibson on 15/05/2012.
//  Copyright (c) 2012 Noumenal Software Ltd. All rights reserved.
//

#import "AppDelegate.h"

#import "YouTubePortalViewController.h"

@implementation AppDelegate {
    YouTubePortalViewController *_ytvc;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blackColor];
    
    _ytvc = [[YouTubePortalViewController alloc] initWithYouTubeVideoId:@"CwIvBNsSywQ"];
    [self.window addSubview:_ytvc.view];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
