//====================================================================================================
// Author: Peter Chen
// Created: 12/16/13
// Copyright 2013 Peter Chen
//====================================================================================================

#import "MyController.h"
#import "PCSGroupedTableCollectionHeader.h"

@interface MyController() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MyController

- (id)init {
   if ((self = [super initWithStyle:UITableViewStyleGrouped])) {
   }
   return self;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   self.title = @"Collection View";
   
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
   
   UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
   layout.itemSize = CGSizeMake(self.view.frame.size.width, 44);
   layout.sectionInset = UIEdgeInsetsZero;
   layout.minimumInteritemSpacing = 0;
   layout.minimumLineSpacing = 0;
   
   self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width,
                                                                            kPCSGroupedTableCollectionHeader_DefaultHeight + 5 * 44) collectionViewLayout:layout];
   self.collectionView.scrollEnabled = NO;
   self.collectionView.dataSource = self;
   self.collectionView.delegate = self;
   self.collectionView.backgroundColor = [UIColor clearColor];
   [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellId"];
   [self.collectionView registerClass:[PCSGroupedTableCollectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderId"];
   self.tableView.tableHeaderView = self.collectionView;
}

//====================================================================================================
#pragma mark - Table view
//====================================================================================================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
   return @"Header";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
   cell.textLabel.text = @"Hi";
   return cell;
}

//====================================================================================================
#pragma mark - Collection view
//====================================================================================================

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
   cell.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
   cell.selectedBackgroundView.backgroundColor = [UIColor blueColor];
   
   UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
   label.text = @"Hi";
   [cell.contentView addSubview:label];
   return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
   return CGSizeMake(self.view.frame.size.width, kPCSGroupedTableCollectionHeader_DefaultHeight);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
   PCSGroupedTableCollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderId" forIndexPath:indexPath];
   header.text = @"PCSGroupedTableCollectionHeader";
   return header;
}

@end
