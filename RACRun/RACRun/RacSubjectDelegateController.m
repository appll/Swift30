//
//  RacSubjectDelegateController.m
//  RACRun
//
//  Created by da ghua on 2020/9/23.
//

#import "RacSubjectDelegateController.h"

@interface RacSubjectDelegateController ()

@end

@implementation RacSubjectDelegateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.subjectDelegate) {
        [self.subjectDelegate sendNext:@1];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
