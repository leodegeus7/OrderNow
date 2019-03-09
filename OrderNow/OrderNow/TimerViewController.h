//
//  TimerViewController.h
//  OrderNow
//
//  Created by Leonardo Geus on 07/04/15.
//  Copyright (c) 2015 Leonardo Geus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController

@property NSArray *tempo;
@property NSArray *descricao;
@property float segundos;
@property float segundostimer1;
@property float segundostimer2;
@property float segundostimer3;
@property float segundostimer4;
@property float temporelogio;
@property float timerteste;
@property (weak, nonatomic) IBOutlet UILabel *timerlabel;



@end
