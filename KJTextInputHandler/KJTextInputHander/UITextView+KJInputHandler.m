//
//  UITextView+InputFilter.m
//  testRegix
//
//  Created by mm on 17/3/16.
//  Copyright © 2017年 mm. All rights reserved.
//

#import "UITextView+KJInputHandler.h"
#import <objc/runtime.h>

const void *TextView_Attached_InputFiler_Key = @"TextView_Attached_InputFiler_Key";

@implementation UITextView (KJInputHandler)

- (void)setInputHandler:(KJInputHandler *)inputHandler {
    objc_setAssociatedObject(self, TextView_Attached_InputFiler_Key, inputHandler, OBJC_ASSOCIATION_RETAIN);
}

- (KJInputHandler *)inputHandler {
    return objc_getAssociatedObject(self, TextView_Attached_InputFiler_Key);
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
