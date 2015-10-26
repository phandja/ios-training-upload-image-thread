//
//  ImageLoader.h
//  Multithread
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ImageLoaderStart)(void);
typedef void(^ImageLoaderCompletion)(NSData *imageData);

@interface ImageLoader : NSObject

+ (instancetype)sharedInstance;
- (void)loadImageDataFromUrl:(NSString *)string
                       start:(ImageLoaderStart)startBlock
                  completion:(ImageLoaderCompletion)completion;

@end
