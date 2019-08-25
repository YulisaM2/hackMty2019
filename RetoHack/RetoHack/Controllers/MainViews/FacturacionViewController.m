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
@property (strong, nonatomic) NSString *totalVentas;
@property (strong, nonatomic) NSString *totalGastos;
@property (strong, nonatomic) NSString *utilidad;
@property (strong, nonatomic) NSMutableArray *ventas;
@property (strong, nonatomic) NSMutableArray *gastos;
@end

@implementation FacturacionViewController
NSNumberFormatter *formatter;



-(void) viewWillAppear:(BOOL)animated{
    self.ventas = [NSMutableArray new];
    self.gastos = [NSMutableArray new];
    formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    [[APIManager shared] getVentasTotalesWithCompletion:^(NSError *  error, NSNumber *  suma) {
        if(error == nil){
            NSString *numberString = [formatter stringFromNumber:suma];
            self.totalVentas = numberString;
            [self.collectionView reloadData];
        }else{
            NSLog(@"%@", error.localizedDescription);
        }
    }];

    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_global_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group,queue, ^ {
    [[APIManager shared] getVentasPorPeriodoWithCompletion:^(NSError * error, NSArray * ventas) {
        if(error == nil){
            NSLog(@"%@", ventas);
            for(NSDictionary * venta in ventas){
                NSNumber *v = venta[@"Ingresos"];
                int myInt = v.integerValue;
                NSNumber *number = [NSNumber numberWithInt:myInt];
                [self.ventas addObject:number];
                
            }
    
        }
    }];
    [[APIManager shared] getGastosPorPeriodoWithCompletion:^(NSError * error, NSArray * gastos) {
        if(error == nil){
            NSLog(@"%@", gastos);
            for(NSDictionary * gasto in gastos){
                NSLog(@"%@", gasto);
                NSNumber *g = gasto[@"Egresos"];
                int myInt = g.integerValue;
                NSNumber *number = [NSNumber numberWithInt:myInt];
                [self.gastos addObject:number];
                
            }
            
        }
    }];
        [NSThread sleepForTimeInterval:2];
    });
    dispatch_group_notify(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        [self insertChart];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"FacturacionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_global_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    
    dispatch_group_async(group,queue, ^ {
        [[APIManager shared] getGastosTotalesWithCompletion:^(NSError * error, NSNumber * gastos) {
            if(error == nil){
                NSString *numberString = [formatter stringFromNumber:gastos];
                self.totalGastos = numberString;
            }else{
                NSLog(@"%@", error.localizedDescription);
            }
        }];
        [NSThread sleepForTimeInterval:0.2];
    });
    
    dispatch_group_async(group,queue, ^ {
        [[APIManager shared] getUtilidadTotalesWithCompletion:^(NSError * error, NSNumber * utilidad) {
            if(error == nil){
                NSString *numberString = [formatter stringFromNumber:utilidad];
                self.utilidad = numberString;
            }else{
                NSLog(@"%@", error.localizedDescription);
            }
        }];
        [NSThread sleepForTimeInterval:0.2];
    });
    dispatch_group_notify(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
         [self.collectionView reloadData];
    });
    

    
    
    
    
    
    self.category.text = @"";
    self.pageControl.hidesForSinglePage = YES;
    
    // Do any additional setup after loading the view.
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{


}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageControl.currentPage = ceil((double)scrollView.contentOffset.x / (double)scrollView.frame.size.width);

}


-(void) insertChart{
    NSMutableArray* itemArray = [[NSMutableArray alloc] init];


    
    XLineChartItem* item =
    [[XLineChartItem alloc] initWithDataNumberArray:self.ventas
                                              color:XJYSkyBlue];
    [itemArray addObject:item];
  
    
    XLineChartItem* item2 =
    [[XLineChartItem alloc] initWithDataNumberArray:self.gastos
                                              color:XJYRed];
    
   
     [itemArray addObject:item2];
    XStackAreaLineChartConfiguration* configuration =
    [[XStackAreaLineChartConfiguration alloc] init];
    configuration.lineMode = CurveLine;

    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSNumber * bigger = [NSNumber new];
        NSNumber * smaller = [NSNumber new];
        if([self.gastos valueForKeyPath:@"@max.self"] > [self.ventas valueForKeyPath:@"@max.self"]){
            bigger = [self.gastos valueForKeyPath:@"@max.self"];
        }else{
            bigger = [self.ventas valueForKeyPath:@"@max.self"];
        }
        
        if([self.gastos valueForKeyPath:@"@min.self"] > [self.ventas valueForKeyPath:@"@min.self"]){
            smaller = [self.ventas valueForKeyPath:@"@min.self"];
        }else{
            smaller = [self.gastos valueForKeyPath:@"@min.self"];
        }
        NSLog(@"%@",self.ventas);
        NSLog(@"%@",self.gastos);
        
        XLineChart* lineChart =
        [[XLineChart alloc] initWithFrame:CGRectMake(0, 0, self.chart.frame.size.width, self.chart.frame.size.height)
                            dataItemArray:itemArray
                        dataDiscribeArray:[NSMutableArray arrayWithArray:@[
                                                                           @"Jan", @"Feb", @"Mar", @"April", @"May", @"June"
                                                                           ]]
                                topNumber: [NSNumber numberWithInt:600000]
                             bottomNumber:smaller
                                graphMode:StackAreaLineGraph
                       chartConfiguration:configuration];
        [self.chart addSubview:lineChart];
    });
    //    configuration.isEnableNumberLabel = YES;
    
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
            [cell.amountLabel setText:self.totalVentas];
            
            //cell.amountLabel.text =
            break;
        case 1:
            cell.backgroundColor = [UIColor colorWithRed:0.4470588235 green:0.1067961165 blue:0.768627451 alpha:0.7];
            [cell.categoryLabel setTextColor:UIColor.whiteColor];
            [cell.categoryLabel setText:@"Gastos"];
            [cell.amountLabel setText:@"$180,372,212"];
            cell.imageCell.image = [UIImage imageNamed:@"dollar-1"];
            [cell.topBar setHidden:YES];
            [cell.amountLabel setText:self.totalGastos];
            break;
        case 2:
            cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
            [cell.categoryLabel setText:@"Ganancias"];
            [cell.categoryLabel setTextColor:[UIColor colorWithRed:0.5058823529 green:0.5568627451 blue:0.6 alpha:1]];
            [cell.amountLabel setTextColor:[UIColor colorWithRed:0.5058823529 green:0.5568627451 blue:0.6 alpha:1]];
            [cell.amountLabel setText:@"$123,273,234"];
            [cell.topBar setHidden:NO];
            cell.imageCell.image = [UIImage imageNamed:@"dollar"];

            [cell.amountLabel setText:self.utilidad];
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
