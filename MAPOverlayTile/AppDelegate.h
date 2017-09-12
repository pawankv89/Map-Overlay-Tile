//
//  AppDelegate.h
//  MAPOverlayTile
//
//  Created by Pawan kumar on 9/12/17.
//  Copyright © 2017 Pawan kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

