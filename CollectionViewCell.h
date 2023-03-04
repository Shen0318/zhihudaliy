//
//  CollectionViewCell.h
//  B
//
//  Created by 申明达 on 2023/3/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
UIKIT_EXTERN NSString *DemoCollectionViewCellReuseIdentifier;

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *imgName;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *hint;

@end

NS_ASSUME_NONNULL_END
