#import "QiCodeGenerationViewController.h"
#import "QiCodeManager.h"

@interface QiCodeGenerationViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end

@implementation QiCodeGenerationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _codeTextField.text = _code;
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}


#pragma mark - Action functions

- (IBAction)generateQRCode:(id)sender {
    
    __block NSString *text = _codeTextField.text;
    __block CGSize size = _codeImageView.bounds.size;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *code = text.length? text: self.codeTextField.placeholder;
        UIImage *codeImage = [QiCodeManager generateQRCode:code size:size];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.codeImageView.image = codeImage;
        });
    });
}

- (IBAction)generateCode128:(id)sender {
    
    __block NSString *text = _codeTextField.text;
    __block CGSize size = _codeImageView.bounds.size;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *code = text.length? text: self.codeTextField.placeholder;
        UIImage *codeImage = [QiCodeManager generateCode128:code size:size];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.codeImageView.image = codeImage;
        });
    });
}

- (IBAction)codeImageViewTapped:(id)sender {
    
    NSString *code = _codeTextField.text.length? _codeTextField.text: _codeTextField.placeholder;
    NSURL *codeURL = [NSURL URLWithString:code];
    
    if ([[UIApplication sharedApplication] canOpenURL:codeURL]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Use Safari to open the link" message:codeURL.absoluteString preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *confimAction = [UIAlertAction actionWithTitle:@"open" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:codeURL];
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:confimAction];
        [self.navigationController presentViewController:alertController animated:YES completion:nil];
    }
}

- (IBAction)viewTapped:(id)sender {
    
    [self.view endEditing:YES];
}

@end
