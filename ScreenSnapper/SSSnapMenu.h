//
//  SSSnapMenu.h
//  ScreenSnapper
//
//  Created by Sam Stone on 31/03/2015.
//  Copyright (c) 2015 Sam Stone.
//

#import <Cocoa/Cocoa.h>

@interface SSSnapMenu : NSMenu
@property (strong, nonatomic) NSMenuItem *startAtLoginItem;
@property (strong, nonatomic) NSMenuItem *snapScreenItem;
@property (strong, nonatomic) NSMenuItem *snapWindowItem;
@property (strong, nonatomic) NSMenuItem *snapSelectionItem;
@property (strong, nonatomic) NSMenuItem *saveToClipboardItem;
@property (strong, nonatomic) NSMenuItem *saveToDiskItem;
@property (strong, nonatomic) NSMenuItem *quitAppItem;
@end
