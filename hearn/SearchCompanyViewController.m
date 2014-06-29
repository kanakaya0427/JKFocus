//
//  SearchCompanyViewController.m
//  hearn
//
//  Created by 梶原 一葉 on 5/5/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import "SearchCompanyViewController.h"
#import "R9HTTPRequest.h"

@interface SearchCompanyViewController ()

@end

@implementation SearchCompanyViewController{
    NSString *sendStringKigyou;
    NSString *sendStringNittei;
    NSString *sendStringBasyo;
    NSNumber *sendStringNinzu;
}

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
    
    //データ元を自分自身に設定。
    table.delegate = self;
    table.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [self downloadData];
}

- (void)downloadData
{
    //データのロード
    NSURL *URL = [NSURL URLWithString:@"http://hearn.herokuapp.com/letters.json"];
    R9HTTPRequest *request = [[R9HTTPRequest alloc] initWithURL:URL];
    // リクエスト結果の受け取り
    [request setCompletionHandler:^(NSHTTPURLResponse *responseHeader, NSString *responseString){
        NSError *error=nil;
        NSData *data = [responseString dataUsingEncoding:NSUnicodeStringEncoding];
        NSArray *companies = [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingAllowFragments
                                                               error:&error];
        //NSLog(@"companies %@", companies);
        
        //NSLog(@"companies%@", [companies indexOfObject:@"company_name"]);
        
        contentArray = [[NSMutableArray alloc] init];
        
        for (NSMutableDictionary *obj in companies)
        {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
            // 企業名(company_name)を取り出して、company_nameをキーにしてdicに保存する
            [dic setObject:[obj objectForKey:@"visit_location"] forKey:@"visit_location"];
            [dic setObject:[obj objectForKey:@"visit_at"] forKey:@"visit_at"];
            [dic setObject:[obj objectForKey:@"visit_count"] forKey:@"visit_count"];
            [dic setObject:[obj objectForKey:@"company_mail"] forKey:@"company_mail"];
            [dic setObject:[obj objectForKey:@"company_name"] forKey:@"company_name"];
            [dic setObject:[obj objectForKey:@"company_tel"] forKey:@"company_tel"];
            [dic setObject:[obj objectForKey:@"company_manager"] forKey:@"company_maneger"];
            [dic setObject:[obj objectForKey:@"company_address"] forKey:@"company_address"];
            [dic setObject:[obj objectForKey:@"company_url"] forKey:@"company_url"];
            [dic setObject:[obj objectForKey:@"description"] forKey:@"description"];
            // TODO: 以下も、上の行みたいにコード書いた。
            
            
            // dicに企業の情報を記録したので、それを配列にいれる。そうして、複数の企業の情報を記憶する
            [contentArray addObject:dic];
            
        }
        
        // データの受信が終わったのでテーブルの再読み込み
        [table reloadData];
        
    }];
    [request startRequest];

}


#pragma mark - テーブルビュー

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //セクションの数
    return 1;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //セルの数は受信したデータの数になる
    return [contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //セルの中身
    // "cell"というkeyでcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    // cellデータが無い場合、UITableViewCellを生成して、"cell"というkeyでキャッシュする
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
        
    }
    
    
    
    UIImageView *image;
    image = (UIImageView *)[cell viewWithTag:1];
    
    UILabel *label;
    label = (UILabel *)[cell viewWithTag:2];
    
    
    //NSLog(@"name:%@", contentArray);
    
    // データがない場合はエラーになるので、それをチェックしてから、画面に表示する。
    if ( [[[contentArray objectAtIndex:indexPath.row] objectForKey:@"company_name"]    isEqual:[NSNull null] ] ) {
        label.text = @"";
    } else {
        label.text = [[contentArray objectAtIndex:indexPath.row] objectForKey:@"company_name"];
    }

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ( [[[contentArray objectAtIndex:indexPath.row] objectForKey:@"company_name"]    isEqual:[NSNull null] ] ) {
        sendStringKigyou = @"";
    } else {
        sendStringKigyou = [[contentArray objectAtIndex:indexPath.row] objectForKey:@"company_name"];
    }
    if ( [[[contentArray objectAtIndex:indexPath.row] objectForKey:@"visit_at"]    isEqual:[NSNull null] ] ) {
        sendStringNittei = @"";
    } else {
        NSString *dateString = [[contentArray objectAtIndex:indexPath.row] objectForKey:@"visit_at"];
        
//        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];

        dateString = [dateString stringByReplacingOccurrencesOfString:@"T" withString:@""] ;
        dateString = [dateString stringByReplacingOccurrencesOfString:@"-" withString:@"/"] ;
        
        NSArray *array = [dateString componentsSeparatedByString:@":"] ;
        sendStringNittei = [NSString stringWithFormat:@"%@:%@",array[0],array[1]] ;
    }
    if ( [[[contentArray objectAtIndex:indexPath.row] objectForKey:@"visit_location"]    isEqual:[NSNull null] ] ) {
        sendStringBasyo = @"";
    } else {
        sendStringBasyo = [[contentArray objectAtIndex:indexPath.row] objectForKey:@"visit_location"];
    }
    if ( [[[contentArray objectAtIndex:indexPath.row] objectForKey:@"visit_count"]    isEqual:[NSNull null] ] ) {
        sendStringNinzu = 0;
    } else {
        sendStringNinzu = [[contentArray objectAtIndex:indexPath.row] objectForKey:@"visit_count"];
    }
    
    [self performSegueWithIdentifier:@"Syousai" sender:self];
    
}

- (void)loadCompany
{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"Syousai"] ) {
        SyousaiViewController *nextViewController = [segue destinationViewController];
        //ここで遷移先ビューのクラスの変数receiveStringに値を渡している
        nextViewController.kigyou = sendStringKigyou;
        nextViewController.nittei = sendStringNittei;
        nextViewController.basyo = sendStringBasyo;
        nextViewController.ninzu =[sendStringNinzu stringValue];
    }
}


@end
