# KJInputHandler
# In the actual project, we often met many places to input,
# such as the input of username, the input of search, the input of adress detail
# In these scenarios, we usually don't allowd input emotions and special characters,We usually practice is everywhere to implete
# delegate for the UITextfiled or UITextView,this can make it,but there are too many places to implete the delegate for your project
# because there are too many places need to input in your project
# so inorder to make it easier to solve this problem, i made KJInputHandler
# for this, you only need to import a head file, set a property 
# for example, if i need to limit the input for a UITextView and it can only input chinese and english,Use the following

#import "UITextView+KJInputHandler.h"
@property (weak, nonatomic) IBOutlet UITextView *testTextView;
self.testTextView.inputRule = Input_Only_ChineseEnglish;

# In the same way for UITextfiled
#import "UITextField+KJInputHandler.h"
@property (weak, nonatomic) IBOutlet UITextField *testTextFiled;
self.testTextFiled.inputRule = Input_Only_ChineseEnglish;

#also you can set the property inputMaxLength to limit their inputMaxLength
self.testTextView.inputMaxLength = 10;

#also when you want to listen the text change of them, you can set the textChangeBlock
self.testTextView.textChangeBlock = ^(UITextView *textView){
        NSLog(@"texview -- %@",textView.text);
};
    
