//
//  ViewController.m
//  RACRun
//
//  Created by da ghua on 2020/9/23.
//

#import "ViewController.h"
#import "ReactiveObjC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    RACSubject *sub = [RACSubject subject];
    
    [sub subscribeNext:^(id  _Nullable x) {
        NSLog(@"第一个订阅者 %@", x);
    }];
    
    [sub subscribeNext:^(id  _Nullable x) {
        NSLog(@"第2个订阅者 %@", x);
    }];
    
    [sub sendNext:@1];
}


@end
