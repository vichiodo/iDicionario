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
        _palavras = [[NSMutableArray alloc ]initWithObjects:@"Amarelinha", @"Batata Quente", @"Corre Cotia", @"Detetive", @"Elefantinho Colorido", @"Forca", @"Gincana", @"Hex", @"Ioiô", @"Jogo da velha", @"Kit de Magica", @"Liga os Pontos", @"Mimica", @"Nós Quatro", @"O Mestre Mando", @"Pega-Pega", @"Queimada", @"Roda Pião", @"Serra, Serra, Serrador", @"Taco", @"Uno", @"Vareta", @"War", @"Xadrez", @"Y", @"ZigZag", nil];
    }
    
    return self;
}

-(void) initBanco{
    _palavras = [[NSArray alloc ]initWithObjects:@"Amarelinha", @"Batata Quente", @"Corre Cotia", @"Detetive", @"Elefantinho Colorido", @"Forca", @"Gincana", @"Hex", @"Ioiô", @"Jogo da velha", @"Kit de Magica", @"Liga os Pontos", @"Mimica", @"Nós Quatro", @"O Mestre Mando", @"Pega-Pega", @"Queimada", @"Roda Pião", @"Serra, Serra, Serrador", @"Taco", @"Uno", @"Vareta", @"War", @"Xadrez", @"Y", @"ZigZag", nil];
    
    
    _realm = [RLMRealm defaultRealm];
    
    
    
    for (int i =0; i<[_palavras count]; i++) {
        Banco *bd = [[Banco alloc]init];
    
        bd.palavra = [_palavras firstObject];
    
        [_realm beginWriteTransaction];
    
        [_realm addObject:bd];
    
        [_realm commitWriteTransaction];
    }
    //fim for
    
    RLMResults *resultadosDaBusca;
    
    resultadosDaBusca = [Banco objectsWhere:@"palavra='alguma coisa'"];
}

@end