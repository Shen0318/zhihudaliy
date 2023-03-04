//
//  Model.m
//  B
//
//  Created by 申明达 on 2023/3/1.
//

#import "Model.h"
#import "AFHTTPSessionManager.h"

@implementation Model

+(instancetype)DataWithDict:(NSDictionary *)dict{
    Model *model = [[Model alloc]init];
    model.title = dict[@"title"];
    model.hint = dict[@"hint"];
    if (dict[@"images"]) {
        model.pic = dict[@"images"][0];
    } else {
        model.pic = dict[@"image"];
    }
    
    return model;
}
+(void)getDataWithSuccess:(void (^)(NSArray * _Nonnull))success Failure:(void (^)(void))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://news-at.zhihu.com/api/3/news/latest" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *mArry = [NSMutableArray array];
        for(NSDictionary *dict in responseObject[@"stories"])
        {
            Model *model = [Model DataWithDict:dict];
            [mArry addObject:model];
            if(success) success(mArry.copy);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
