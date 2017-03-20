//
//  InputHandler.h
//  testRegix
//
//  Created by mm on 17/3/17.
//  Copyright © 2017年 mm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, InputRule) {
    Input_Common_SupportEmoji = 0,//包括表情，默认支持所有的输入
    Input_Common = 1,//中文、英文、数字、中英文标点，空格无表情
    Input_Common_NoPunctuation = 2,//中文、英文、数字，空格无表情
    Input_Only_ChineseEnglish = 3,//中文、英文
    Input_Only_Chinese = 4,//中文
    Input_Only_Engilish = 5,//英文
    Input_Only_Number = 6,//数字
};

typedef void(^TextChangeBlock)(id textInputer);

@interface KJInputHandler : NSObject

- (instancetype)initWithInputer:(id)inputer;

@property (nonatomic,assign)InputRule inputRule;
/**
 这个正则默认如果设置了上面的inputRule，那么它就会有对应的正则
 但是这个值你也可以自己赋,那么过滤的就是你设置的正则
 */
@property (nonatomic,copy)NSString *inputRuleRegix;

@property (nonatomic,assign)NSInteger inputMaxLength;

@property (nonatomic,copy)TextChangeBlock textChangeBlock;

@end
