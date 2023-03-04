//
//  Model.h
//  B
//
//  Created by 申明达 on 2023/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *hint;
@property(nonatomic,copy)NSString *pic;
+(void)getDataWithSuccess:(void(^)(NSArray *array))success
                  Failure:(void(^)(void))failure;

+(instancetype)DataWithDict:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END
