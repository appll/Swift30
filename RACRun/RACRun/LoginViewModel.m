//
//  LoginViewModel.m
//  RACRun
//
//  Created by da ghua on 2020/9/24.
//

#import "LoginViewModel.h"
#import "AccountModel.h"

@interface LoginViewModel ()


@end

@implementation LoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initBind];
    }
    return self;
}

- (void)initBind {
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:@"login success"];
                [subscriber sendCompleted];
            });
            return nil;
        }];
    }];
    
    _enableSignal = [RACSignal combineLatest:@[RACObserve(self.accountM, account), RACObserve(self.accountM, pwd)] reduce:^id (NSString *account, NSString *pwd){
        return @(account.length > 0 && pwd.length > 0);
    }];
    
    [self.loginCommand.executing subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            NSLog(@"正在登录中...");
        } else {
            NSLog(@"登录完成");
        }
    }];
    
    [[self.loginCommand.executionSignals switchToLatest] subscribeNext:^(id  _Nullable x) {
        NSLog(@"done --- %@", x);
    }];
}

- (AccountModel *)accountM {
    if (!_accountM) {
        _accountM = [[AccountModel alloc] init];
    }
    return _accountM;
}

@end
