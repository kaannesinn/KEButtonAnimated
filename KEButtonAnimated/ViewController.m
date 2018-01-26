//
//  ViewController.m
//  KEButtonAnimated
//
//  Created by Kaan Esin on 26.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import "ViewController.h"
#import "PresentedViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnMiddle;
@property (nonatomic) BOOL isDisappeared;


- (IBAction)btnClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.btnMiddle.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(self.btnMiddle.bounds.size.width/2, self.btnMiddle.bounds.size.height/2)];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = self.btnMiddle.bounds;
    shape.path = path.CGPath;
    self.btnMiddle.layer.mask = shape;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.isDisappeared) {
        self.isDisappeared = NO;
        
        [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.btnMiddle.layer.transform = CATransform3DScale(self.btnMiddle.layer.transform, 1/32.0, 1/32.0, 1/32.0);
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.btnMiddle.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
                    self.btnMiddle.layer.transform = CATransform3DRotate(self.btnMiddle.layer.transform,  M_PI, 0.0f, 1.0f, 0.0f);
                    self.btnMiddle.layer.transform = CATransform3DRotate(self.btnMiddle.layer.transform,  M_PI, 0.0f, 1.0f, 0.0f);
                } completion:^(BOOL finished) {
                    if (finished) {
                        [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.btnMiddle.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
                        } completion:^(BOOL finished) {
                            if (finished) {
                                
                            }
                        }];
                    }
                }];
            }
        }];
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    self.isDisappeared = YES;
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnClicked:(id)sender {
    [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.btnMiddle.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5);
        self.btnMiddle.alpha = 0.5;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.btnMiddle.layer.transform = CATransform3DScale(self.btnMiddle.layer.transform, 2.0, 2.0, 2.0);
                self.btnMiddle.layer.transform = CATransform3DRotate(self.btnMiddle.layer.transform,  M_PI, 0.0f, 1.0f, 0.0f);
                self.btnMiddle.layer.transform = CATransform3DRotate(self.btnMiddle.layer.transform,  M_PI, 0.0f, 1.0f, 0.0f);
                self.btnMiddle.alpha = 1.0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:0.8 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        self.btnMiddle.layer.transform = CATransform3DScale(self.btnMiddle.layer.transform, 32.0, 32.0, 32.0);
                    } completion:^(BOOL finished) {
                        if (finished) {
                            PresentedViewController *presentedVC = (PresentedViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PresentedViewController"];
                            presentedVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                            [self presentViewController:presentedVC animated:NO completion:nil];
                        }
                    }];
                }
            }];
        }
    }];
}
@end
