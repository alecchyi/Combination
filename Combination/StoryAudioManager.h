//
//  StoryAudioManager.h
//  Combination
//
//  Created by Alec on 14/11/19.
//  Copyright (c) 2014年 ___alecchyi___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAudioRecorder.h>


@interface StoryAudioManager : NSObject

@property (nonatomic,strong) NSFileManager *audioFileManager;

+ (void)recordAudio;

@end
