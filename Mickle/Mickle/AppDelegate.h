//
//  AppDelegate.h
//  Mickle
//
//  Created by 刘瑾 on 2019/4/18.
//  Copyright © 2019年 LJA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

