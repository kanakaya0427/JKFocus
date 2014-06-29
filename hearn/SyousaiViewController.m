//
//  SyousaiViewController.m
//  hearn
//
//  Created by 梶原 一葉 on 5/6/14.
//  Copyright (c) 2014 梶原 一葉. All rights reserved.
//

#import "SyousaiViewController.h"

@interface SyousaiViewController ()

@end

@implementation SyousaiViewController{
    NSString *sendString;
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
    // Do any additional setup after loading the view.
    
    kigyouLabel.text = self.kigyou ;
    basyoLabel.text = self.basyo ;
    nitteiLabel.text = self.nittei;
    ninzuLabel.text = self.ninzu;
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



@end
