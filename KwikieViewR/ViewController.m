//
//  ViewController.m
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "KVRMainTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.spinner startAnimating];
    self.spinner.hidesWhenStopped = YES;

    
    if([[NetworkManager sharedInstance] getKwickieModel] == nil)
        [[NetworkManager sharedInstance] loadKwickieModel:
        
         ^(KwickieModel * model, NSError * error) {
            
             [self.spinner stopAnimating];
             [self performSegueWithIdentifier:@"GotoMainScreen" sender:nil];
             
         }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
