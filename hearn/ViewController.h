//
//  ViewController.h
//  hearn
//
//  Created by 梶原 一葉 on 5/3/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "R9HTTPRequest.h"

@interface ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>{
    
    IBOutlet UITextField *textField1;
    IBOutlet UITextField *textField2;
    IBOutlet UITextField *textField3;
    IBOutlet UIButton *textField4;
    
    IBOutlet UIView *datebox;
    IBOutlet UIDatePicker *date;
}





@end
