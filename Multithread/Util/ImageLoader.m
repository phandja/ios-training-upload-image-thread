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
    static ImageLoader *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)loadImageDataFromUrl:(NSString *)url {
    NSURL *imageUrl = [NSURL URLWithString:url];
    NSData *imageSource = [NSData dataWithContentsOfURL:imageUrl];
    return imageSource;
}

@end
