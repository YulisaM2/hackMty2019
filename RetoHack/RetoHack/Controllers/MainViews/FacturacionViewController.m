//
//  FacturacionViewController.m
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

#import "FacturacionViewController.h"
#import <RetoHack-Swift.h>
#import <XJYChart/XJYChart.h>
#import <FontAwesomeKit.h>
@interface FacturacionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *category;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet XLineChart *chart;

@end

@implementation FacturacionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"FacturacionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

    [self insertChart];
    self.category.text = @"";
    self.pageControl.hidesForSinglePage = YES;
    
    // Do any additional setup after loading the view.
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
   // self.pageControl.currentPage = indexPath.section;
//    [UIView animateWithDuration:1.3f animations:^{
//        self.category.frame = CGRectMake(self.view.center.x,self.category.frame.origin.y,self.category.frame.size.width, self.category.frame.size.height);
//        switch (indexPath.row) {
//            case 0:
//                [self.category setText:@"Ventas"];
//                break;
//            case 1:
//                [self.category setText:@"Gastos"];
//                break;
//            case 2:
//                [self.category setText:@"Ganancias"];
//                break;
//
//            default:
//                break;
//        }
//    }];
    

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageControl.currentPage = ceil((double)scrollView.contentOffset.x / (double)scrollView.frame.size.width);

}


-(void) insertChart{
    NSMutableArray* itemArray = [[NSMutableArray alloc] init];

    NSMutableArray* numberArray =
    [NSMutableArray arrayWithArray:@[ @75, @63, @183, @109, @88 ]];
    
    XLineChartItem* item =
    [[XLineChartItem alloc] initWithDataNumberArray:numberArray
                                              color:XJYWhite];
    [itemArray addObject:item];
    
    XAreaLineChartConfiguration* configuration =
    [[XAreaLineChartConfiguration alloc] init];
    configuration.isShowPoint = YES;
    configuration.lineMode = CurveLine;
    configuration.ordinateDenominator = 6;
    //    configuration.isEnableNumberLabel = YES;
    XLineChart* lineChart =
    [[XLineChart alloc] initWithFrame:CGRectMake(0, 0, self.chart.frame.size.width, self.chart.frame.size.height)
                        dataItemArray:itemArray
                    dataDiscribeArray:[NSMutableArray arrayWithArray:@[
                                                                       @"January", @"February", @"March", @"April", @"May"
                                                                       ]]
                            topNumber:@240
                         bottomNumber:@0
                            graphMode:AreaLineGraph
                   chartConfiguration:configuration];
    [self.chart addSubview:lineChart];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    
    FacturacionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.backgroundColor = [UIColor colorWithRed:0.1215686275 green:0.7568627451 blue:0.6392156863 alpha:0.7];
            [cell.categoryLabel setText:@"Ventas"];
            [cell.categoryLabel setTextColor:UIColor.whiteColor];
     
            cell.imageCell.tintColor = UIColor.whiteColor;
            [cell.amountLabel setText:@"$229,019,193"];
            
            cell.imageCell.image = [UIImage imageNamed:@"dollar-1"];
            [cell.topBar setHidden:YES];
            break;
        case 1:
            cell.backgroundColor = [UIColor colorWithRed:0.4470588235 green:0.1067961165 blue:0.768627451 alpha:0.7];
            [cell.categoryLabel setTextColor:UIColor.whiteColor];
            [cell.categoryLabel setText:@"Gastos"];
            [cell.amountLabel setText:@"$180,372,212"];
            cell.imageCell.image = [UIImage imageNamed:@"dollar-1"];
            [cell.topBar setHidden:YES];
            break;
        case 2:
            cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
            [cell.categoryLabel setText:@"Ganancias"];
            [cell.categoryLabel setTextColor:[UIColor colorWithRed:0.5058823529 green:0.5568627451 blue:0.6 alpha:1]];
            [cell.amountLabel setTextColor:[UIColor colorWithRed:0.5058823529 green:0.5568627451 blue:0.6 alpha:1]];
            [cell.amountLabel setText:@"$123,273,234"];
            [cell.topBar setHidden:NO];
            cell.imageCell.image = [UIImage imageNamed:@"dollar"];

            break;
            
        default:
            break;
            
            
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}



@end
