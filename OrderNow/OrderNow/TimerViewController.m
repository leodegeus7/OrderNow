//
//  TimerViewController.m
//  OrderNow
//
//  Created by Leonardo Geus on 07/04/15.
//  Copyright (c) 2015 Leonardo Geus. All rights reserved.
//

#import "TimerViewController.h"
#import "TimeLineViewControl.h"
#import "DataManager.h"
#import "Item.h"
#import "PedidosTableViewCell.h"

@interface TimerViewController (){
    NSMutableArray *myData;
}

@end

@implementation TimerViewController

- (void)viewDidLoad {
    myData = [[DataManager getDataManager]dict][@"Pedidos"];
    float aux;
    aux=[[myData[0]tempo2] floatValue];
    for (int i =0; i<myData.count; i++) {
        if (aux<[[myData[i]tempo2] floatValue]) {
            aux=[[myData[i]tempo2] floatValue];
       }
    }
    _tempo = @[@"1",@"2",@"3",@"4",@"5"];
    _descricao = @[@"Pedido em aprovação",@"Em preparação",@"Prato Pronto!",@"Esperando garçom",@"Pedido Entregue"];
    _segundos = aux;
    _temporelogio = aux;
    _segundostimer1= _segundos*0.2;
    _segundostimer2= _segundos*0.55;
    _segundostimer3= _segundos*0.70;
    _segundostimer4= _segundos;
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:_tempo
                                                           andTimeDescriptionArray:_descricao
                                                                  andCurrentStatus:1
                                                                          andFrame:CGRectMake(50, 120, self.view.frame.size.width - 30, 200)];
    timeline.center = self.view.center;
    [self.view addSubview:timeline];
    
    [NSTimer scheduledTimerWithTimeInterval:_segundostimer1 target:self selector:@selector(timer1) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:_segundostimer2 target:self selector:@selector(timer2) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:_segundostimer3 target:self selector:@selector(timer3) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:_segundostimer4 target:self selector:@selector(timer4) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerdeteste) userInfo:nil repeats:YES];

}
-(void)timerdeteste{
    _timerlabel.text=[NSString stringWithFormat:@"%.f",_temporelogio];
    
    if (_temporelogio>0) {
        _temporelogio--;
    }
    else{
        _timerlabel.text=@"Bom apetite!";
    }

}


-(void)timer1{
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:_tempo
                                                           andTimeDescriptionArray:_descricao
                                                                  andCurrentStatus:2
                                                                          andFrame:CGRectMake(500, 120, self.view.frame.size.width - 30, 200)];
    timeline.center = self.view.center;
    
    [self.view addSubview:timeline];
    
}

-(void)timer2{
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:_tempo
                                                           andTimeDescriptionArray:_descricao
                                                                  andCurrentStatus:3
                                                                          andFrame:CGRectMake(500, 120, self.view.frame.size.width - 30, 200)];
    timeline.center = self.view.center;
    
    [self.view addSubview:timeline];
    
}

-(void)timer3{
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:_tempo
                                                           andTimeDescriptionArray:_descricao
                                                                  andCurrentStatus:4
                                                                          andFrame:CGRectMake(500, 120, self.view.frame.size.width - 30, 200)];
    timeline.center = self.view.center;
    
    [self.view addSubview:timeline];
    
}

-(void)timer4{
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:_tempo
                                                           andTimeDescriptionArray:_descricao
                                                                  andCurrentStatus:5
                                                                          andFrame:CGRectMake(500, 120, self.view.frame.size.width - 30, 200)];
    timeline.center = self.view.center;
    
    [self.view addSubview:timeline];
    
}




-(void)timer5{
    TimeLineViewControl *timeline = [[TimeLineViewControl alloc] initWithTimeArray:_tempo
                                                           andTimeDescriptionArray:_descricao
                                                                  andCurrentStatus:6
                                                                          andFrame:CGRectMake(500, 120, self.view.frame.size.width - 30, 200)];
    timeline.center = self.view.center;
    
    [self.view addSubview:timeline];
    
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
