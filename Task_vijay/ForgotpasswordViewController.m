//
//  ForgotpasswordViewController.m
//  vijay
//
//  Created by Codefrux on 21/03/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import "ForgotpasswordViewController.h"
#import "AppDelegate.h"
#import <MessageUI/MessageUI.h>
#import "EasyMailSender.h"
#import "EasyMailAlertSender.h"



@interface ForgotpasswordViewController ()

@end

@implementation ForgotpasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.plabel.hidden=YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Submit:(id)sender {
    _plabel.text=@"";
    if([_emailtext.text isEqualToString:@""]) {
        
        
        
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:@"You can't left this one as empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alert];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context=[appdelegate managedObjectContext];
    context =[appdelegate managedObjectContext];
    
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Details" inManagedObjectContext:context];
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"(email=%@)",_emailtext.text];
    [request setPredicate:predicate];
    NSManagedObject *matches=nil;
    
    NSError *error;
    NSArray *matchingdata=[context executeFetchRequest:request error:&error];
    if([matchingdata count]==0)
    {
        
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"User not found for this id" message:@"Please Register First" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alert];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else {
        matches =matchingdata[0];
        _emailtext.text=[matches valueForKey:@"email"];
        self.plabel.hidden=YES;
        
        _plabel.text=[matches valueForKey:@"password"];
        _plabel.text=[NSString stringWithFormat:@"Your password is   %@",_plabel.text];
        
        NSLog(@"%@",matchingdata);
       
        
        
        NSLog(@"buttonSendEmailAction");
        NSString *attachedText = [matches valueForKey:@"password"];
        EasyMailAlertSender *mailSender = [EasyMailAlertSender easyMail:^(MFMailComposeViewController *controller) {
            // Setup
            [controller setToRecipients:@[[matches valueForKey:@"email"]]];
            [controller addAttachmentData:[attachedText dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"plain/text" fileName:@"test.txt"];
        } complete:^(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error) {
            // When Sent/Cancel - MFMailComposeViewControllerDelegate action
            [controller dismissViewControllerAnimated:YES completion:nil];
        }];
        [mailSender showFromViewController:self];
        
        

        
    }

}
@end
