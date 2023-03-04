//
//  DemoTableViewCell.h
//  B
//
//  Created by 申明达 on 2023/3/1.
//

#import <UIKit/UIKit.h>
#import <UIImageView+AFNetworking.h>


NS_ASSUME_NONNULL_BEGIN


UIKIT_EXTERN NSString *DemoTableViewCellReuseIdentifier;
@interface DemoTableViewCell : UITableViewCell
@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *imgName;

@property(nonatomic,copy)NSString *hint;


@end

NS_ASSUME_NONNULL_END
