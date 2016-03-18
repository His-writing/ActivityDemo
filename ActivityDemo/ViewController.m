//
//  ViewController.m
//  ActivityDemo
//
//  Created by china on 16/3/17.
//  Copyright © 2016年 china. All rights reserved.
//

#import "ViewController.h"
#import "OpenInAppActivity.h"

@interface ViewController ()
@property (nonatomic, strong) UIPopoverController *activityPopoverController;

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



- (IBAction)butonClick:(id)sender {
    
    //文本
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"empty" ofType:@"pdf"];
    NSURL *URL = [NSURL fileURLWithPath:filePath];
    
    OpenInAppActivity *openInAppActivity = [[OpenInAppActivity alloc] initWithView:self.view andRect:((UIButton *)sender).frame];
    
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL,@"链接：https://itunes.apple.com/cn/app/ying-zi-chuan-shuo2016/id1028801683?mt=8"] applicationActivities:@[openInAppActivity]];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        // Store reference to superview (UIActionSheet) to allow dismissal
        openInAppActivity.superViewController = activityViewController;
        // Show UIActivityViewController
        [self presentViewController:activityViewController animated:YES completion:NULL];
    } else {
        // Create pop up
        self.activityPopoverController = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
        // Store reference to superview (UIPopoverController) to allow dismissal
        openInAppActivity.superViewController = self.activityPopoverController;
        // Show UIActivityViewController in popup
        [self.activityPopoverController presentPopoverFromRect:((UIButton *)sender).frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }

}
@end
