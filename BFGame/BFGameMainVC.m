//
//  BFGameMainVC.m
//  BFGame
//
//  Created by Readboy_BFAlex on 2017/8/28.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "BFGameMainVC.h"
#import "BFAddView.h"
#import "BFGameItemModule.h"
#import "BFGameItemCell.h"

@interface BFGameMainVC () <BFAddViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *gameItemsMenuTV;
@property (weak, nonatomic) IBOutlet UIButton *gameBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UILabel *emptyContentTip;

@property (nonatomic, strong) NSMutableArray *menuDataSource;

@end

@implementation BFGameMainVC

#pragma mark - Property

- (NSMutableArray *)menuDataSource {
    if (!_menuDataSource) {
        _menuDataSource = [[NSMutableArray alloc] init];
    }
    
    return _menuDataSource;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self basicSetting];
}

#pragma mark - Private

- (void)basicSetting {
    // data
    self.gameItemsMenuTV.dataSource = self;
    self.gameItemsMenuTV.delegate = self;
    
    // View
}

- (void)statusForNormal {
    
    self.gameBtn.enabled = true;
    self.addBtn.enabled = true;
    self.deleteBtn.enabled = true;
}

- (void)statusForDeleteAction {
//    self.gameItemsMenuTV
    // 按钮
    self.gameBtn.enabled = false;
    self.addBtn.enabled = false;
}

- (void)showAddView {
    BFAddView *addView = [BFAddView addViewWithFrame:self.view.bounds];
    [self.view addSubview:addView];
    
    addView.delegate = self;
}

#pragma mark - Action

- (IBAction)actionGame:(UIButton *)sender {
}
- (IBAction)actionAddItem:(UIButton *)sender {
    [self showAddView];
}
- (IBAction)actionDeleteItem:(UIButton *)sender {
}

#pragma mark - Delegate/DataSource
#pragma mark BFAddView
- (void)addView:(BFAddView *)addView didAddNewItem:(NSDictionary *)dict {
    NSLog(@"%s\ndata:%@", __func__, dict);
    
    BFGameItemModule *module = [BFGameItemModule itemModuleWithData:dict];
    [self.menuDataSource addObject:module];
    [self.gameItemsMenuTV reloadData];
}

#pragma mark UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.emptyContentTip.hidden = (self.menuDataSource.count > 0);
    self.gameItemsMenuTV.hidden = !self.emptyContentTip.hidden;
    
    return self.menuDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BFGameItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BFGameItemCellID"];
    if (!cell) {
        cell = [BFGameItemCell gameItemCell];
    }
    
    [cell configurateCellWithModule:self.menuDataSource[indexPath.row]];
    
    return cell;
}

@end
