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
    
    
    
//---------------------------------- CRIANDO O CAMPO DE EDIÇAO
    _editar = [[UITextField alloc]initWithFrame:CGRectMake(50, 150, 200, 20)];
    [_editar setBorderStyle:UITextBorderStyleRoundedRect];
    _editar.text = [sv.palavras objectAtIndex:sv.linha];
    
//---------------------------------- NAVBAR
    self.navigationItem.title = @"Editar";
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem=done;
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem=cancel;
    
    
//---------------------------------- TOOLBAR
    self.navigationController.toolbarHidden=NO;
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(foto:)];
    NSArray *items = [NSArray arrayWithObjects:item1, nil];
    self.toolbarItems = items;
    
    //Adicionando na view
    [self.view addSubview:_editar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)done:(id)sender{
//    [sv alterarPalavra:_editar.text];   //Devia funcionar com o Realm, só que nao ¬¬
    
    [sv.palavras replaceObjectAtIndex:sv.linha withObject:_editar.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)cancel:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)foto:(id)sender{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];

    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else{
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
//    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    

   // [self.imageView setImage:image];

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
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
