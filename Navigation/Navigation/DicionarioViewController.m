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
@synthesize imagem, nome, toolBar;


-(void) viewDidLoad {
    [super viewDidLoad];
    _sv = [SingletonView instance];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSString* sub = [NSString stringWithFormat:@"%c",[[_sv.palavras objectAtIndex:_sv.linha] characterAtIndex:0]];
    self.title = sub;
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    self.navigationController.toolbarHidden=NO;
    
    UIBarButtonItem *flexiableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editar:)];
    NSArray *items = [NSArray arrayWithObjects: flexiableItem, item1, flexiableItem, nil];
    self.toolbarItems = items;
    

//    
//    toolBar = [[UIToolbar alloc] init];
//    toolBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
//    NSMutableArray *items = [[NSMutableArray alloc] init];
//    [items addObject:[[[UIBarButtonItem alloc] initWith] autorelease]];
//    [toolBar setItems:items animated:NO];
//    [items release];
//    [self.view addSubview:toolBar];
//    [toolBar release];

}


-(void)viewWillAppear:(BOOL)animated{
    imagem = [[UIImageView alloc]initWithFrame:CGRectMake(90, 150, 130, 130)];
    nome = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, 200, 50)];



    nome.text =[_sv.palavras objectAtIndex:_sv.linha];
    [UIView animateWithDuration:1.5 animations:^{
        imagem.alpha = 0;
    }];
    
    imagem.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(zoom:)];
    [imagem addGestureRecognizer:recognizer];
    
    [self.view addSubview:nome];
    [self.view addSubview:imagem];
    }



-(void)viewDidAppear:(BOOL)animated{
    [imagem setBackgroundColor:[UIColor redColor]];
    [UIView animateWithDuration:1.5 animations:^{
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
    
    
    [self.navigationController pushViewController:pro
                                         animated:YES];
}

-(void)back:(id)sender {
//    UINavigationController *navigation = [[UINavigationController alloc]init];
//    NSMutableArray *views = self.navigationController;
    
    DicionarioViewController *ant = [[DicionarioViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    _sv.linha--;

    if(_sv.linha == -1){
        _sv.linha = 25;
    }
    
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];

    [self.navigationController pushViewController:ant animated:YES];
    
    
//    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)editar:(id)sender{
    EditarViewController *editar = [[EditarViewController alloc]init];
    
    [self.navigationController pushViewController:editar animated:YES];
}

-(void)zoom:(UILongPressGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.3 animations:^{
            imagem.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        }];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.3 animations:^{
            imagem.transform = CGAffineTransformMakeScale(1.f, 1.f);
        }];
    }
}
@end
