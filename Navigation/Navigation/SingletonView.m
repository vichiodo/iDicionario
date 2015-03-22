//
//  SingletonView.m
//  Navigation
//
//  Created by Vivian Chiodo Dias on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "SingletonView.h"

@implementation SingletonView
@synthesize realm, linha, palavras;

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
        linha = 0;
        [self initBanco];
    }
    
    return self;
}


//------------------------------------- DEVIA INICIALIZAR O BANCO
-(void) initBanco{
    realm = [RLMRealm defaultRealm];
    palavras = [[NSMutableArray alloc ]initWithObjects:@"Amarelinha", @"Batata Quente", @"Corre Cotia", @"Detetive", @"Elefantinho Colorido", @"Forca", @"Gincana", @"Hex", @"Ioiô", @"Jogo da velha", @"Kit de Magica", @"Liga os Pontos", @"Mimica", @"Nós Quatro", @"O Mestre Mando", @"Pega-Pega", @"Queimada", @"Roda Pião", @"Serra, Serra, Serrador", @"Taco", @"Uno", @"Vareta", @"War", @"Xadrez", @"Y", @"ZigZag", nil];
    
    for (int i =0; i<palavras.count; i++) {
        Banco *bd = [[Banco alloc]init];
    
        bd.palavra = [palavras objectAtIndex:i];
        bd.imagem = [NSString stringWithFormat:@"%@", [NSString stringWithFormat:@"%c",[[palavras objectAtIndex:i] characterAtIndex:0]]];
        
        
        [realm beginWriteTransaction];
    
        [realm addObject:bd];
    
        [realm commitWriteTransaction];
    }
    
}

//---------------------------------------------- DEVIA RETORNAR O OBJETO NO BANCO, MAS ACHO QUE NAO ESTA
-(Banco *)buscarNaLinha:(NSString *)palavra{
    RLMResults *resultados = [Banco objectsWhere:@"palavra=%@",palavra];
    for(Banco *resultado in resultados){
            return resultado;
    }
    return nil;
}


//--------------- DEVIA MUDAR A PALAVRA NO BANCO, MAS COMO NAO ESTA PEGANDO O BANCO, ACHO QUE NAO MUDA TBM
-(void)alterarPalavra:(NSString *)palavra{
    RLMResults *resultados = [Banco objectsWhere:@"palavra=%@",palavra];
    for(Banco *resultado in resultados){
        [realm beginWriteTransaction];
        
        resultado.palavra = palavra;
        
        [realm commitWriteTransaction];
    }
}

@end