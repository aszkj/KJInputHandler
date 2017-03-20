
实际项目中，我们经常碰到一些需要输入的地方，比如用户姓名、搜索、地址详情，用户反馈等，在这些场景中，我们一般都不允许输入表情和特殊字符的
我们通常的做法是在每个包含这些输入的页面去实现UITextfiled或者UITextView的代理，在代理方法里面去限制，这样可以解决，但是比较麻烦，项目中输入的地方可能有多处，这样导致多个地方需要写这些实现代理的方法，所以为了解决这个蛋疼的问题，就写了KJInputHandler

使用方法如下，比如我要给UITextView限制只能输入中文和英文
#import "UITextView+KJInputHandler.h"


@property (weak, nonatomic) IBOutlet UITextView *testTextView;
self.testTextView.inputRule = Input_Only_ChineseEnglish;

限制UITextfiled
#import "UITextField+KJInputHandler.h"

@property (weak, nonatomic) IBOutlet UITextField *testTextFiled;
self.testTextFiled.inputRule = Input_Only_ChineseEnglish;

限制用户输入最大长度
self.testTextView.inputMaxLength = 10;

监听用户实时输入
self.testTextView.textChangeBlock = ^(UITextView *textView){
        NSLog(@"texview -- %@",textView.text);
};
    
