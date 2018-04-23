//
//  ViewController.m
//  MyScrollView
//
//  Created by ruijia lin on 4/22/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIView *redView;
@property UIView *greenView;
@property UIView *blueView;
@property UIView *yellowView;
@property UIPanGestureRecognizer *pan;
@property MyScrollView *customView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panScrollView:)];
    self.customView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1200)];
    self.customView.backgroundColor = [UIColor blackColor];
    self.customView.userInteractionEnabled = YES;
    self.customView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.customView addGestureRecognizer:self.pan];
    [self.view addSubview:self.customView];
    
    self.redView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.redView.backgroundColor = [UIColor redColor];
    [self.customView addSubview:self.redView];
    
    self.greenView = [[UIView alloc]initWithFrame:CGRectMake(150, 150, 150, 200)];
    self.greenView.translatesAutoresizingMaskIntoConstraints = NO;
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.customView addSubview:self.greenView];
    
    self.blueView = [[UIView alloc]initWithFrame:CGRectMake(40, 400, 200, 150)];
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.customView addSubview:self.blueView];
    
    self.yellowView = [[UIView alloc]initWithFrame:CGRectMake(100, 1000, 180, 150)];
    self.yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    self.yellowView.backgroundColor = [UIColor yellowColor];
    [self.customView addSubview:self.yellowView];
    
}

-(void)panScrollView:(UIPanGestureRecognizer *)sender{
    CGPoint translationInView = [sender translationInView:self.customView];

    CGRect oldBound = self.customView.bounds;
    
    CGRect newBound = CGRectMake(oldBound.origin.x, oldBound.origin.y - translationInView.y, self.customView.frame.size.width, self.customView.frame.size.height);
    
    if (newBound.origin.y <= 0){
        newBound = CGRectMake(oldBound.origin.x, 0, self.customView.frame.size.width, self.customView.frame.size.height);
    }else if (newBound.origin.y >= self.customView.contentSize.height - self.view.frame.size.height){
        newBound = CGRectMake(oldBound.origin.x, self.customView.contentSize.height - self.view.frame.size.height, self.customView.frame.size.width, self.customView.frame.size.height);
    }
    
    self.customView.bounds = newBound;
    NSLog(@"%@", NSStringFromCGRect(newBound));
    [sender setTranslation:CGPointZero inView:self.customView];
}

@end
