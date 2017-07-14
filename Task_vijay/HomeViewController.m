//
//  HomeViewController.m
//  Task_vijay
//
//  Created by codefrux on 22/03/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import "HomeViewController.h"
#import "CollectionViewCell.h"

@interface HomeViewController ()
{
    NSArray *arrayimg;
    NSArray *arraylb;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self mycollectionview]setDataSource:self];
    [[self mycollectionview]setDelegate:self];
    arrayimg=[[NSArray alloc]initWithObjects:@"10.jpg",@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"6.jpg",@"8.jpg",@"9.jpg", nil];
    arraylb=[[NSArray alloc]initWithObjects:@"About Us",@"Curriculum",@"Our Centers",@"Nearby Centers",@"Events",@"Live Feed",@"Notices",@"Jumpy Juveria", nil];
    
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arraylb count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellidentifier=@"cell";
    CollectionViewCell *Cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellidentifier forIndexPath:indexPath];
    
    

    [[Cell img]setImage:[UIImage imageNamed:[arrayimg objectAtIndex:indexPath.item]]];
    [[Cell lb]setText:[arraylb objectAtIndex:indexPath.item]];
    return  Cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"YOUR SELECTED ITEM IS"
                                                                             message:[arraylb objectAtIndex:indexPath.item]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logout:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc=[story instantiateViewControllerWithIdentifier:@"ui"];
    [self presentViewController:vc animated:true completion:nil];
    
}
@end
