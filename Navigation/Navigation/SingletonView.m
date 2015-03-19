//
//  SingletonView.m
//  Navigation
//
//  Created by Vivian Chiodo Dias on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "SingletonView.h"

@implementation SingletonView

static SingletonView *instancia = nil;

+(SingletonView *)instance{
    if(!instancia){
        instancia = [[super alloc]init];
    }
    return instancia;
}
-(instancetype) init {
    self = [super init];
    if (self) {
        _linha = 0;
        _palavras = [[NSArray alloc ]initWithObjects:@"Amarelinha", @"Batata Quente", @"Corre Cotia", @"Detetive", @"Elefantinho Colorido", @"Forca", @"Gincana", @"Hex", @"Ioiô", @"João Roubou Pão", @"Kit de Magica", @"Liga os Pontos", @"Mimica", @"Nós Quatro", @"O Mestre Mando", @"Pega-Pega", @"Queimada", @"Roda Pião", @"Serra, Serra, Serrador", @"Taco", @"Uno", @"Vareta", @"War", @"Xadrez", @"Y", @"ZigZag", nil];
        _imagens = [[NSArray  alloc]initWithObjects:@"ImagemA", @"ImagemB", @"ImagemC", nil];
    }
    
    return self;
}

@end