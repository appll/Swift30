//
//  LoginViewModel.h
//  RACRun
//
//  Created by da ghua on 2020/9/24.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"
@class AccountModel;

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property(strong, nonatomic) AccountModel *accountM;

@property(strong, nonatomic) RACSignal *enableSignal;

@property(strong, nonatomic) RACCommand *loginCommand;

@end

NS_ASSUME_NONNULL_END
