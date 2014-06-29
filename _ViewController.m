//
//  2ViewController.m
//  hearn
//
//  Created by 梶原 一葉 on 5/4/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import "_ViewController.h"
#import "R9HTTPRequest.h"

@interface _ViewController ()

@end

@implementation _ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@synthesize nittei;
@synthesize place;
@synthesize people;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [textField4 resignFirstResponder];
    [textField5 resignFirstResponder];
    [textField6 resignFirstResponder];
    [textField7 resignFirstResponder];
    [textField8 resignFirstResponder];
    [textview resignFirstResponder];
    
    textField4.delegate = self;
    textField5.delegate = self;
    textField6.delegate = self;
    textField7.delegate = self;
    textField8.delegate = self;
    textview.delegate = self;
    
    NSLog(@"日程は...%@", self.nittei);
    NSLog(@"場所は...%@", self.place);
    NSLog(@"人数は...%@", self.people);
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//UITextFieldのデリゲートメソッドを追加
//イベントが発生した場合に呼ばれます

//テキストフィールドを編集する直前に呼び出されます
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    return YES;  //これをNOにすると、キーボードが出ません
}


//テキストフィールドを編集する直後に呼び出されます
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}


//Returnボタンがタップされた時に呼び出されます
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *retStr;
    retStr=textField4.text;  //テキストを受け取って
    retStr=textField5.text;
    retStr=textField6.text;
    retStr=textField7.text;
    retStr=textField8.text;
    retStr=textview.text;
    
    //「resignFirstResponder」はユーザーのアクションに対して
    //最初に応答するオブジェクトを放棄するという命令なので
    //「tf」が放棄されて、キーボードも消えます
    [textField4 resignFirstResponder];
    [textField5 resignFirstResponder];
    [textField6 resignFirstResponder];
    [textField7 resignFirstResponder];
    [textField8 resignFirstResponder];
    [textview resignFirstResponder];
    return YES;
}


//テキストフィールドの編集が終了する直前に呼び出されます
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    return YES;  //これをNOにすると、キーボードが消えません
}


//テキストフィールドの編集が終了する直後に呼び出されます
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
}

-(IBAction)send:(id)sender
{
    NSURL *URL = [NSURL URLWithString:@"http://hearn.herokuapp.com/letters.json"];
    R9HTTPRequest *request = [[R9HTTPRequest alloc] initWithURL:URL];
    [request setHTTPMethod:@"POST"];
    [request addBody:nittei forKey:@"letter[visit_at]"];
    [request addBody:place forKey:@"letter[visit_location]"];
    [request addBody:people forKey:@"letter[count]"];
    
    [request addBody:textField4.text forKey:@"letter[company_name]"];
    [request addBody:textField5.text forKey:@"letter[company_tel]"];
    [request addBody:textField6.text forKey:@"letter[company_mail]"];
    [request addBody:textField7.text forKey:@"letter[company_url]"];
    [request addBody:textField8.text forKey:@"letter[company_manager]"];
    [request addBody:textview.text forKey:@"letter[company_address]"];
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        NSLog(@"%@", responseString);
    }];
    [request startRequest];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // ここにtextデータの処理
    // キーボードを閉じる
    [self->textview resignFirstResponder];
}


@end
