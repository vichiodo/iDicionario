//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonView.h"

@interface DicionarioViewController : UIViewController

@property SingletonView *sv;
@property UIImageView *imagem;
@property UILabel *nome;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end
