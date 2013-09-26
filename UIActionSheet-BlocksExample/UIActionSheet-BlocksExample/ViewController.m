//
//  ViewController.m
//  UIActionSheet-BlocksExample
//
//  Created by Shai Mishali on 9/26/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Set up some buttons
    self.view.backgroundColor   = [UIColor grayColor];
    
    UIButton *btnSimple         = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    btnSimple.tag               = 20;
    btnSimple.frame             = CGRectMake(60, 100, 200, 45);
    [btnSimple setTitle:@"Simple UIActionSheet" forState:UIControlStateNormal];
    [btnSimple addTarget:self action:@selector(showIt:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnFull           = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    btnFull.tag                 = 21;
    btnFull.frame               = CGRectMake(60, 200, 200, 45);
    [btnFull setTitle:@"Full UIActionSheet" forState:UIControlStateNormal];
    [btnFull addTarget:self action:@selector(showIt:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: btnSimple];
    [self.view addSubview: btnFull];
}

-(void)showIt:(UIButton *)sender{
    if(sender.tag == 20){
        // Simple UIActionSheet
        [UIActionSheet presentOnView:self.view
                           withTitle:@"Select Picture"
                        otherButtons:@[@"Camera Roll", @"Take a Picture"]
                            onCancel:^(UIActionSheet *actionSheet) {
                                NSLog(@"Touched cancel button");
                            }
                     onClickedButton:^(UIActionSheet *actionSheet, NSUInteger index) {
                         NSLog(@"Selected button at index %d", index);
                     }];
    }else if(sender.tag == 21){
        // Full UIActionSheet
        [UIActionSheet presentOnView:self.view
                           withTitle:@"John - 555-1212"
                        cancelButton:@"Dismiss"
                   destructiveButton:@"Delete Contact"
                        otherButtons:@[@"Call Contact",@"Message Contact"]
                            onCancel:^(UIActionSheet *actionSheet) {
                                NSLog(@"Touched cancel button");
                            }
                       onDestructive:^(UIActionSheet *actionSheet) {
                           NSLog(@"Touched destructive button");
                       }
                     onClickedButton:^(UIActionSheet *actionSheet, NSUInteger index) {
                         NSLog(@"Selected button at index %d", index);
                     }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
