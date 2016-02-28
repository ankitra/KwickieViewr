//
//  NetworkManager.h
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KwickieModel.h"

typedef void(^KwickieInfoBlock)(KwickieModel * model, NSError * error);
typedef void(^NMImageBlock)(UIImage * image, NSError * error);


@interface NetworkManager : NSObject
{
    NSOperationQueue * opQueue;
    NSDictionary * kwickieInfo;
}

/**
 Shared instance of network manager
 */
+(instancetype) sharedInstance;


/**
 Loads image from the network
 */
-(void) loadImage: (NSString *)url AndCall:(NMImageBlock) block;

/**
 Returns model if it was already loaded
 @return Model
 */
-(KwickieModel *) getKwickieModel;

/**
 Reloads model and calls back in block
 */
-(void) loadKwickieModel:(KwickieInfoBlock) block;


@end
