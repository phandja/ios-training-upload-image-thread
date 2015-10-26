//
//  ImageLoader.h
//  Multithread
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageLoader : NSObject

+ (id)sharedInstance;
- (id)loadImageDataFromUrl:(NSString *)url;

@end
