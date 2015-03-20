//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "DicionarioViewController.h"
#import "EditarViewController.h"

@implementation DicionarioViewController
@synthesize imagem, nome, toolBar, imagemAtual;


-(void) viewDidLoad {
    [super viewDidLoad];
    _sv = [SingletonView instance];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSString* sub = [NSString stringWithFormat:@"%c",[[_sv.palavras objectAtIndex:_sv.linha] characterAtIndex:0]];
    self.navigationItem.title = sub;
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    
    self.navigationController.toolbarHidden=NO;
    UIBarButtonItem *flexiableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar:)];
    NSArray *items = [NSArray arrayWithObjects: flexiableItem, item1, flexiableItem, nil];
    self.toolbarItems = items;
    
    
    imagem = [[UIImageView alloc]initWithFrame:CGRectMake(90, 150, 130, 130)];
    nome = [[UILabel alloc]initWithFrame:CGRectMake(90, 300, 150, 50)];
    
    
    
    nome.text =[_sv.palavras objectAtIndex:_sv.linha];
    nome.textAlignment = NSTextAlignmentCenter;
    imagem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%c.png",[[_sv.palavras objectAtIndex:_sv.linha] characterAtIndex:0]]];
    [UIView animateWithDuration:2.0 animations:^{
        imagem.alpha = 0;
    }];
    
    imagem.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(zoom:)];
    [imagem addGestureRecognizer:recognizer];
    
    [self.view addSubview:nome];
    [self.view addSubview:imagem];
}


-(void)viewWillAppear:(BOOL)animated{
    nome.text =[_sv.palavras objectAtIndex:_sv.linha];
    nome.textAlignment = NSTextAlignmentCenter;
    imagem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%c.png",[[_sv.palavras objectAtIndex:_sv.linha] characterAtIndex:0]]];
    [UIView animateWithDuration:2.0 animations:^{
        imagem.alpha = 0;
    }];
}



-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:2.0 animations:^{
        imagem.alpha = 1;
    }];

}


-(void)next:(id)sender {
    DicionarioViewController *pro = [[DicionarioViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    _sv.linha++;

    if(_sv.linha == 26){
        _sv.linha = 0;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.navigationController pushViewController:pro animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
        
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)back:(id)sender {
    
    DicionarioViewController *ant = [[DicionarioViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    _sv.linha--;

    if(_sv.linha == -1){
        _sv.linha = 25;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.navigationController pushViewController:ant animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
        
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)editar:(id)sender{
    EditarViewController *editar = [[EditarViewController alloc]init];
    
    [self.navigationController pushViewController:editar animated:YES];
}

-(void)zoom:(UILongPressGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.2 animations:^{
            imagem.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
        }];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.2 animations:^{
            imagem.transform = CGAffineTransformMakeScale(1.f, 1.f);
        }];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint ponto = [touch locationInView:self.view];
    if (CGRectContainsPoint(imagem.frame, ponto)) {
        imagemAtual = YES;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch= [touches anyObject];
    CGPoint local=[touch locationInView:self.view];
    if(imagemAtual){
        [UIView animateWithDuration:0 animations:^{
                imagem.transform=CGAffineTransformMakeTranslation(local.x-imagem.center.x, local.y-imagem.center.y);
        }];
    }
}
@end
