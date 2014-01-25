//
// Created by akuraru on 2014/01/25.
// Copyright (c) 2014 P.I.akura. All rights reserved.
//

#import "MigrationBaseViewController.h"

@interface MigrationBaseViewController ()
@property(nonatomic, strong) UIViewController *root;
@property(nonatomic, strong) UIWindow *currentWindow;
@end

@implementation MigrationBaseViewController

+ (id)setUpWithWindow:(UIWindow *)window {
    id this = [[self alloc] init];
    [this setCurrentWindow:window];
    return this;
}

- (void)setCurrentWindow:(UIWindow *)currentWindow {
    _currentWindow = currentWindow;
    self.root = currentWindow.rootViewController;
    currentWindow.rootViewController = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self performSelectorInBackground:@selector(migration) withObject:nil];
}

- (void)migration {
    __weak typeof (self) this = self;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        [this setup];

        if (this.complete) {
            this.complete();
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            this.currentWindow.rootViewController = this.root;
        });
    });
}

- (void)setup {}

- (void)dealloc {
    self.complete = nil;
    self.currentWindow = nil;
    self.root = nil;
}
@end