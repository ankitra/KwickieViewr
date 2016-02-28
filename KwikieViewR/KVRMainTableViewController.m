//
//  KVRMainTableViewController.m
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import "KVRMainTableViewController.h"
#import "NetworkManager.h"
#import "KVRTableViewCell.h"
#import "KVRPlayerViewController.h"

@interface KVRMainTableViewController ()
{
    KwickieModel * model;
}
@end

@implementation KVRMainTableViewController


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selected = NO;

    NSURL *videoURL = [NSURL URLWithString: [model videoURLHLS:indexPath.row]];
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = player;
    [self.navigationController presentViewController:playerViewController animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [model totalKwikies];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"KVRTableViewCell";
    
    KVRTableViewCell *cell = (KVRTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"KVRTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    [cell.askerProgress startAnimating];
    [cell.thumbnailProgress startAnimating];
    [cell.replierProgress startAnimating];
    
    cell.askerName.text = [model askerFullNameForKwickie:indexPath.row];
    cell.replierName.text = [model replierFullNameForKwickie:indexPath.row];
    
    cell.askerImage.contentMode = UIViewContentModeScaleAspectFit;
    cell.replierImage.contentMode = UIViewContentModeScaleAspectFit;
    cell.videoThumb.contentMode = UIViewContentModeScaleAspectFit;
    
    cell.askerProgress.hidesWhenStopped = YES;
    cell.thumbnailProgress.hidesWhenStopped = YES;
    cell.replierProgress.hidesWhenStopped = YES;
    
    
    [[NetworkManager sharedInstance] loadImage:[model askerPicture:indexPath.row] AndCall:^(UIImage * image, NSError * error){
        if(!error)
            cell.askerImage.image = image;
        else
            NSLog(@"Error loading : %@",error);
        [cell.askerProgress stopAnimating];
    }];

    
    [[NetworkManager sharedInstance] loadImage:[model replierPicture:indexPath.row] AndCall:^(UIImage * image, NSError * error){
        if(!error)
            cell.replierImage.image = image;
        else
            NSLog(@"Error loading : %@",error);
        [cell.replierProgress stopAnimating];
    }];

    
    [[NetworkManager sharedInstance] loadImage:[model videoPicture:indexPath.row] AndCall:^(UIImage * image, NSError * error){
        if(!error)
            cell.videoThumb.image = image;
        else
            NSLog(@"Error loading : %@",error);
        [cell.thumbnailProgress stopAnimating];
    }];

    
    return cell;

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = TRUE;
    self.mainTable.rowHeight = 100;
    model = [[NetworkManager sharedInstance] getKwickieModel];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
