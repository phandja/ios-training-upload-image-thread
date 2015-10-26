//
//  ImageLoader.m
//  Multithread
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ImageLoader.h"

@implementation ImageLoader

+ (id)sharedInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)loadImageDataFromUrl:(NSString *)string
                       start:(void (^)(void))startBlock
                  completion:(void (^)(NSData *imageData))completion {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        startBlock();
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:string]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(data);
        });
    });
}

@end
