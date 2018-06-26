//
//  ViewController.m
//  AVPlayer Loop
//
//  Created by Erik Bye on 6/26/18.
//  Copyright © 2018 Erik Bye. All rights reserved.
//

#import "ViewController.h"
#import "AVFoundation/AVPlayer.h"
#import "AVFoundation/AVPlayerItem.h"
#import "AVFoundation/AVAsset.h"

@interface ViewController ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, assign) BOOL isSeeking;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"pdbg"
                                         ofType:@"mp3"]];
    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
    self.player = player;
    [self.player play];

    CMTime time = self.player.currentTime;
    NSLog(@"Current Time%lld", time.value);
    NSLog(@"Duration %lld", self.player.currentItem.asset.duration.value);

    [self beginLooping];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)beginLooping {
    [NSTimer scheduledTimerWithTimeInterval:(1.0f / 5.0f) target:self selector:@selector(checkLoopingTimerAction:) userInfo:nil repeats:YES];
}

- (void)checkLoopingTimerAction:(id)sender {
#pragma unused(sender)
    if (self.isSeeking) {
        return;
    }

    CMTime loopS = CMTimeMakeWithSeconds(10, NSEC_PER_SEC);
    CMTime loopE = CMTimeMakeWithSeconds(12, NSEC_PER_SEC);
    Float64 loopStart = CMTimeGetSeconds(loopS);
    Float64 loopEnd = CMTimeGetSeconds(loopE);
    Float64 currentProgress = CMTimeGetSeconds(self.player.currentTime);
    NSLog(@"Current Progress: %f, Loop Start: %f, Loop End: %f", currentProgress, loopStart, loopEnd);
    if (currentProgress < loopStart || currentProgress >= loopEnd) {
        [self beginSeeking];
        CMTime mTime = CMTimeMakeWithSeconds(loopStart, NSEC_PER_SEC);
        [self.player seekToTime:mTime toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero completionHandler:^(BOOL finished) {
            [self endSeeking];
        }];
    }
}

- (void)beginSeeking {
    self.isSeeking = true;
    self.player.rate = 0.0;
    [self.player pause];

}

- (void)endSeeking {
    self.isSeeking = false;
    self.player.rate = 1.0;
    [self.player play];
}

@end
