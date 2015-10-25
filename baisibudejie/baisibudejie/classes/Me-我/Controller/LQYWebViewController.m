//
//  LQYWebViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/25.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYWebViewController.h"

@interface LQYWebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goback;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goforward;

@end

@implementation LQYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
  
}

- (IBAction)back:(id)sender {
    
    [self.webView goBack];
    
}

- (IBAction)forward:(id)sender {
    [self.webView goForward];
}

#pragma mark - <UIWebViewDelegate>
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.goback.enabled = webView.canGoBack;
    self.goback.enabled = webView.canGoForward;
}
//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    self.goback.enabled = webView.canGoBack;
//    self.goback.enabled = webView.canGoForward;
//    
//}
@end
