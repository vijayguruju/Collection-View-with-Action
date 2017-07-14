//
//  RegisterViewController.m
//  vijay
//
//  Created by Codefrux on 21/03/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import "RegisterViewController.h"
#import "AppDelegate.h"

@interface RegisterViewController ()
{
    NSManagedObjectContext *context;
}

@end

@implementation RegisterViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [ [self name]setDelegate:self];
    [[self email]setDelegate:self];
    [[self password]setDelegate:self];
    [[self retypepassword]setDelegate:self];
    self.navigationController.navigationBarHidden=NO;

    
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    context =[appdelegate managedObjectContext];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submit:(id)sender {
    if([_name.text isEqualToString:@""]||[_email.text isEqualToString:@""]||[_password.text isEqualToString:@""]||[_retypepassword.text isEqualToString:@""])
        
    {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Error" message:@"Please fill all the fields" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if ([_password.text isEqualToString:_retypepassword.text])
        
    {
        NSLog(@"passwords match");
        
    }
    
    
    
    else{
        
        NSLog(@"password don't match");
        
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Error" message:@"Your entered passwords don't match" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alert =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alert];
        [self presentViewController:alertController animated:YES completion:nil];
        
        
    }

    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Details" inManagedObjectContext:context];
    NSManagedObject *newuser=[[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:context];
    [newuser setValue:self.name.text forKey:@"name"];
    [newuser setValue:self.email.text forKey:@"email"];
    [newuser setValue:self.password.text forKey:@"password"];
    [newuser setValue:self.retypepassword.text forKey:@"retypepassword"];
    
    NSError *error;
    [context save:&error];
    
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Success" message:@"You have registered successfully" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
   }
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}


@end
