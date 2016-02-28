//
//  KVRTableViewCell.h
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVRTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *askerImage;
@property (weak, nonatomic) IBOutlet UIImageView *replierImage;
@property (weak, nonatomic) IBOutlet UILabel *askerName;
@property (weak, nonatomic) IBOutlet UILabel *replierName;
@property (weak, nonatomic) IBOutlet UIImageView *videoThumb;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *askerProgress;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *replierProgress;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *thumbnailProgress;

@end
