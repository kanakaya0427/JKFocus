//
//  SearchCompanyViewController.h
//  hearn
//
//  Created by 梶原 一葉 on 5/5/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SyousaiViewController.h"


@interface SearchCompanyViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *table;//テーブルビュー
    
    NSMutableArray *contentArray;
}

@end