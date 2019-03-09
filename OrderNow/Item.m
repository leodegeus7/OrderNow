//
//  Item.m
//  OrderNow
//
//  Created by João Vasconcelos on 4/8/15.
//  Copyright (c) 2015 Leonardo Geus. All rights reserved.
//

#import "Item.h"

@implementation Item

+(id)initComDicionario:(NSDictionary *)dict {
    Item *novoItem = [[self alloc]init];
    novoItem.nome = dict[@"nome"];
    novoItem.descricao = dict[@"descricao"];
    novoItem.img = dict[@"imagem"];
    novoItem.preco = dict[@"preco"];
    novoItem.tempo2 = dict[@"tempo"];
    return novoItem;
}

@end
