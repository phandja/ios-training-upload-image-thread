//
//  ViewController.m
//  Multithread
//
//  Created by Treinamento Mobile on 10/26/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"
#import "ImageLoader.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *myImage;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loadingImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.loadingImage setHidden:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - IBActions

- (IBAction)loadImage:(id)sender {
    NSString *boobs = @"http://hellogiggles.hellogiggles.netdna-cdn.com/wp-content/uploads/2014/04/14/2013-Kate-Upton-HD-Wallpapers-e1360405079523-500x375c.jpeg";
    //NSString *nasa = @"http://go.nasa.gov/1NvITOM";
    
    [[ImageLoader sharedInstance] loadImageDataFromUrl:boobs start:^{
        self.myImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.loadingImage setHidden:NO];
    }completion:^(NSData *imageData)    {
        [self.loadingImage setHidden:YES];
        self.myImage.image = [UIImage imageWithData:imageData];
    }];

}

@end
