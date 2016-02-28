//
//  TestModel.m
//  KwikieViewR
//
//  Created by Guest Users on 28/02/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KwickieModel+Private.h"

@interface TestModel : XCTestCase
{
    KwickieModel * testModel1;

}
@end

@implementation TestModel

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSString * testJson1 = @"[{\"questionUserId\":1,\"questionVideoId\":10123,\"q_video_avail\":true,\"status\":4,\"answerUserId\":635,\"answerVideoId\":10130,\"a_video_avail\":true,\"kwickieVideoId\":10131,\"k_video_avail\":true,\"topicId\":3,\"answered\":true,\"publishDate\":\"2016-02-16T00:50:54.000Z\",\"seen\":false,\"featured\":1,\"id\":6746,\"questionUser\":{\"dtype\":\"\",\"firstName\":\"Arash\",\"lastName\":\"Daneshvar\",\"token\":null,\"profilePicturePath\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/1.png\",\"statusText\":null,\"bioText\":null,\"statusSetDate\":null,\"mixpanelId\":null,\"jobTitle\":null,\"coverImage\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/1.png\",\"celebVerified\":false,\"autogenerated\":false,\"featured\":12,\"realm\":null,\"username\":\"arash\",\"credentials\":null,\"challenges\":null,\"email\":\"arash.daneshvar@guvera.com\",\"emailVerified\":true,\"status\":null,\"created\":\"2016-01-01T00:00:00.000Z\",\"lastUpdated\":\"2016-02-26T05:51:22.000Z\",\"id\":1},\"kwickieVideo\":{\"processId\":\"10131\",\"name\":null,\"accountId\":0,\"complete\":1,\"still\":0,\"description\":null,\"duration\":0,\"createdAt\":\"2016-02-16T00:50:37.000Z\",\"lowQualityUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10131_low.mp4\",\"highQualityUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10131.mp4\",\"playlistUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10131_part.m3u8\",\"processPlaylistUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10131_part.m3u8\",\"thumbWidth\":640,\"thumbHeight\":360,\"thumbUrl\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/10131_circle_thumb.png\",\"posterUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10131.jpg\",\"alertThumbUrl\":null,\"alertThumbWidth\":0,\"alertThumbHeight\":0,\"id\":10131},\"answerUser\":{\"dtype\":null,\"firstName\":\"Emily\",\"lastName\":\"Skye\",\"token\":null,\"profilePicturePath\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/635.png\",\"statusText\":null,\"bioText\":null,\"statusSetDate\":null,\"mixpanelId\":\"95235A51-30D4-412B-A786-29D9F404B2B2\",\"jobTitle\":null,\"coverImage\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/635.png\",\"celebVerified\":false,\"autogenerated\":false,\"featured\":1,\"realm\":null,\"username\":null,\"credentials\":null,\"challenges\":null,\"email\":\"emily.skye@kwickie.com\",\"emailVerified\":null,\"status\":null,\"created\":\"2016-01-01T00:00:00.000Z\",\"lastUpdated\":\"2016-02-16T02:12:59.000Z\",\"id\":635},\"topics\":{\"text\":\"Look good and feel great this summer\",\"description\":\"Test Description\",\"image\":\"https://www.guvera.com/d1/images/users/9777409/9777409_profile1448867087.jpg\",\"startDate\":\"2015-10-01T00:00:00.000Z\",\"endDate\":\"2016-02-24T00:00:00.000Z\",\"brandId\":3,\"questionAutoApproved\":true,\"answerAutoApproved\":true,\"featured\":6,\"default\":false,\"closed\":false,\"id\":3,\"isClosed\":true,\"brands\":{\"name\":\"KwickieApp\",\"logo\":\"https://www.guvera.com/d1/images/users/9777409/9777409_profile1448864734.png\",\"url\":\"https://kwickie.com\",\"color\":\"#f3862d\",\"id\":3},\"members\":[{\"dtype\":null,\"firstName\":\"Emily\",\"lastName\":\"Skye\",\"token\":null,\"profilePicturePath\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/635.png\",\"statusText\":null,\"bioText\":null,\"statusSetDate\":null,\"mixpanelId\":\"95235A51-30D4-412B-A786-29D9F404B2B2\",\"jobTitle\":null,\"coverImage\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/635.png\",\"celebVerified\":false,\"autogenerated\":false,\"featured\":1,\"realm\":null,\"username\":null,\"credentials\":null,\"challenges\":null,\"email\":\"emily.skye@kwickie.com\",\"emailVerified\":null,\"status\":null,\"created\":\"2016-01-01T00:00:00.000Z\",\"lastUpdated\":\"2016-02-16T02:12:59.000Z\",\"id\":635}]}},{\"questionUserId\":1,\"questionVideoId\":10124,\"q_video_avail\":true,\"status\":4,\"answerUserId\":635,\"answerVideoId\":10133,\"a_video_avail\":true,\"kwickieVideoId\":10134,\"k_video_avail\":true,\"topicId\":4608558,\"answered\":true,\"publishDate\":\"2016-02-16T00:52:44.000Z\",\"seen\":false,\"featured\":2,\"id\":6747,\"questionUser\":{\"dtype\":\"\",\"firstName\":\"Arash\",\"lastName\":\"Daneshvar\",\"token\":null,\"profilePicturePath\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/1.png\",\"statusText\":null,\"bioText\":null,\"statusSetDate\":null,\"mixpanelId\":null,\"jobTitle\":null,\"coverImage\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/1.png\",\"celebVerified\":false,\"autogenerated\":false,\"featured\":12,\"realm\":null,\"username\":\"arash\",\"credentials\":null,\"challenges\":null,\"email\":\"arash.daneshvar@guvera.com\",\"emailVerified\":true,\"status\":null,\"created\":\"2016-01-01T00:00:00.000Z\",\"lastUpdated\":\"2016-02-26T05:51:22.000Z\",\"id\":1},\"kwickieVideo\":{\"processId\":\"10134\",\"name\":null,\"accountId\":0,\"complete\":1,\"still\":0,\"description\":null,\"duration\":0,\"createdAt\":\"2016-02-16T00:52:15.000Z\",\"lowQualityUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10134_low.mp4\",\"highQualityUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10134.mp4\",\"playlistUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10134_part.m3u8\",\"processPlaylistUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10134_part.m3u8\",\"thumbWidth\":640,\"thumbHeight\":360,\"thumbUrl\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/10134_circle_thumb.png\",\"posterUrl\":\"http://d12b7ev0vur5ia.cloudfront.net/10134.jpg\",\"alertThumbUrl\":null,\"alertThumbWidth\":0,\"alertThumbHeight\":0,\"id\":10134},\"answerUser\":{\"dtype\":null,\"firstName\":\"Emily\",\"lastName\":\"Skye\",\"token\":null,\"profilePicturePath\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/635.png\",\"statusText\":null,\"bioText\":null,\"statusSetDate\":null,\"mixpanelId\":\"95235A51-30D4-412B-A786-29D9F404B2B2\",\"jobTitle\":null,\"coverImage\":\"http://kwickie-upload-bigdev.s3.amazonaws.com/635.png\",\"celebVerified\":false,\"autogenerated\":false,\"featured\":1,\"realm\":null,\"username\":null,\"credentials\":null,\"challenges\":null,\"email\":\"emily.skye@kwickie.com\",\"emailVerified\":null,\"status\":null,\"created\":\"2016-01-01T00:00:00.000Z\",\"lastUpdated\":\"2016-02-16T02:12:59.000Z\",\"id\":635}}]\n";
    NSArray * a = [NSJSONSerialization JSONObjectWithData:[testJson1 dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    testModel1 = [[KwickieModel alloc] initWithDictionary:@{ @"data" : a}];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAskerName {
    
    XCTAssert([[testModel1 askerFullNameForKwickie:0] isEqualToString:@"Arash Daneshvar"]);

    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void) testReplierName {
    XCTAssert([[testModel1 replierFullNameForKwickie:1] isEqualToString:@"Emily Skye"]);

}

-(void)testAskerPicture
{
    XCTAssert([[testModel1 askerPicture:0] isEqualToString:@"http://kwickie-upload-bigdev.s3.amazonaws.com/1.png"]);
}

-(void)testReplierPicture
{
    XCTAssert([[testModel1 replierPicture:1] isEqualToString:@"http://kwickie-upload-bigdev.s3.amazonaws.com/635.png"]);
}

-(void)testVideoPicture
{
    XCTAssert([[testModel1 videoPicture:0] isEqualToString:@"http://kwickie-upload-bigdev.s3.amazonaws.com/10131_circle_thumb.png"]);
}

-(void)testVideoURL
{
    XCTAssert([[testModel1 videoURLHLS:0] isEqualToString:@"http://d12b7ev0vur5ia.cloudfront.net/10131_part.m3u8"]);
}

-(void)testOutofRangeKwikie
{
    BOOL flag = YES;
    
    @try {
        [testModel1 videoPicture:4];
        flag = NO;

    }
    @catch (NSException *exception) {
        
    }
    @finally {
        XCTAssert(flag);
    }
}

@end