//
//  TopViewController.m
//  hearn
//
//  Created by 梶原 一葉 on 5/4/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import "TopViewController.h"
#import "R9HTTPRequest.h"
#import "YoukosoViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self loadCompany];
	
    [self performSelector:@selector(xpositionChanged:) withObject:nil afterDelay:2.0];
    
    bun1.alpha = 0.0;
    bun2.alpha = 0.0;
    
}

//- (void)loadCompany
//{
//    NSURL *URL = [NSURL URLWithString:@"http://hearn.herokuapp.com/letters.json"];
//    R9HTTPRequest *request = [[R9HTTPRequest alloc] initWithURL:URL];
//    // リクエスト結果の受け取り
//    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
//        NSError *error=nil;
//        NSData *data = [responseString dataUsingEncoding:NSUnicodeStringEncoding];
//        NSArray *companies = [NSJSONSerialization JSONObjectWithData:data
//                                                        options:NSJSONReadingAllowFragments
//                                                          error:&error];
//        for (NSDictionary *obj in companies)
//        {
//            NSString *company_name = [obj objectForKey:@"company_name"];
//            NSString *visit_location = [obj objectForKey:@"visit_location"];
//            NSString *visit_at = [obj objectForKey:@"visit_at"];
//            NSString *visit_count = [obj objectForKey:@"visit_count"];
//            NSString *company_tel = [obj objectForKey:@"company_tel"];
//            NSString *company_mail = [obj objectForKey:@"company_mail"];
//            NSString *company_manager = [obj objectForKey:@"company_manager"];
//            NSString *company_address = [obj objectForKey:@"company_address"];
//            NSString *company_url = [obj objectForKey:@"company_url"];
//            
//            NSLog(@"name:%@, location:%@", company_name, visit_location);
//        }
//    }];
//    [request startRequest];
//}

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


-(void)xpositionChanged:(id)sender{
    
    
    [UIView
     //アニメーションの時間を秒単位で指定
     animateWithDuration:1.0
     //アニメーション内容を記述
     animations:^{
         //ロゴの移動先の位置を指定
         rogo.frame = CGRectMake(-135, 143, 577, 195);
     }
     ];
    
    [self performSelector:@selector(fadeInAnimation:) withObject:nil afterDelay:1.0];

}


-(void)fadeInAnimation:(id)sender{
    
    //アニメーションを指定
    [UIImageView
     //アニメーションの時間を秒単位で指定
     animateWithDuration:2.0
     //アニメーション開始までの時間を秒単位で指定
     delay: 0.0
     //アニメーションの推移速度カーブの指定
     options: UIViewAnimationOptionCurveEaseIn
     //アニメーションで変化させるプロパティ値を指定
     animations:^{
         bun1.alpha = 1.0;
     }
     //アニメーションが終了したときに実行されるコードを記述
     completion:^(BOOL finished){
         //フェードインのアニメーションを指定
         nil;
     }];
    
     [self performSelector:@selector(fadeInAnimation2:) withObject:nil afterDelay:1.0];
}
//丸ボタンが押されたときにコールされるメソッド
-(void)fadeInAnimation2:(id)sender{
    
    //フェードインのアニメーションを指定
    [UIImageView
     //アニメーションの時間を秒単位で指定
     animateWithDuration:2.0
     //アニメーション開始までの時間を秒単位で指定
     delay: 0.0
     //アニメーションの推移速度カーブの指定
     options: UIViewAnimationOptionCurveEaseIn
     //アニメーションで変化させるプロパティ値を指定
     animations:^{
         bun2.alpha = 1.0;
     }
     //アニメーションが終了したときに実行されるコードを記述
     completion:^(BOOL finished){
         nil;
//        [self performSelector:@selector(anime) withObject:nil afterDelay:3.0];
     }];
    
    
}


//- (IBAction)registeredButton:(id)sender {
//    YoukosoViewController *mycontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"Youkoso"];
//    [self presentViewController:mycontroller animated:YES completion:nil];
//}




@end
