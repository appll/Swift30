//
//  RedView.m
//  RACRun
//
//  Created by da ghua on 2020/9/23.
//

#import "RedView.h"
#import "Masonry.h"
#import "ReactiveObjC.h"

@interface RedView ()

@property(strong, nonatomic) UIButton *btn;

@end

@implementation RedView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundColor:[UIColor greenColor]];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
//    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    @weakify(self);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self btnAction:nil];
    }];
    self.btn = btn;
}

- (void)btnAction:(id)sender {
    NSLog(@"%s", __func__);
}

@end
