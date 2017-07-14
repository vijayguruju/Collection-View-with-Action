//
//  ForgotpasswordViewController.h
//  vijay
//
//  Created by Codefrux on 21/03/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotpasswordViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailtext;
@property (strong, nonatomic) IBOutlet UILabel *plabel;
- (IBAction)Submit:(id)sender;

@end
