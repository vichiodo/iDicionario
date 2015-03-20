//
//  Palavra.h
//  Navigation
//
//  Created by Vivian Chiodo Dias on 20/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface Banco : RLMObject

@property NSString *palavra;
@property NSString *imagem;
@end
