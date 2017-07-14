//
//  ViewController.h
//  Task_vijay
//
//  Created by codefrux on 22/03/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *email1;
@property (strong, nonatomic) IBOutlet UITextField *password1;
- (IBAction)login:(id)sender;

@end

