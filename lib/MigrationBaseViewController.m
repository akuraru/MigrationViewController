//
// Created by akuraru on 2014/01/25.
// Copyright (c) 2014 P.I.akura. All rights reserved.
//

#import "MigrationBaseViewController.h"

@interface MigrationBaseViewController ()
@end

@implementation MigrationBaseViewController {
    UIViewController *_root;
    UIWindow *_currentWindow;
}

+ (id)setUpWithWindow:(UIWindow *)window {
    id this = [[self alloc] init];
    [this setCurrentWindow:window];
    return this;
}

- (void)setCurrentWindow:(UIWindow *)currentWindow {
    _currentWindow = currentWindow;
    _root = currentWindow.rootViewController;
    currentWindow.rootViewController = self;
}

- (UIWindow *)currentWindow {
    return _currentWindow;
}

- (UIViewController *)root {
    return _root;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self performSelectorOnMainThread:@selector(migration) withObject:nil waitUntilDone:NO];
}

- (void)migration {
    [self setup];

    if (self.complete) {
        self.complete();
    }

    self.currentWindow.rootViewController = self.root;
}

- (void)setup {}

- (void)dealloc {
    self.complete = nil;
    _currentWindow = nil;
    _root = nil;
}
@end