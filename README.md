YouTubePortal
=============
A reusable wrapper around the YouTube mobile site, with options to open in YouTube app and Mobile Safari.
(For iOS)

We built this view controller for v1.1 of [Louis Armstrong: ‘West End Blues’ and the Birth of Jazz](http://itunes.apple.com/app/louis-armstrong-west-end-blues/id407249920). Do check it out.

Screenshots
-----------
<img src="YouTubePortal/youtube_wrap.png" alt="YouTube mobile website wrapped in modal view controller" />

<img src="YouTubePortal/fullscreen.png" alt="Video playing at fullscreen" />

Installation and Use
--------------------
Download/clone YouTubePortal and drag `YouTubePortalViewController.h` and `YouTubePortalViewController.m` into your Xcode project.

`YouTubePortalViewController` exposes `- (id)initWithYouTubeVideoId:(NSString *)videoId;` which takes the YouTube Video ID as it’s sole parameter.

Intended usage is to present the `YouTubePortalViewController` modally.

    YouTubePortalViewController *ytvc;
    NSString *myYouTubeVideoId = @"CwIvBNsSywQ";

    ytvc = [[YouTubePortalViewController alloc] initWithYouTubeVideoId:myYouTubeVideoId];
	[self presentModalViewController:ytvc animated:YES];

Feedback, Issues, Etc.
----------------------
Love to hear it. Open an [Issue](https://github.com/carltongibson/YouTubePortal/issues) or try me on [Twiter](https://twitter.com/carltongibson).

