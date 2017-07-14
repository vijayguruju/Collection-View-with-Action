//
//  HomeViewController.h
//  Task_vijay
//
//  Created by codefrux on 22/03/17.
//  Copyright © 2017 codefrux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *mycollectionview;

- (IBAction)logout:(id)sender;

@end
