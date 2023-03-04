//
//  CollectionViewCell.m
//  B
//
//  Created by 申明达 on 2023/3/3.
//

#import "CollectionViewCell.h"
#import <UIImageView+AFNetworking.h>

#import "Model.h"

NSString *DemoCollectionViewCellReuseIdentifier = @"DemoCollectionViewCell";
@interface CollectionViewCell()
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *hintLab;

@end



@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.hintLab];
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    self.imgView.frame = CGRectMake(0, 0, layoutAttributes.size.width, layoutAttributes.size.height);
    self.titleLab.frame = CGRectMake(10, layoutAttributes.size.height - 100, layoutAttributes.size.width, 70);
    self.hintLab.frame = CGRectMake(10, layoutAttributes.size.height -50, layoutAttributes.size.width, 30);
}

- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
    }
    return _imgView;
}

- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont boldSystemFontOfSize:23];
        _titleLab.textColor = UIColor.whiteColor;
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

-(UILabel *)hintLab{
    if(_hintLab == nil){
        _hintLab = [[UILabel alloc]init];
        _hintLab.font = [UIFont systemFontOfSize:13];
        _hintLab.textColor = UIColor.whiteColor;
    }
    return  _hintLab;
}

- (void)setTitle:(NSString *)title {
    self.titleLab.text = title.copy;
}

- (void)setImgName:(NSString *)imgName {
    _imgName = imgName;
    [self.imgView setImageWithURL:[NSURL URLWithString:imgName]];
}

-(void)setHint:(NSString *)hint{
    self.hintLab.text = hint.copy;
}

- (NSString *)title {
    return self.titleLab.text.copy;
}

//-(NSString *)imgName{
//    return  self.imgView.image.copy;
//}

-(NSString *)hint{
    return self.hintLab.text.copy;
}

@end
