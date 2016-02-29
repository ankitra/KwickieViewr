//
//  KwickieModel.m
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import "KwickieModel+Private.h"




@implementation KwickieModel

-(instancetype) init
{
    @throw [NSException exceptionWithName:NSInvocationOperationCancelledException reason:@"Can not create instance directly" userInfo:nil];
}

-(instancetype) initWithDictionary:(NSDictionary *)info
{
    self = [super init];
    
    if(self)
        kwickieInfo = info;
    
    return self;
}

-(NSUInteger) totalKwikies
{
    return [(NSArray *)kwickieInfo[@"data"] count];
}

-(NSString *) askerFullNameForKwickie:(NSInteger) i
{
    if( i >=  ((NSArray *)kwickieInfo[@"data"]).count)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:nil userInfo:nil];
    
    NSString * firstName = [(((NSArray *)kwickieInfo[@"data"] )[i]) valueForKeyPath:@"questionUser.firstName"];
    NSString * lastName = [(((NSArray *)kwickieInfo[@"data"] )[i]) valueForKeyPath:@"questionUser.lastName"];
    
    return [NSString stringWithFormat:@"%@%@%@",firstName?firstName:@"",firstName&&lastName?@" ":@"",lastName?lastName:@""];
}

-(NSString *) replierFullNameForKwickie:(NSInteger) i
{
    if( i >=  ((NSArray *)kwickieInfo[@"data"]).count)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:nil userInfo:nil];
    
    NSString * firstName = [(((NSArray *)kwickieInfo[@"data"] )[i]) valueForKeyPath:@"answerUser.firstName"];
    NSString * lastName = [(((NSArray *)kwickieInfo[@"data"] )[i]) valueForKeyPath:@"answerUser.lastName"];
    
    return [NSString stringWithFormat:@"%@%@%@",firstName?firstName:@"",firstName&&lastName?@" ":@"",lastName?lastName:@""];
}


-(NSString *) askerPicture:(NSInteger) i
{
    if( i >=  ((NSArray *)kwickieInfo[@"data"]).count)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:nil userInfo:nil];

    return [(((NSArray *)kwickieInfo[@"data"] )[i]) valueForKeyPath:@"questionUser.profilePicturePath"];
}

-(NSString *) replierPicture:(NSInteger) i
{
    if( i >=  ((NSArray *)kwickieInfo[@"data"]).count)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:nil userInfo:nil];
    
    return [(((NSArray *)kwickieInfo[@"data"] )[i]) valueForKeyPath:@"answerUser.profilePicturePath"];
}

-(NSString *) videoPicture:(NSInteger) i
{
    
    if( i >=  ((NSArray *)kwickieInfo[@"data"]).count)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:nil userInfo:nil];
    
    return [(((NSArray *)kwickieInfo[@"data"] )[i]) valueForKeyPath:@"kwickieVideo.thumbUrl"];

}

-(NSString *) videoURLHLS:(NSInteger) i
{
    if( i >=  ((NSArray *)kwickieInfo[@"data"]).count)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:nil userInfo:nil];
    
    return [(((NSArray *)kwickieInfo[@"data"] )[i]) valueForKeyPath:@"kwickieVideo.playlistUrl"];
}

@end
