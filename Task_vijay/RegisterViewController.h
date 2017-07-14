//
//  RegisterViewController.h
//  vijay
//
//  Created by Codefrux on 21/03/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Details.h"

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *retypepassword;
- (IBAction)submit:(id)sender;

@end
