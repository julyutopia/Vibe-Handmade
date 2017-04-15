//
//  TagLIstViewController.h
//  VIBE
//
//  Created by Li Haii on 2017/4/14.
//  Copyright © 2017年 LiHaii. All rights reserved.
//

#import "BasicViewController.h"

#import "TagListTopCollectionViewCell.h"
#import "TagListItemCollectionViewCell.h"

#import "ItemDetailViewController.h"

@interface TagLIstViewController : BasicViewController<UICollectionViewDelegate , UICollectionViewDataSource, TagListItemCollectionViewCellDelegate>
{    
    UICollectionView    * _tagListCollectionView;
    
    DiscoverTagModal    * _tagModal;
}

-(id)initWithTagInfo:(DiscoverTagModal *)tagModal;

@end
