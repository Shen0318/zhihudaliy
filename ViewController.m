//
//  ViewController.m
//  B
//
//  Created by 申明达 on 2023/2/27.
//

#import "ViewController.h"

#import "DemoTableViewCell.h"

#import "DemoTableViewHeaderView.h"

#import "Model.h"

#import "ViewController.h"

#import "CollectionViewCell.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UILabel *time;
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) UITableView *tableview;
@property(nonatomic,copy) NSArray <Model *> *ary;
@property(nonatomic,strong)UICollectionView*CollectionView;
@property(nonatomic,strong)UIImageView *headpic;
@property(nonatomic)UIPageControl *PageControl;
@end

@implementation ViewController{
    NSArray *_ary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    [self.view addSubview:self.time];
    [self.view addSubview:self.headpic];
    
   
    [Model getDataWithSuccess:^(NSArray * _Nonnull array) {
        self.ary = array;
        NSLog(@"%@", array);
        [self.view addSubview:self.tableview];
        self.tableview.tableHeaderView = self.CollectionView;
    } Failure:^{
        NSLog(@"error");
   }];
    
}

-(UILabel *)label{
    if(_label == nil){
        _label = [[UILabel alloc]init];
        _label.text = @"知乎日报";
        _label.font = [UIFont boldSystemFontOfSize:29];
        _label.textColor = [UIColor blackColor];
        _label.frame = CGRectMake(65, 20, 200, 100);
    }
    return _label;
}
-(UILabel *)time{
    if(_time == nil){
        _time = [[UILabel alloc]init];
        _time.font = [UIFont boldSystemFontOfSize:18];
        _time.textColor = [UIColor blackColor];
        _time.frame = CGRectMake(10, 30, 50, 80);
        _time.text = @"4    三月";
        _time.numberOfLines = 0;
        _time.textColor = [UIColor blackColor];
        _time.textAlignment = NSTextAlignmentCenter;
    }
    return _time;
}

-(UIImageView *)headpic{
    if(_headpic == nil){
        _headpic = [[UIImageView alloc] initWithFrame:CGRectMake(330, 50, 40, 40)];
        _headpic.image = [UIImage imageNamed:@"头像"];
    }
    return  _headpic;
}

-(UITableView *)tableview{
    if(_tableview == nil){
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableview.backgroundColor = [UIColor whiteColor];
        _tableview.dataSource = self;
        _tableview.delegate = self;
        _tableview.estimatedRowHeight = 0;
        _tableview.estimatedSectionHeaderHeight = 0;
        _tableview.estimatedSectionFooterHeight = 0;
        _tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.bounces = NO;
        [_tableview registerClass:DemoTableViewCell.class forCellReuseIdentifier:DemoTableViewCellReuseIdentifier];
       // [_tableview registerClass:DemoTableViewHeaderView.class forHeaderFooterViewReuseIdentifier:DemoTableViewHeaderViewReuseIdentifier];
    }
    return _tableview;
}


- (UICollectionView *)CollectionView {
    if (_CollectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        CGFloat space = 0;
        CGFloat width = self.view.frame.size.width - 2 * space;
        _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(space, 100, width, width)collectionViewLayout:layout];
        _CollectionView.delegate = self;
        _CollectionView.dataSource = self;
        _CollectionView.pagingEnabled = YES;
        _CollectionView.showsHorizontalScrollIndicator = NO;
        [_CollectionView registerClass:CollectionViewCell.class forCellWithReuseIdentifier:DemoCollectionViewCellReuseIdentifier];

    }
    return _CollectionView;
}

#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.ary.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DemoCollectionViewCellReuseIdentifier forIndexPath:indexPath];
// array[]
    cell.imgName = self.ary[indexPath.item].pic;
    
    cell.title = self.ary[indexPath.item].title;
    
    cell.hint = self.ary[indexPath.item].hint;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return collectionView.frame.size;
}



#pragma mark UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[DemoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = UIColor.whiteColor;
    Model *model = self.ary[indexPath.row];
//    cell.textLabel.text = model.title;
//    //cell.textLabel.text = model.hint;
//    cell.textLabel.numberOfLines = 0;
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
//    //cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
//    cell.textLabel.frame = CGRectMake(0,0 , 300, 80);
//
    cell.title = model.title;
    cell.hint = model.hint;
    cell.imgName = model.pic;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}



@end
