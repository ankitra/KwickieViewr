//
//  KwickieModel+Private.h
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import "KwickieModel.h"

@interface KwickieModel()
{
    NSDictionary * kwickieInfo;
}

/**
 Private init for only network manager and unit testing
 */
-(instancetype) initWithDictionary:(NSDictionary *)info;

@end

