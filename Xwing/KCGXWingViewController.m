//
//  KCGXWingViewController.m
//  Xwing
//
//  Created by Adrian Perez Lopez on 25/1/16.
//  Copyright © 2016 Adrian Perez Lopez. All rights reserved.
//

#import "KCGXWingViewController.h"

@interface KCGXWingViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *xwingView;
@property (weak, nonatomic) IBOutlet UIImageView *spaceView;

@end

@implementation KCGXWingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Creamos el reconocedor de Taps
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(tap:)];
    
    //Creo el reconocedor de SWIPE IZQUIERDA
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(swipe:)];
    
    //Creo el reconocedor de SWIPE DERECHA
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(swipe:)];
    
    //Lo encasquetamos a self.spaceView
    [self.spaceView addGestureRecognizer:tap];

    [self.spaceView addGestureRecognizer:swipeLeft];
    
    [self.spaceView addGestureRecognizer:swipeRight];
    
}

//Animaciones al tocar pantalla
-(void) tap: (UITapGestureRecognizer *) recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        
        UIViewAnimationOptions options =
            UIViewAnimationOptionCurveEaseInOut |
            UIViewAnimationOptionBeginFromCurrentState;
        
        //Translación
        [UIView animateWithDuration:1.0
                              delay:0.0
                            options:options
                         animations:^{
            
                             self.xwingView.center =
                                [recognizer locationInView:
                                 self.spaceView];
            
                         }completion:^(BOOL finished) {
            
                         }];
        
        //Rotación
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:options
                         animations:^{
            
                             self.xwingView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.5
                                  delay:0.0
                                options:options
                             animations:^{
                                 
                                 self.xwingView.transform = CGAffineTransformIdentity;
                             
                             } completion:^(BOOL finished) {
                                 
                                    //NADA
                                 
                                 }];
            
        }];
        
    }
    
}

-(void) swipe: (UISwipeGestureRecognizer *) recognizer {
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        UIViewAnimationOptions options =
        UIViewAnimationOptionCurveEaseInOut |
        UIViewAnimationOptionBeginFromCurrentState;
    
        //SWIPE
        [UIView animateWithDuration:0.9
                              delay:0.0
                            options:options
                         animations:^{
            
                             self.xwingView.transform = CGAffineTransformMakeRotation(M_2_PI);
        
                         } completion:^(BOOL finished) {
                             
                             //NADA
                         
                         }];
        
    }
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        
        UIViewAnimationOptions options =
        UIViewAnimationOptionCurveEaseInOut |
        UIViewAnimationOptionBeginFromCurrentState;
        
        //SWIPE
        [UIView animateWithDuration:0.9
                              delay:0.0
                            options:options
                         animations:^{
                             
                             self.xwingView.transform = CGAffineTransformMakeRotation(M_PI);
                             
                         } completion:^(BOOL finished) {
                             
                             //NADA
                             
                         }];
        
    }
    
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

@end
