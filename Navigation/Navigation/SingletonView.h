//
//  SingletonView.h
//  Navigation
//
//  Created by Vivian Chiodo Dias on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonView : NSObject

+(SingletonView*)instance;

@property (strong, nonatomic) NSArray *palavras;
@property (strong, nonatomic) NSArray *imagens;
@property int linha;

@end
