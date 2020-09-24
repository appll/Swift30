//
//  LoginViewController.m
//  RACRun
//
//  Created by da ghua on 2020/9/24.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "ReactiveObjC.h"
#import "AccountModel.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property(strong, nonatomic) LoginViewModel *viewM;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bindModel];
}

- (void)bindModel {
    
    RAC(self.viewM.accountM, account) = self.accountTF.rac_textSignal;
    RAC(self.viewM.accountM, pwd) = self.pwdTF.rac_textSignal;
    
    RAC(self.loginBtn, enabled) = self.viewM.enableSignal;
    
    @weakify(self);
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            //处理登录请求
        @strongify(self);
        [self.viewM.loginCommand execute:nil];
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (LoginViewModel *)viewM {
    if (!_viewM) {
        _viewM = [[LoginViewModel alloc] init];
    }
    return  _viewM;
}

@end
