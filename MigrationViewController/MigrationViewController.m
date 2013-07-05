//
// Created by P.I.akura on 2013/05/23.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <UIKit/UIKit.h>
#import "MigrationViewController.h"
#import "CoreData+MagicalRecord.h"

@interface MigrationViewController ()
@property (nonatomic, strong) UIViewController *root;
@property (nonatomic, strong) UIWindow *window;
@end

@implementation MigrationViewController

+ (id)setUpWithWindow:(UIWindow *)window {
    id this = [[self alloc] init];
    [this setWindow:window];
    return this;
}

- (void)setWindow:(UIWindow *)window {
    _window = window;
    self.root = window.rootViewController;
    window.rootViewController = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        [self setup];
        
        if (self.complete) {
            self.complete();
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.window.rootViewController = self.root;
        });
    });
}
- (void)setup {
    ([self isRequiredMigration])?
        [self setupWithMigration] :
        [self setupCoreData];
}
- (id)storeName {
    return (_storeName) ?:  [MagicalRecord defaultStoreName];
}
- (BOOL)isRequiredMigration {
    NSURL *storeURL =  [NSPersistentStore MR_urlForStoreName:[self storeName]];
    NSError *error = nil;
    NSDictionary *sourceMetaData = [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType
                                                                                              URL:storeURL
                                                                                            error:&error];
    if (sourceMetaData == nil) {
        return NO;
    } else if (error) {
        abort();
    }
    BOOL isCompatible = [[NSManagedObjectModel MR_defaultManagedObjectModel] isConfiguration:nil compatibleWithStoreMetadata:sourceMetaData];
    return !isCompatible;
}

- (void)setupWithMigration {
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:[self storeName]];
    if (self.migrationComplete)
        self.migrationComplete();
}

- (void)setupCoreData {
    [MagicalRecord setupCoreDataStackWithStoreNamed:[self storeName]];
}
- (void)dealloc {
    self.complete = nil;
    self.storeName = nil;
    self.window = nil;
    self.root = nil;
    [super dealloc];
}
@end