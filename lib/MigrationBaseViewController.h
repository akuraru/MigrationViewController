//
// Created by akuraru on 2014/01/25.
// Copyright (c) 2014 P.I.akura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MigrationBaseViewController : UIViewController

@property (nonatomic, strong) void(^complete)();

- (void)setCurrentWindow:(UIWindow *)currentWindow;
+ (instancetype)setUpWithWindow:(UIWindow *)window;

// You may need to override this message.
- (void)setup;
@end