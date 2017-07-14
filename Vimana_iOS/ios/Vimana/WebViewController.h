#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController { // <UIWebViewDelegate, UIActionSheetDelegate> {

	UIWebView	*theWebView;
	NSString	*urlString;
//    UIActivityIndicatorView  *whirl;

}

@property (nonatomic, retain) NSString *urlString;

@end
