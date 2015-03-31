//
//  SSLoginItemController.h
//  ScreenSnapper
//
//  Created by Sam Stone on 31/03/2015.
//  Copyright (c) 2015 Sam Stone. All rights reserved.
//

#import "StartAtLoginController.h"

@interface SSLoginItemController : StartAtLoginController
+ (instancetype)sharedController;
- (void)toggleStartOnLogin:(id)sender;
@end
