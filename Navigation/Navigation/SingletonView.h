//
//  SingletonView.h
//  Navigation
//
//  Created by Vivian Chiodo Dias on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "Banco.h"

@interface SingletonView : NSObject

+(SingletonView*)instance;

@property RLMRealm *realm;
@property (strong, nonatomic) NSMutableArray *palavras;
@property int linha;

-(void)alterarPalavra:(NSString *)palavra;
-(Banco *)buscarNaLinha:(NSString *)palavra;

@end
