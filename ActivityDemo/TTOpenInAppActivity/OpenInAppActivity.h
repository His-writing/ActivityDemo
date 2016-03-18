

#import <UIKit/UIKit.h>

@class OpenInAppActivity;

@protocol OpenInAppActivityDelegate <NSObject>
@optional
- (void)openInAppActivityWillPresentDocumentInteractionController:(OpenInAppActivity*)activity;
- (void)openInAppActivityDidDismissDocumentInteractionController:(OpenInAppActivity*)activity;
- (void)openInAppActivityDidEndSendingToApplication:(OpenInAppActivity*)activity;
- (void)openInAppActivityDidSendToApplication:(NSString*)application;
@end

@interface OpenInAppActivity : UIActivity <UIDocumentInteractionControllerDelegate>

@property (nonatomic, weak) id superViewController;
@property (nonatomic, weak) id<OpenInAppActivityDelegate> delegate;

- (id)initWithView:(UIView *)view andRect:(CGRect)rect;
- (id)initWithView:(UIView *)view andBarButtonItem:(UIBarButtonItem *)barButtonItem;

- (void)dismissDocumentInteractionControllerAnimated:(BOOL)animated;

@end
