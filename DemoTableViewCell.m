//
//  DemoTableViewCell.m
//  B
//
//  Created by 申明达 on 2023/3/1.
//

#import "DemoTableViewCell.h"

#import "Model.h"
NSString *DemoTableViewCellReuseIdentifier = @"DemoTableViewCell";


@interface DemoTableViewCell ()
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIImageView *ImgView1;
@property(nonatomic,strong)UILabel *hintLab;

@end
@implementation DemoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.ImgView1];
        [self.contentView addSubview:self.hintLab];
    }
    return  self;
}

- (void)updateConfigurationUsingState:(UIViewConfigurationState *)state {
    self.ImgView1.frame = CGRectMake(305, 20, 70, 70);
    self.titleLab.frame = CGRectMake(12, 11, 250, 80);
    self.hintLab.frame = CGRectMake(12, 70, 150, 20);
}

-(UILabel *)titleLab{
    if(_titleLab == nil){
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = [UIFont boldSystemFontOfSize:16];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)hintLab{
    if(_hintLab == nil){
        _hintLab = [[UILabel alloc]init];
        _hintLab.font = [UIFont systemFontOfSize:12];
    }
    return _hintLab;
}


-(UIImageView *)ImgView1{
    if(_ImgView1 == nil){
        _ImgView1 = [[UIImageView alloc]init];
    }
    return  _ImgView1;
}

//- (void)setImgView1:(UIImageView *)ImgView1 {
//    _ImgView1 = ImgView1;
//    [self.ImgView1 setImageWithURL:[NSURL URLWithString:_imgName]];
    
//}

-(void)setImgName:(NSString *)imgName{
    _imgName = imgName;
    [self.ImgView1 setImageWithURL:[NSURL URLWithString:imgName]];
}

-(void)setTitle:(NSString *)title{
    self.titleLab.text = title.copy;
}

-(void)setHint:(NSString *)hint{
    self.hintLab.text = hint.copy;
}
- (NSString *)title {
    return  self.titleLab.text.copy;
}

-(NSString *)hint{
    return  self.hintLab.text.copy;
}


//-(NSString *)imgName{
//    return self.imgName.copy;
//}


- (void)layoutIfNeeded {
    CGFloat space = 10;
    CGFloat side = self.contentView.frame.size.height - 2 * space;
    self.ImgView1.frame = CGRectMake(350, 10, 40, 40);
    self.titleLab.frame = CGRectMake(space + side, 15, 200, 20);
    
    CGFloat left = self.contentView.frame.size.width - 50;
//    self.ImgView1.frame = CGRectMake(left, 2 * space, 10, 10);
}
@end
