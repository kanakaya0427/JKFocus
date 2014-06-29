//
//  2ViewController.h
//  hearn
//
//  Created by 梶原 一葉 on 5/4/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _ViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
{
    
    IBOutlet UITextField*textField4;
    IBOutlet UITextField*textField5;
    IBOutlet UITextField*textField6;
    IBOutlet UITextField*textField7;
    IBOutlet UITextField*textField8;
    
    IBOutlet UITextView*textview;
    
}


@property (nonatomic, copy) NSString *nittei;
@property (nonatomic, copy) NSString *place;
@property (nonatomic, copy) NSString *people;

@end
