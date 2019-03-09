//
//  CustomTableViewCell.h
//  OrderNow
//
//  Created by Leonardo Geus on 07/04/15.
//  Copyright (c) 2015 Leonardo Geus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagecell;
@property (weak, nonatomic) IBOutlet UILabel *labelcell;
@property (weak, nonatomic) IBOutlet UITextView *textfieldcell;
@property (weak, nonatomic) IBOutlet UIImageView *imagecellbebida;
@property (weak, nonatomic) IBOutlet UILabel *labelcellbebida;
@property (weak, nonatomic) IBOutlet UITextView *textfieldcellbebida;
@property (weak, nonatomic) IBOutlet UIImageView *imagecellsobremesa;
@property (weak, nonatomic) IBOutlet UILabel *labelcellsobremesa;

@property (weak, nonatomic) IBOutlet UITextView *textfieldcellsobremesa;

// Label de instrução do swipe
@property (strong, nonatomic) IBOutlet UILabel *swipeComidaLabel;
@property (strong, nonatomic) IBOutlet UILabel *swipeBebidaLabel;
@property (strong, nonatomic) IBOutlet UILabel *swipeSobremesaLabel;


@end
