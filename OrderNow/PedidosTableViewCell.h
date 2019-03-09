//
//  PedidosTableViewCell.h
//  OrderNow
//
//  Created by Matheus Orth on 4/11/15.
//  Copyright (c) 2015 Leonardo Geus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PedidosTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagePedido;
@property (weak, nonatomic) IBOutlet UILabel *labelNome;
@property (weak, nonatomic) IBOutlet UILabel *labelPreco;
@property (strong, nonatomic) IBOutlet UILabel *swipeConfirmarLabel;


@end
