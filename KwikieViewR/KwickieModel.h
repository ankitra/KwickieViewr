//
//  KwickieModel.h
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KwickieModel : NSObject

-(NSUInteger) totalKwikies;

-(NSString *) askerFullNameForKwickie:(NSInteger) i;
-(NSString *) replierFullNameForKwickie:(NSInteger) i;
-(NSString *) askerPicture:(NSInteger) i;
-(NSString *) replierPicture:(NSInteger) i;
-(NSString *) videoPicture:(NSInteger) i;
-(NSString *) videoURLHLS:(NSInteger) i;



@end
