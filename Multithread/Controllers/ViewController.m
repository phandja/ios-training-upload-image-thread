//
//  ViewController.m
//  Multithread
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *myImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - IBActions

- (IBAction)loadImage:(id)sender {
    NSURL *imageUrl = [NSURL URLWithString:@"http://hellogiggles.hellogiggles.netdna-cdn.com/wp-content/uploads/2014/04/14/2013-Kate-Upton-HD-Wallpapers-e1360405079523-500x375c.jpeg"];
    //NSURL *imageUrl = [NSURL URLWithString:@"http://go.nasa.gov/1NvITOM"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSLog(@"Loading in background!");
        NSData *imageSource = [NSData dataWithContentsOfURL:imageUrl];
        // every interface operations must be runned in main queue!!!
        dispatch_async(dispatch_get_main_queue(), ^{
            self.myImage.image = [UIImage imageWithData:imageSource];
        });
        NSLog(@"TUFF!");
    });
}

@end
