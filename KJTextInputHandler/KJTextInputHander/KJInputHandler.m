//
//  InputHandler.m
//  testRegix
//
//  Created by mm on 17/3/17.
//  Copyright © 2017年 mm. All rights reserved.
//

#import "KJInputHandler.h"
static NSString *Input_Support_Emoj_Regix = @"Input_Support_Emoj_Regix";
static NSString *Input_Common_Regix = @"[\u4e00-\u9fa5a-zA-Z0-9\u3000-\u301e\ufe10-\ufe19\ufe30-\ufe44\ufe50-\ufe6b\uff01-\uffee]+";
static NSString *Input_Common_NoPunctuation_Regix = @"[\u4e00-\u9fa5a-zA-Z0-9 ]+";
static NSString *Input_Only_ChineseEnglish_Regix = @"^[a-zA-Z\u4e00-\u9fa5]+$";
static NSString *Input_Only_Chinese_Regix = @"^[\u4e00-\u9fa5]+$";
static NSString *Input_Only_Engilish_Regix = @"^[a-zA-Z]+$";
static NSString *Input_Only_Number_Regix = @"^[0-9]+$";

@interface KJInputHandler ()<UITextViewDelegate,UITextFieldDelegate>

@property (nonatomic,weak)id inputer;

@end

@implementation KJInputHandler

- (instancetype)initWithInputer:(id)inputer {

    self = [super init];
    if (self) {
        self.inputer = inputer;
        [self.inputer setValue:self forKey:@"delegate"];
    }
    return self;
}

- (void)setInputRule:(InputRule)inputRule {
    self.inputRuleRegix = [self inputRegixForInputRule:inputRule];
}

- (void)setTextChangeBlock:(TextChangeBlock)textChangeBlock {
    _textChangeBlock = textChangeBlock;
    if ([self.inputer isKindOfClass:[UITextField class]]) {
        [self addTextFiledTextChangeNotiFy];
    }
}

- (void)addTextFiledTextChangeNotiFy {
    UITextField *textFiled = (UITextField *)self.inputer;
    [textFiled addTarget:self action:@selector(textFiledTextChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFiledTextChange:(UITextField *)textFiled {
    if (self.textChangeBlock) {
        self.textChangeBlock(textFiled);
    }
}

- (NSString *)inputRegixForInputRule:(InputRule)inputRule {
    NSString *inputRuleRegix = nil;
    switch (inputRule) {
        case Input_Common_SupportEmoji:
            inputRuleRegix = Input_Support_Emoj_Regix;
            break;
        case Input_Common:
            inputRuleRegix = Input_Common_Regix;
            break;
        case Input_Common_NoPunctuation:
            inputRuleRegix = Input_Common_NoPunctuation_Regix;
            break;
        case Input_Only_ChineseEnglish:
            inputRuleRegix = Input_Only_ChineseEnglish_Regix;
            break;
        case Input_Only_Chinese:
            inputRuleRegix = Input_Only_Chinese_Regix;
            break;
        case Input_Only_Engilish:
            inputRuleRegix = Input_Only_Engilish_Regix;
            break;
        case Input_Only_Number:
            inputRuleRegix = Input_Only_Number_Regix;
            break;
        default:
            break;
    }
    return inputRuleRegix;
}

- (BOOL)isLegalOfInput:(NSString *)input {
    
    //支持表情，默认的话支持所有的输入，
    //因为很多第三方输入法的表情的ASCII码你是没办法确定的，所以表情的正则是没办法完全确定的，网上很多的验证表情正则都是不完整的
    if ([input isEqualToString:Input_Support_Emoj_Regix]) {
        return YES;
    }
    
    NSPredicate *curPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",self.inputRuleRegix];
    BOOL ret = [curPredicate evaluateWithObject:input];
    return ret;
}

- (BOOL)needInputFilter {
    return self.inputRuleRegix != nil;
}

- (BOOL)needMaxLengthlimit {
    return self.inputMaxLength > 0;
}


#pragma mark ---------------------TextView Delegate------------------------------
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.length > 0 && [text isEqualToString:@""]) {
        return YES;
    }
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    
    if ([self needInputFilter]) {
        if (![self isLegalOfInput:text]) {
            return NO;
        }
    }
    
    if ([self needMaxLengthlimit]) {
        if (range.location >= self.inputMaxLength || textView.text.length >= self.inputMaxLength) {
            return NO;
        }
    }
    
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.textChangeBlock) {
        self.textChangeBlock(textView);
    }
}

#pragma mark ---------------------TextFiled Method------------------------------
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.length > 0 && [string isEqualToString:@""]) {
        return YES;
    }
    
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
    }
    
    if ([self needInputFilter]) {
        if (![self isLegalOfInput:string]) {
            return NO;
        }
    }
    
    if ([self needMaxLengthlimit]) {
        if (range.location >= self.inputMaxLength || textField.text.length >= self.inputMaxLength) {
            return NO;
        }
    }
    
    return YES;


}


@end
