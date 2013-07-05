//
// Created by P.I.akura on 2013/05/23.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef void (^t_func)();

@interface MigrationViewController : UIViewController

@property (nonatomic, strong) t_func complete;
@property (nonatomic, strong) NSString *storeName;

- (id)initWithWindow:(UIWindow *)window;
+ (instancetype)setUpWithWindow:(UIWindow *)window;

@end