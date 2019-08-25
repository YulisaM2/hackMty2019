//
//  GastosViewController.m
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

#import "GastosViewController.h"
#import <RetoHack-Swift.h>


@interface GastosViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSString *numero;
@property (strong, nonatomic) NSString *mayorGasto;
@property (strong, nonatomic) NSString *proveedorMasGrande;
@property (strong, nonatomic) NSString *companyMayorGasto;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) NSArray *companiesGastos;
@end

@implementation GastosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"GastosResumenCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell2"];
     [self.collectionView registerNib:[UINib nibWithNibName:@"GastosCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"GastoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellGastos"];
  
    
    [[APIManager shared] getProveedoresPorPeriodoWithCompletion:^(NSError * error, NSNumber * numero) {
        if(error == nil){
        self.numero = [NSString stringWithFormat:@"%@", numero];
        [self.collectionView reloadData];
        }
    }];
    
    
    
    [[APIManager shared] getMayorGastoWithCompletion:^(NSError * error, NSNumber * gastoMayor, NSString *name) {
        if(error == nil){
            self.mayorGasto = [@"$" stringByAppendingString:[NSString stringWithFormat:@"%@", gastoMayor]];
            self.companyMayorGasto = name;
            [self.collectionView reloadData];
        }
    }];
    
    [[APIManager shared] getComprasTopWithCompletion:^(NSError * error, NSArray * arreglo) {
        if(error == nil){
            self.companiesGastos = arreglo;
            [self.tableView reloadData];
        }
    }];
    
    [[APIManager shared] getProveedorMasGrandeWithCompletion:^(NSError * error, NSString * nombre) {
        if(error == nil){
            self.proveedorMasGrande = [NSString stringWithFormat:@"%@", nombre];
            
            [self.collectionView reloadData];
        }
    }];
    
    // Do any additional setup after loading the view.
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
    if(indexPath.row == 0){
        NSString *identifier = @"cell";
        GastosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        [cell.numeroProveedores setText:self.numero];
        return cell;
    }else{
       
        NSString *identifier = @"cell2";
        GastosResumenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        if(indexPath.row == 1){
            [cell.amountLabel setText:self.mayorGasto];
            [cell.costumer setText:self.companyMayorGasto];
        }else{
            [cell.descriptionLabel setText:@"Tu proveedor más rande del periodo"];
            [cell.costumer setText:self.proveedorMasGrande];
            
        }
        return cell;
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageControl.currentPage = ceil((double)scrollView.contentOffset.x / (double)scrollView.frame.size.width);
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"%@",self.companiesGastos[indexPath.row]);
    GastoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellGastos"];
    [cell.nameCompany setText:self.companiesGastos[indexPath.row][@"emisorname"]];
    [cell.amountLabel setText:[NSString stringWithFormat:@"%@",self.companiesGastos[indexPath.row][@"total"]]];
    [cell.rfcLabel setText:[NSString stringWithFormat:@"%@",self.companiesGastos[indexPath.row][@"emisorrfc"]]];
    [cell.amountLabel setText:[@"$" stringByAppendingString:[NSString stringWithFormat:@"%@",self.companiesGastos[indexPath.row][@"total"]]]];
     [cell.fechaLabel setText:[NSString stringWithFormat:@"%@",self.companiesGastos[indexPath.row][@"dateData"]]];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


@end
