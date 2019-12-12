#import <UIKit/UIKit.h>
#import <GVRKit/GVRKit.h>

#import "VideoPlayerViewController.h"

@interface VideoPlayerViewController ()<GVRRendererViewControllerDelegate>
@property(nonatomic) IBOutlet GVRRendererView *videoView;
@property(nonatomic) IBOutlet UITextView *attributionTextView;
@property(nonatomic) IBOutlet UIToolbar *toolbar;
@property(nonatomic) UIBarButtonItem *playButton;
@property(nonatomic) UIBarButtonItem *pauseButton;
@property(nonatomic) UIBarButtonItem *progressBar;
@property(nonatomic) AVPlayer *player;
@end

@implementation VideoPlayerViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // Build source attribution text view.
  NSString *sourceText = @"Source: ";
  NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]
      initWithString:[sourceText stringByAppendingString:@"Wikipedia"]];
  [attributedText
      addAttribute:NSLinkAttributeName
             value:@"https://en.wikipedia.org/wiki/Gorilla"
             range:NSMakeRange(sourceText.length, attributedText.length - sourceText.length)];

  _attributionTextView.attributedText = attributedText;

  // Setup toolbar buttons.
  _playButton =
      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                                    target:self
                                                    action:@selector(updateVideoPlayback)];
  _pauseButton =
      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause
                                                    target:self
                                                    action:@selector(updateVideoPlayback)];
  UIProgressView *progressView =
      [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
  [progressView sizeToFit];
  _progressBar = [[UIBarButtonItem alloc] initWithCustomView:progressView];

  // Load the sample 360 video, which is of type stereo-over-under.
  // use dynamic method to get video URL
  NSString *videoPath = [[NSBundle mainBundle] pathForResource: self.code ofType:@"mp4"];
    if (videoPath == nil){
        UIAlertView *mBoxView = [[UIAlertView alloc]
                                 initWithTitle:@"Alert Information"
                                 message:@"Can't find the video.Please scan again！"
                                 delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil, nil];
        [mBoxView show];
        return;
    }
  NSURL *videoURL = [[NSURL alloc] initFileURLWithPath:videoPath];

  // Alternatively, this is how to load a video from a URL:
  // NSURL *videoURL = [NSURL
  // URLWithString:@"https://raw.githubusercontent.com/googlevr/gvr-ios-sdk"
  //               @"/master/Samples/VideoWidgetDemo/resources/congo.mp4"];

  _player = [AVPlayer playerWithURL:videoURL];
  _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(playerItemDidReachEnd:)
                                               name:AVPlayerItemDidPlayToEndTimeNotification
                                             object:[_player currentItem]];
  __weak __typeof(self) weakSelf = self;
  [_player addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1.0 / 60.0, NSEC_PER_SEC)
                                        queue:NULL
                                   usingBlock:^(CMTime time) { [weakSelf updateProgressBar]; }];

  GVRRendererViewController *viewController = self.childViewControllers[0];
  GVRSceneRenderer *sceneRenderer = (GVRSceneRenderer *)viewController.rendererView.renderer;
  GVRVideoRenderer *videoRenderer = [sceneRenderer.renderList objectAtIndex:0];
  videoRenderer.player = _player;
  _videoView = (GVRRendererView *)viewController.view;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex:%ld",(long)buttonIndex);
    
    if (buttonIndex == 0) {//cancel
        NSLog(@"ok");
        [self.navigationController popViewControllerAnimated:YES];
    }else if (buttonIndex == 1){//ok
         
        NSLog(@"ok");
    }
}
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [self updateVideoPlayback];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  [super prepareForSegue:segue sender:sender];
  if ([segue.destinationViewController isKindOfClass:[GVRRendererViewController class]]) {
    GVRRendererViewController *viewController = segue.destinationViewController;
    viewController.delegate = self;
  }
}

#pragma mark - Actions

- (IBAction)didTapPlayPause:(id)sender {
  [self updateVideoPlayback];
}

- (void)updateProgressBar {
  UIProgressView *progressView = (UIProgressView *)_progressBar.customView;
  double duration = CMTimeGetSeconds(_player.currentItem.duration);
  double time = CMTimeGetSeconds(_player.currentTime);
  progressView.progress = (CGFloat)(time / duration);
}

#pragma mark - AVPlayer

- (void)playerItemDidReachEnd:(NSNotification *)notification {
  AVPlayerItem *player = [notification object];
  [player seekToTime:kCMTimeZero];
}

#pragma mark - GVRRendererViewControllerDelegate

- (void)didTapTriggerButton {
  [self updateVideoPlayback];
}

- (GVRRenderer *)rendererForDisplayMode:(GVRDisplayMode)displayMode {
  GVRVideoRenderer *videoRenderer = [[GVRVideoRenderer alloc] init];
  videoRenderer.player = _player;
  [videoRenderer setSphericalMeshOfRadius:50
                                latitudes:12
                               longitudes:24
                              verticalFov:180
                            horizontalFov:360
                                 meshType:kGVRMeshTypeMonoscopic];
    
   //   kGVRMeshTypeMonoscopic  --- regular 360 video

  GVRSceneRenderer *sceneRenderer = [[GVRSceneRenderer alloc] init];
  [sceneRenderer.renderList addRenderObject:videoRenderer];

  if (displayMode == kGVRDisplayModeEmbedded) {
    // Hide the reticle in embedded mode.
    sceneRenderer.hidesReticle = YES;
  } else {
    // In fullscreen mode, add the toolbar to the GL scene.
    GVRUIViewRenderer *viewRenderer = [[GVRUIViewRenderer alloc] initWithView:_toolbar];

    // Position the playback controls half a meter in front (z = -0.5).
    GLKMatrix4 position = GLKMatrix4MakeTranslation(-0.0, -0.3, -0.5);
    // Rotate along x axis so that it looks oriented towards us.
    position = GLKMatrix4RotateX(position, GLKMathDegreesToRadians(-20));
    viewRenderer.position = position;

    [sceneRenderer.renderList addRenderObject:viewRenderer];
  }

  return sceneRenderer;
}

#pragma mark - Private

- (void)updateVideoPlayback {
  if (_player.rate == 1.0) {
    [_player pause];
    _toolbar.items = @[ _playButton, _progressBar ];
  } else {
    [_player play];
    _toolbar.items = @[ _pauseButton, _progressBar ];
  }
}

@end
