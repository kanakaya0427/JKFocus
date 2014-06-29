//
//  SyousaiViewController.h
//  hearn
//
//  Created by 梶原 一葉 on 5/6/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchCompanyViewController.h"

@interface SyousaiViewController : UIViewController{
    IBOutlet UILabel *kigyouLabel;
    IBOutlet UILabel *nitteiLabel;
    IBOutlet UILabel *basyoLabel;
    IBOutlet UILabel *ninzuLabel;
    
}

//別のクラスから参照したい変数をpropertyに宣言しておく
@property NSString *kigyou;
@property NSString *nittei;
@property NSString *basyo;
@property NSString *ninzu;




@end
