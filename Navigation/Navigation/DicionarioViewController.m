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
@synthesize imagem, nome, toolBar, imagemAtual, bd;


-(void) viewDidLoad {
//Olha, eu tive muita dificuldade porque, na maioria das vezes, eu nao entendia muito bem como fazer,
//pesquisava e nao entendia onde colocar o codigo, pode parecer idiota mas tem vezes que eu realmente
//nao entendo onde colocar as coisas e isso é muito frustante para mim. Por isso, nao acho que o meu
// codigo esta tao bonito quanto devia.
    
    [super viewDidLoad];
    _sv = [SingletonView instance];
    bd = [_sv buscarNaLinha:[_sv.palavras objectAtIndex:_sv.linha]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
//------------------------------------------- NAVBAR ----------------------------------------
    
    self.navigationItem.title = [NSString stringWithFormat:@"%c",[[_sv.palavras objectAtIndex:_sv.linha] characterAtIndex:0]];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;

//--------------------------------------------------------------------------------------------
    
//------------------------------------------- TOOLBAR ----------------------------------------
    
    self.navigationController.toolbarHidden=NO;
    UIBarButtonItem *flexiableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar:)];
    NSArray *items = [NSArray arrayWithObjects: flexiableItem, item1, flexiableItem, nil];
    self.toolbarItems = items;
    
//--------------------------------------------------------------------------------------------
    
    
//Arrumando o texto
    nome = [[UILabel alloc]initWithFrame:CGRectMake(75, 300, 170, 50)];
//    nome.text =[NSString stringWithFormat:@"%@", bd.palavra]; //Acho que devia funcionar, mas nao
    nome.text = [_sv.palavras objectAtIndex:_sv.linha];
    nome.textAlignment = NSTextAlignmentCenter;
    
//Arrumando a imagem
    imagem = [[UIImageView alloc]initWithFrame:CGRectMake(90, 150, 130, 130)];
    //imagem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%c.png",[[_sv.palavras objectAtIndex:_sv.linha] characterAtIndex:0]]];
//    [UIView animateWithDuration:2.0 animations:^{
//        imagem.alpha = 0;
//    }];
    imagem.layer.cornerRadius = 70;
    [imagem.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [imagem.layer setBorderWidth: 1.0];
    [imagem.layer setBounds:CGRectMake(90, 150, 150, 150)];
    imagem.layer.masksToBounds = YES;
    imagem.contentMode = UIViewContentModeScaleAspectFit;
    imagem.userInteractionEnabled = YES;
    
    //Dar zoom quando segura
    UILongPressGestureRecognizer *pressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(zoom:)];
    [imagem addGestureRecognizer:pressGesture];
    
    //Dar zoom fazendo a pinça
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(aumentar:)];
    [self.view addGestureRecognizer:pinch];
    
    
//Adicionando tudo na view
    [self.view addSubview:nome];
    [self.view addSubview:imagem];
    
}


-(void)viewWillAppear:(BOOL)animated{
    //Trocar o nome quando volta da pagina Editar
    nome.text = [_sv.palavras objectAtIndex:_sv.linha]; //Acho que devia funcionar, mas nao
    nome.textAlignment = NSTextAlignmentCenter;
    
    //Trocar a imagem quando volta da pagina Editar
    //Animaçao faz com que a imagem esteja escondida
    imagem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%c.png",[[_sv.palavras objectAtIndex:_sv.linha] characterAtIndex:0]]];
    [UIView animateWithDuration:2.0 animations:^{
        imagem.alpha = 0;
    }];
}


-(void)viewDidAppear:(BOOL)animated{
    //Animaçao da imagem aparecendo
    [UIView animateWithDuration:2.0 animations:^{
        imagem.alpha = 1;
    }];

}


//-------------------------- IR PARA O ANTERIOR
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


//-------------------------- IR PARA O PROXIMO
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


//--------------------------- IR PARA A PAGINA EDITAR
-(void)editar:(id)sender{
    EditarViewController *editar = [[EditarViewController alloc]init];
    
    [self.navigationController pushViewController:editar animated:YES];
}


//-------------------------------------------------- METODO DO ZOOM
-(void)zoom:(UILongPressGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.2 animations:^{
            imagem.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
            nome.transform = CGAffineTransformMakeTranslation(0, 100);
        }];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.2 animations:^{
            imagem.transform = CGAffineTransformMakeScale(1.f, 1.f);
            nome.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
    }
}


//------------------------------------------------- PARA MUDAR A POSIÇAO DA IMAGEM
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
//-----------------------------------------------------------------------------------


//------------------------------------------------ METODO DA PINÇA
-(void)aumentar:(UIPinchGestureRecognizer *)recognizer{
    CGAffineTransform transform=CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
    imagem.transform=transform;
    
}
@end
