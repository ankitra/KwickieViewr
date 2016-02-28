//
//  NetworkManager.m
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import "NetworkManager.h"
#import "KwickieModel+Private.h"

@implementation NetworkManager

+(instancetype) sharedInstance
{
    static NetworkManager * nm;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nm = [[self alloc] init];
    });
    
    return nm;
}

-(instancetype) init
{
    self = [super init];
    
    if(self)
    {
        opQueue = [[NSOperationQueue alloc] init];
        //4 Parallel connections at a time
        opQueue.maxConcurrentOperationCount = 4;
        kwickieInfo = nil;
    }
    
    return self;
}

-(void) loadImage: (NSString *)url AndCall:(NMImageBlock) block
{
    [opQueue addOperation:
     [NSBlockOperation blockOperationWithBlock:^(){
       
        NSLog(@"Loading %@",url);
        NSURL * link = [NSURL URLWithString:url];
        NSData * data;
        UIImage * img;
        NSError * error;
        
        if(link)
           data = [NSData dataWithContentsOfURL:link];
        else
        {
            error = [NSError errorWithDomain:@"NetworkManager" code:0x02
                                    userInfo:@{
                                               NSLocalizedDescriptionKey : @"Invalid link"
                                                }];
            [self returnImage:nil OnMainQueueInto:block AndError:error];
            return;
        }
        
        
        if(data)
            img =  [UIImage imageWithData: data];
        else
        {
            error = [NSError errorWithDomain:@"NetworkManager" code:0x1 userInfo:@{
                                                                                   NSLocalizedDescriptionKey : @"Cannot load data from server"
                                                                                   }];
            [self returnImage:nil OnMainQueueInto:block AndError:error];
            return;
        }
        
        if(img)
            [self returnImage:img OnMainQueueInto:block AndError:nil];
        else
        {
            error = [NSError errorWithDomain:@"NetworkManager" code:0x03 userInfo:@{
                                                                                   NSLocalizedDescriptionKey : @"Cannot prepare image from server data"
                                                                                   }];
            [self returnImage:nil OnMainQueueInto:block AndError:error];
            return;
        }
        
        NSLog(@"Loaded %@",url);
        
    }]];
}

/**
 Returns model if it was already loaded
 @return Model
 */

-(KwickieModel *) getKwickieModel
{
    if(kwickieInfo)
        return  [[KwickieModel alloc] initWithDictionary:kwickieInfo];
    
    return nil;
}


/**
 Reloads model and calls back in block
 */
-(void) loadKwickieModel:(KwickieInfoBlock) block
{
    [opQueue addOperation:
     [NSBlockOperation blockOperationWithBlock:^(){
        
        NSData * data;
        
        
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://bigdev.kwickie.com/api/kwickies/featured"]];
        
        
        while(!data)
        {
            NSLog(@"Data loading failed, retrying");
            [NSThread sleepForTimeInterval:5.0];
            data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://bigdev.kwickie.com/api/kwickies/featured"]];
        }
        
        
        NSError * error = nil;
        
        NSArray * array = nil;

        if(data)
            array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        else
            error = [NSError errorWithDomain:@"NetworkManager" code:0x1 userInfo:@{
                                                                                   NSLocalizedDescriptionKey : @"Cannot load data from server"
                                                                                   }];
        
        if(array)
            kwickieInfo = @{ @"data" : array } ;
        
        [self returnKwickieModeOnMainQueue:block AndError:error];
        
    }]];
}

-(void) returnKwickieModeOnMainQueue:(KwickieInfoBlock) block AndError:(NSError *) error
{
    [[NSOperationQueue mainQueue] addOperation:[NSBlockOperation
                                                blockOperationWithBlock:
                                                ^(){
                                                    if(kwickieInfo)
                                                        
                                                        block(
                                                              [[KwickieModel alloc] initWithDictionary:kwickieInfo
                                                               ],error);
                                                    else
                                                        block(nil,error);
                                                    
                                                }]
     ];

}

-(void) returnImage:(UIImage *) image OnMainQueueInto:(NMImageBlock) block AndError:(NSError *) error
{
    [[NSOperationQueue mainQueue] addOperation:[NSBlockOperation
                                                blockOperationWithBlock:
                                                ^(){
                                                        block(image,error);
                                                }]
     ];
    
}


@end
