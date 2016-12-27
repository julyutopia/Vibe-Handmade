//
//  DiscoverTableView.h
//  VIBE
//
//  Created by Li Haii on 16/10/11.
//  Copyright © 2016年 LiHaii. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DiscoverTopicModal.h"
#import "DiscoverHotTagTableViewCell.h"
#import "DiscoverAlbumTopTableViewCell.h"
#import "DiscoverAlbumTableViewCell.h"

@interface DiscoverTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
{
    UIView  * _sectionFooterView;
}

@property(retain, nonatomic)NSMutableArray  * discoverHotTagsArray;
@property(retain, nonatomic)NSMutableArray  * discoverAlbumsArray;

-(void)setDiscoverTableWithHotTagsArray:(NSArray *)hotTags AlbumsArray:(NSArray *)albums;

@end
