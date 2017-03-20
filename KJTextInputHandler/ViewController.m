//
//  ViewController.m
//  KJTextInputHandler
//
//  Created by mm on 17/3/17.
//  Copyright © 2017年 mm. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+KJInputHandler.h"
#import "UITextField+KJInputHandler.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *testTextView;
@property (weak, nonatomic) IBOutlet UITextField *testTextFiled;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testTextView.inputRule = Input_Only_ChineseEnglish;
    self.testTextView.inputMaxLength = 10;
    self.testTextView.textChangeBlock = ^(UITextView *textView){
        NSLog(@"texview -- %@",textView.text);
    };
    
    self.testTextFiled.inputRule = Input_Only_ChineseEnglish;
    self.testTextFiled.inputMaxLength = 10;
    self.testTextFiled.textChangeBlock = ^(UITextField *textFiled){
        NSLog(@"textField -- %@",textFiled.text);
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
