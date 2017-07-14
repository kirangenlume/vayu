//
//  LoginViewController.m
//  Vayuyan
//
//  Created by Vamsi Chintalapati on 10/15/16.
//  Copyright © 2016 Vayuyan. All rights reserved.
//

#import "LoginViewController.h"
#import "LeftImageTextField-Swift.h"
#import "LoginService.h"
#import "RouterInfo.h"

@interface LoginViewController ()<ResponseSProtocol,UITextFieldDelegate>
- (IBAction)loginAction:(id)sender;
    @property (weak, nonatomic) IBOutlet LeftImageTextField *emailIDTextField;
    @property (weak, nonatomic) IBOutlet LeftImageTextField *passwordTextField;
    @property (nonatomic) LoginService *loginService;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        //email corner radius and shadow color
        _emailIDTextField.layer.masksToBounds = NO;
        _emailIDTextField.layer.shadowRadius = 3.0;
        _emailIDTextField.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
        _emailIDTextField.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        _emailIDTextField.layer.shadowOpacity = 1.0;
        _emailIDTextField.layer.cornerRadius = 3.0;
        _emailIDTextField.delegate = self;
    
        //password textfiekd corner radius and shadow color
        
        _passwordTextField.layer.masksToBounds = NO;
        _passwordTextField.layer.shadowRadius = 3.0;
        _passwordTextField.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
        _passwordTextField.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        _passwordTextField.layer.shadowOpacity = 1.0;
        _passwordTextField.layer.cornerRadius = 3.0;
        _passwordTextField.delegate = self;
    
        
    _loginService =  [[LoginService alloc]  init];
    _loginService.delegate = self;
    
        
        
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
        [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginAction:(id)sender {
    
 
    [_loginService sendRequestForLoginService:1 withPayload:_emailIDTextField.text];

    
}

-(void)responseData:(NSDictionary *)response {
    
 
    NSLog(@"Login Service Response%@",response);
    NSLog(@"Login refID Response%@",[response objectForKey:@"refID"]);
    
    if ([[response objectForKey:@"refID"] intValue] == 1) {
 
    NSDictionary *responseDict = (NSDictionary*)response;
  
    if ([[responseDict objectForKey:@"responseData"] count] > 0) {
        
        NSString *receivedPassword = [[[responseDict objectForKey:@"responseData"] objectAtIndex:0] objectForKey:@"password"];
        NSString *userName = [[[responseDict objectForKey:@"responseData"] objectAtIndex:0] objectForKey:@"username"];
        NSString *emailText = [[[responseDict objectForKey:@"responseData"] objectAtIndex:0] objectForKey:@"email"];
        
        if ([[[responseDict objectForKey:@"responseData"] objectAtIndex:0] objectForKey:@"password"]) {
            
            if ([receivedPassword isEqualToString:_passwordTextField.text]) {
                
                [[NSUserDefaults standardUserDefaults] setObject:receivedPassword forKey:@"password"];
                [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:emailText forKey:@"email"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                RouterInfo *routerInfo = [[RouterInfo alloc] init];
                [routerInfo getRouterInfo:2 withPayload:emailText];
                [self performSegueWithIdentifier:@"LoginIdentifier" sender:self];
               
                
            } else {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Invalid username or password" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:ok];
                
                [self presentViewController:alertController animated:YES completion:nil];            }
            }
        }
    } else if ([[response objectForKey:@"refID"] intValue] == 2) {


    }
}

@end
