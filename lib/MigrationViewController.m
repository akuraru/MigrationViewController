//
// Created by P.I.akura on 2013/05/23.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "MigrationViewController.h"
#import <MagicalRecord.h>

@interface MigrationViewController ()
@end

@implementation MigrationViewController

- (void)setup {
    if ([self isRequiredMigration]) {
        [self setupWithMigration];
    } else {
        [self setupCoreData];
    }
}

- (id)storeName {
    return (_storeName) ?: [MagicalRecord defaultStoreName];
}

- (BOOL)isRequiredMigration {
    NSURL *storeURL = ([[self storeName] isKindOfClass:[NSURL class]]) ? (NSURL *) [self storeName] : [NSPersistentStore MR_urlForStoreName:[self storeName]];
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
}

- (void)setupCoreData {
    [MagicalRecord setupCoreDataStackWithStoreNamed:[self storeName]];
}

- (void)dealloc {
    self.storeName = nil;
}
@end