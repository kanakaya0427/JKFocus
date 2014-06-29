//
//  ViewController.m
//  hearn
//
//  Created by 梶原 一葉 on 5/3/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import "ViewController.h"
#import "_ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [textField1 resignFirstResponder];
    [textField2 resignFirstResponder];
    [textField3 resignFirstResponder];

    
    self->textField1.delegate = self;
    self->textField2.delegate = self;
    self->textField3.delegate = self;
    
    date.datePickerMode = UIDatePickerModeDateAndTime;
}

-(void)viewDidLayoutSubviews
{
    CGRect frame = CGRectMake(datebox.frame.origin.x,
                              datebox.frame.origin.y +datebox.frame.size.height,
                              datebox.frame.size.width,
                              datebox.frame.size.height);
    datebox.frame=frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    retStr=textField1.text;  //テキストを受け取って
    NSLog(retStr);  //コンソールに表示
    retStr=textField2.text;
    retStr=textField3.text;
    
    //「resignFirstResponder」はユーザーのアクションに対して
    //最初に応答するオブジェクトを放棄するという命令なので
    //「tf」が放棄されて、キーボードも消えます
    [textField1 resignFirstResponder];
    [textField2 resignFirstResponder];
    [textField3 resignFirstResponder];
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

-(IBAction)jikan:(id)sender{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect frame = CGRectMake(datebox.frame.origin.x,
                                                   datebox.frame.origin.y -datebox.frame.size.height,
                                                   datebox.frame.size.width,
                                                   datebox.frame.size.height);
                         datebox.frame=frame;
                     }];
}
-(IBAction)tojiru:(id)sender{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         CGRect frame = CGRectMake(datebox.frame.origin.x,
                                                  datebox.frame.origin.y +datebox.frame.size.height,
                                                  datebox.frame.size.width,
                                                  datebox.frame.size.height);
                         datebox.frame=frame;
                     }];
}


-(IBAction)onDate:(id)sender{
    
    NSDateFormatter *df =[[NSDateFormatter alloc]init];
    df.dateFormat = @"MM月dd日　HH時mm分";
    
    [textField4 setTitle:[df stringFromDate:date.date] forState:UIControlStateNormal];
    
}

//-(IBAction)send:(id)sender
//{
//    NSURL *URL = [NSURL URLWithString:@"http://hearn.herokuapp.com/letters.json"];
//    R9HTTPRequest *request = [[R9HTTPRequest alloc] initWithURL:URL];
//    [request setHTTPMethod:@"POST"];
//    
//    [request addBody:textField1.text forKey:@"letter[visit_location]"];
//    [request addBody:textField3.text forKey:@"letter[visit_count]"];
//    
//    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
//        NSLog(@"%@", responseString);
//    }];
//    [request startRequest];
//    
//    
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    _ViewController *secondViewController = [segue destinationViewController];
    secondViewController.nittei = textField4.titleLabel.text;
    secondViewController.place = textField1.text;
    secondViewController.people = textField3.text;
}

- (IBAction)goNext
{
    //画面遷移
    if ([textField3.text length] < 1) {
        //アラート
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"未入力" message:@"入力されていません。" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{
        _ViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
        secondViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:secondViewController animated:YES completion:nil];

    }
}






@end
