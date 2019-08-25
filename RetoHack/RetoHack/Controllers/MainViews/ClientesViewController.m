//
//  ClientesViewController.m
//  RetoHack
//
//  Created by Alejandro Hernandez on 24/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

#import "ClientesViewController.h"

#import <RetoHack-Swift.h>
#import <PieCharts-Swift.h>
@interface ClientesViewController ()  <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet PieChart *pieChart;
@property (strong, nonatomic) NSArray * arrayClientes;
@end

@implementation ClientesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ClientesTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [[APIManager shared] getVentasTopWithCompletion:^(NSError * error, NSArray * json) {
        if(error == nil){
            self.arrayClientes = json;
            [self.tableView reloadData];
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ClientesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.amount setText:[NSString stringWithFormat:@"%@",self.arrayClientes[indexPath.row][@"total"]]];
    [cell.clienteNumber setText:[@"Tu cliente #" stringByAppendingString: [NSString stringWithFormat:@"%ld", indexPath.row + 1]]];
    [cell.name setText:self.arrayClientes[indexPath.row][@"receptorname"]];
    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayClientes.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

@end
