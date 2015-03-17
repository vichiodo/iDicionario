//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "DicionarioViewController.h"

@implementation DicionarioViewController
@synthesize imagem, nome;


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
    
    

}

-(void)viewDidAppear:(BOOL)animated{
    [imagem setBackgroundColor:[UIColor redColor]];
    [UIView animateWithDuration:3 animations:^{
        imagem.alpha = 1;
    }];


}

-(void)viewWillAppear:(BOOL)animated{
    imagem = [[UIImageView alloc]initWithFrame:CGRectMake(90, 150, 130, 130)];
    nome = [[UIButton alloc]initWithFrame:CGRectMake(60, 300, 200, 50)];



    [nome setTitle:[_sv.palavras objectAtIndex:_sv.linha] forState:UIControlStateNormal];
    [UIView animateWithDuration:1 animations:^{
        imagem.alpha = 0;
    }];

    [self.view addSubview:nome];
    [self.view addSubview:imagem];
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
    DicionarioViewController *ant = [[DicionarioViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    _sv.linha--;

    if(_sv.linha == -1){
        _sv.linha = 25;
    }
    
    [self.navigationController pushViewController:ant
                                         animated:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
