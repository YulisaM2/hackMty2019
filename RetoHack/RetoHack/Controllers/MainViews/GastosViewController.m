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
        return cell;
    }else{
        NSString *identifier = @"cell2";
        GastosResumenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        return cell;
    }
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GastoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellGastos"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


@end
