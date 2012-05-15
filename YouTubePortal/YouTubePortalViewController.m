//
//  YouTubePortalViewController.m
//  YouTubeView
//
//  Created by Carlton Gibson on 09/05/2012.
//  Copyright (c) 2012 Noumenal Software Ltd. All rights reserved.
//

#import "YouTubePortalViewController.h"

@interface YouTubePortalViewController () <UIWebViewDelegate, UIActionSheetDelegate>

- (void)doneButtonTapped:(id)sender;
- (void)actionButtonTapped:(id)sender;

@end

@implementation YouTubePortalViewController {
    NSString *_videoId;
    UIWebView *_webView;
}

- (id)initWithYouTubeVideoId:(NSString *)videoId
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _videoId = videoId;
    }
    return self;
}

- (void)loadView {
    UIViewAutoresizing resizeAllMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    mainView.autoresizingMask = resizeAllMask;
    //mainView.backgroundColor = [UIColor blackColor];
    self.view = mainView;

    // Configure Toolbar
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(doneButtonTapped:)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil];
    UIBarButtonItem *actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                  target:self
                                                                                  action:@selector(actionButtonTapped:)];
    NSArray *items = [NSArray arrayWithObjects:doneButton, space, actionButton, nil];
    [toolbar setItems:items animated:NO];
    [self.view addSubview:toolbar];
    
    // Configure WebView
    CGRect webViewFrame = CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height - 44);
    _webView = [[UIWebView alloc] initWithFrame:webViewFrame];
    _webView.autoresizingMask = resizeAllMask;
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    [self.view addSubview:_webView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *videoURLString = [NSString stringWithFormat:@"http://m.youtube.com/watch?v=%@", _videoId];
    NSURL *videoURL = [NSURL URLWithString:videoURLString];
    [_webView loadRequest:[NSURLRequest requestWithURL:videoURL]];

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [_webView stopLoading];
    _webView = nil;
}

#pragma mark - Toolbar Actions

- (void)doneButtonTapped:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)actionButtonTapped:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Open in…"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"YouTube App", @"Safari", nil];
    [actionSheet showFromBarButtonItem:(UIBarButtonItem *)sender animated:YES];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // Button index 0 is YouTube, 1 is Safari.
    if (buttonIndex == 0) {
        NSURL *theURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@",_videoId]];
        [[UIApplication sharedApplication] openURL:theURL];
    }
    
    if (buttonIndex == 1) {
        NSURL *theURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.youtube.com/watch?v=%@",_videoId]];
        [[UIApplication sharedApplication] openURL:theURL];
    }
    
}

#pragma mark - Housekeeping

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
    return YES;
}

@end
