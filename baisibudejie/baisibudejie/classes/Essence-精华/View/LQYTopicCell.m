//
//  LQYTopicCell.m
//  baisibudejie
//
//  Created by shasha on 15/10/28.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTopicCell.h"
#import "LQYTopic.h"

@interface LQYTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation LQYTopicCell

- (void)setTopic:(LQYTopic *)topic
{
    _topic = topic;
    
    [self.profileImageView setHeaderWithUrl:topic.profile_image];
    self.nameLabel.text = topic.name;
    self.createdLabel.text = topic.created_at;
    self.text_label.text = topic.text;
    
    [self.dingButton setTitle:[NSString stringWithFormat:@"%zd",topic.ding]forState:UIControlStateNormal];
    [self.caiButton setTitle:[NSString stringWithFormat:@"%zd",topic.cai]forState:UIControlStateNormal];
    [self.repostButton setTitle:[NSString stringWithFormat:@"%zd",topic.repost]forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%zd",topic.comment]forState:UIControlStateNormal];
    
}

@end
