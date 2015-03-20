//
//  EditarViewController.m
//  Navigation
//
//  Created by Vivian Chiodo Dias on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "EditarViewController.h"
#import "SingletonView.h"
#import "DicionarioViewController.h"


@interface EditarViewController ()

@end

@implementation EditarViewController
SingletonView *sv;
- (void)viewDidLoad {
    [super viewDidLoad];
    sv = [SingletonView instance];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"Editar";
    
    _editar = [[UITextField alloc]initWithFrame:CGRectMake(50, 150, 200, 20)];
    [_editar setBorderStyle:UITextBorderStyleRoundedRect];
    _editar.text = [sv.palavras objectAtIndex:sv.linha];
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem=done;
    
    self.navigationController.toolbarHidden=NO;
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(foto:)];
    NSArray *items = [NSArray arrayWithObjects:item1, nil];
    self.toolbarItems = items;
    
    
    [self.view addSubview:_editar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)done:(id)sender{
    DicionarioViewController *dicionario = [[DicionarioViewController alloc]init];
    
    [sv.palavras replaceObjectAtIndex:sv.linha withObject:_editar.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
