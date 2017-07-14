//
//  ViewController.m
//  Task_vijay
//
//  Created by codefrux on 22/03/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "RegisterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ [self email1]setDelegate:self];
    [[self password1]setDelegate:self];
    self.email1.text=@"";
    self.password1.text=@"";
    self.navigationController.navigationBarHidden=YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    if([_email1.text isEqualToString:@""] || [_password1.text isEqualToString:@""]) {
        
        
        
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Oops" message:@"You missed something, please check your details and try again." preferredStyle:UIAlertControllerStyleAlert];
        
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
    
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"(email=%@) && (password=%@)",_email1.text,_password1.text];
    [request setPredicate:predicate];
    NSManagedObject *matches=nil;
    
    NSError *error;
    NSArray *matchingdata=[context executeFetchRequest:request error:&error];
    if([matchingdata count]==0)
    {
        
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"User not found" message:@"Please Register First" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alert];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else {
        matches =matchingdata[0];
        _email1.text=[matches valueForKey:@"email"];
        _password1.text=[matches valueForKey:@"password"];
        NSLog(@"%@",matchingdata);
        
        UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc=[story instantiateViewControllerWithIdentifier:@"first"];
        [self presentViewController:vc animated:true completion:nil];
        
        
    }

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}


@end
