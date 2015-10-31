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
    
    if (topic.type == LQYTopicTypePicture) {
        NSLog(@"图片");
    } else if (topic.type == LQYTopicTypeWord) {
        NSLog(@"段子");
    }else if (topic.type == LQYTopicTypeVoice) {
        NSLog(@"音频");
    }else {
        NSLog(@"视频");
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
