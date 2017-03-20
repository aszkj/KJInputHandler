//
//  UITextField+KJInputHandler.h
//  KJTextInputHandler
//
//  Created by mm on 17/3/17.
//  Copyright © 2017年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KJInputHandler.h"

@interface UITextField (KJInputHandler)

@property (nonatomic,assign)InputRule inputRule;
/**
 这个正则默认如果设置了上面的inputRule，那么它就会有对应的正则
 但是这个值你也可以自己赋,那么过滤的就是你设置的正则
 */
@property (nonatomic,copy)NSString *inputRuleRegix;

@property (nonatomic,assign)NSInteger inputMaxLength;

@property (nonatomic,copy)TextChangeBlock textChangeBlock;

@property (nonatomic,strong)KJInputHandler *inputHandler;


@end
