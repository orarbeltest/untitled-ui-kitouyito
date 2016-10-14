//
//  AnimaPackageManager.m
//  AnimaPackage
//
//  Created by Your Name on 14/10/2016, using AnimaApp.com, under MIT license.
//  Copyright © 2016 Company Name. All rights reserved.
//

#import "AnimaPackageManager.h"

@implementation AnimaPackageManager

+ (instancetype)shared {
    static AnimaPackageManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [AnimaPackageManager new];
    });
    return shared;
}

#pragma mark - Setup

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTheme];
    }
    return self;
}

- (void)setupTheme {
    self.theme = [ANTheme new];
    self.theme.navBarColor          = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    self.theme.navBarButtonsColor   = [UIColor colorWithRed:0.0 green:0.42 blue:1.0 alpha:1.0];
    self.theme.navBarTitleColor     = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    self.theme.navBarTitleFontSize  = 16;
    self.theme.navBarIsTranslucent  = NO;
}

#pragma mark - Helpers

- (UIStoryboard *)animaStoryboard {
    return [UIStoryboard storyboardWithName:@"AnimaPackage" bundle:nil];
}

- (UIViewController *)initialVC {
    return [self.animaStoryboard instantiateInitialViewController];
}

@end