//
//  LQYTopicCell.m
//  baisibudejie
//
//  Created by shasha on 15/10/28.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTopicCell.h"
#import "LQYTopic.h"
#import "LQYComment.h"
#import "LQYUser.h"
#import "LQYTopicPictureView.h"

@interface LQYTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;



@property (weak, nonatomic) IBOutlet UIView *topCmtView;
@property (weak, nonatomic) IBOutlet UILabel *topCmtContent;

/** 中间控件 */
@property (nonatomic, weak) LQYTopicPictureView *pictureView; /**< 图片控件 */

@end

@implementation LQYTopicCell

#pragma mark - 懒加载
/** 图片控件 属性的懒加载 */
- (LQYTopicPictureView *)pictureView
{
    if (!_pictureView) {
        LQYTopicPictureView *pictureView = [LQYTopicPictureView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}


- (void)awakeFromNib
{
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setTopic:(LQYTopic *)topic
{
    _topic = topic;
    
    [self.profileImageView setHeaderWithUrl:topic.profile_image];
    self.nameLabel.text = topic.name;
    self.createdLabel.text = topic.created_at;
    self.text_label.text = topic.text;
    
    // 最热评论
    if (topic.topCmt) { // 有最热评论
        
        self.topCmtView.hidden = NO;

        // 内容
        NSString *content = topic.topCmt.content;
        // 用户名
        NSString *username = topic.topCmt.user.username;
        // 设置数据
        self.topCmtContent.text = [NSString stringWithFormat:@"%@: %@",username,content];
        
    }else {
        self.topCmtView.hidden = YES;
    }
    
    if (topic.type == LQYTopicTypePicture) {
        self.pictureView.hidden = NO;
        // 设置数据
        self.pictureView.topic = topic;
        
        // 设置尺寸
        self.pictureView.frame = topic.centerFrame;
        
    } else if (topic.type == LQYTopicTypeWord) { // 段子
        self.pictureView.hidden = YES;
    }else if (topic.type == LQYTopicTypeVoice) { // 音频
        self.pictureView.hidden = YES;
    }else if (topic.type == LQYTopicTypeVideo) { // 视频
        self.pictureView.hidden = YES;
    }
    [self setupButton:self.dingButton number:topic.ding title:@"顶"];
    [self setupButton:self.caiButton number:topic.cai title:@"踩"];
    [self setupButton:self.repostButton number:topic.repost title:@"分享"];
    [self setupButton:self.commentButton number:topic.comment title:@"评论"];
    
}

/**
 *  设置按钮的数据
 */
- (void)setupButton:(UIButton *)button number:(NSInteger)number title:(NSString *)title
{
    if (number > 10000) {
       [button setTitle:[NSString stringWithFormat:@"%.1f万",number / 10000.0]forState:UIControlStateNormal];
    }else if (number == 0)
    {
        [button setTitle:title forState:UIControlStateNormal];
    }else{
        [button setTitle:[NSString stringWithFormat:@"%zd",number] forState:UIControlStateNormal];
    }
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= LQYMargin;
    [super setFrame:frame];
}

- (IBAction)moreClick:(id)sender {
    
    // iOS8之前
    // UIAlertView
    // UIActionSheet;
    
    // iOS8开始
    // UIAlertController == UIAlertView + UIActionSheet
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
                                
    [alert addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LQYLog(@"点击了[收藏]");
    }]];
     
    [alert addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        LQYLog(@"点击了[举报]");

    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        LQYLog(@"点击了[取消]");
        
    }]];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];

    
}

@end
