//
//  UITextField+KJInputHandler.m
//  KJTextInputHandler
//
//  Created by mm on 17/3/17.
//  Copyright © 2017年 mm. All rights reserved.
//

#import "UITextField+KJInputHandler.h"
#import <objc/runtime.h>

const void *TextFiled_Attached_InputFiler_Key = @"TextFiled_Attached_InputFiler_Key";


@implementation UITextField (KJInputHandler)

- (void)setInputHandler:(KJInputHandler *)inputHandler {
    objc_setAssociatedObject(self, TextFiled_Attached_InputFiler_Key, inputHandler, OBJC_ASSOCIATION_RETAIN);
}

- (KJInputHandler *)inputHandler {
    return objc_getAssociatedObject(self, TextFiled_Attached_InputFiler_Key);
}

- (void)setInputRule:(InputRule)inputRule {
    [self attachInputHander];
    self.inputHandler.inputRule = inputRule;
}

- (void)setInputMaxLength:(NSInteger)inputMaxLength {
    [self attachInputHander];
    self.inputHandler.inputMaxLength = inputMaxLength;
}

- (void)setTextChangeBlock:(TextChangeBlock)textChangeBlock {
    [self attachInputHander];
    self.inputHandler.textChangeBlock = textChangeBlock;
}

- (void)attachInputHander {
    if (!self.inputHandler) {
        self.inputHandler = [[KJInputHandler alloc] initWithInputer:self];
    }
}



@end
