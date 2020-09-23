//
//  ViewController.m
//  RACRun
//
//  Created by da ghua on 2020/9/23.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
#import "RacSubjectDelegateController.h"
#import "RedView.h"
#import "Masonry.h"

@interface ViewController ()

@property(strong, nonatomic) RedView *redView;

@property(strong, nonatomic) UITextField *filed;

@property(strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//signal创建
    
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        NSLog(@"*****");
//        [subscriber sendNext:@"123"];
//        [subscriber sendCompleted];
//        NSLog(@"-----");
//        return [RACDisposable disposableWithBlock:^{
//            NSLog(@"信号销毁了");
//        }];
//    }];
//
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"信号触发了 %@", x);
//    }];
//
//    [signal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"信号触发了222 %@", x);
//    }];
    
//RACSubject创建
    
//    RACSubject *sub = [RACSubject subject];
//    
//    [sub subscribeNext:^(id  _Nullable x) {
//        NSLog(@"第一个订阅者 %@", x);
//    }];
//    
//    [sub subscribeNext:^(id  _Nullable x) {
//        NSLog(@"第2个订阅者 %@", x);
//    }];
//    
//    [sub sendNext:@1];
    
    RedView *rView = [[RedView alloc] init];
    [self.view addSubview:rView];
    [rView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        make.center.equalTo(self.view);
    }];

    //rac signalForSelector
    [[rView rac_signalForSelector:@selector(btnAction:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"点击红色按钮");
    }];
    
    

    //rac kvo
    [[rView rac_valuesAndChangesForKeyPath:@"center" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(RACTwoTuple<id,NSDictionary *> * _Nullable x) {
        NSLog(@"center change %@", x);
    }];
    
    
    UITextField *field = [[UITextField alloc] init];
    field.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:field];
    [field mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rView.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(@100);
    }];
    self.filed = field;
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"key board will show %@", x);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"lol";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(100);
            make.centerX.equalTo(self.view);
    }];
    self.label = label;
    
    RAC(self.label, text) = self.filed.rac_textSignal;
    
//    [[self.filed.rac_textSignal skip:1] subscribeNext:^(NSString * _Nullable x) {
//            NSLog(@"filed change --- %@", x);
//        }];
    
//    [[self.filed.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
//        return value.length >0;
//    }] subscribeNext:^(NSString * _Nullable x) {
//        NSLog(@"filed change --- %@", x);
//    }];
    
    [[self.filed.rac_textSignal distinctUntilChanged] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"filed change --- %@", x);
    }];
    
    
    [[[self.filed.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return value.length > 0;
    }] distinctUntilChanged] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"filed change --- %@", x);
    }];
    
    //    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
    ////        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //            NSLog(@"request data ing...");
    ////        });
//
//        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//            [subscriber sendNext:@"send request data"];
//            [subscriber sendCompleted];
//            return nil;
//        }];
//    }];
//
//    [[[command executionSignals] switchToLatest] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"commond subscribeNest --- %@", x);
//    }];
//
//    [command execute:@1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];
    //delegate应用
    
//    RacSubjectDelegateController *vc = [[RacSubjectDelegateController alloc] init];
//    RACSubject *sub = [RACSubject subject];
//    [sub subscribeNext:^(id  _Nullable x) {
//        NSLog(@"Delegate call back %@", x);
//    }];
//    vc.subjectDelegate = sub;
//    [self.navigationController pushViewController:vc animated:YES];
}


@end
