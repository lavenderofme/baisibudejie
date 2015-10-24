//
//  LQYLoginRegisterTextField.m
//  baisibudejie
//
//  Created by shasha on 15/10/24.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYLoginRegisterTextField.h"

@implementation LQYLoginRegisterTextField

- (void)awakeFromNib
{
    self.tintColor = [UIColor whiteColor];
    self.textColor = [UIColor whiteColor];
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textDidBeginEditing:(NSNotification *)note
{
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
}

- (void)textDidEndEditing:(NSNotification *)note
{
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
}

@end
