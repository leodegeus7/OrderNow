//
//  Item.h
//  OrderNow
//
//  Created by João Vasconcelos on 4/8/15.
//  Copyright (c) 2015 Leonardo Geus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property NSString *nome, *descricao, *img;

@property NSNumber *preco, *tempo2;

+(id)initComDicionario:(NSDictionary *)dict;

@end
