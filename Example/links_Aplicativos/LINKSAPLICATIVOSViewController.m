//
//  LINKSAPLICATIVOSViewController.m
//  links_Aplicativos
//
//  Created by cortezvinicius on 04/02/2020.
//  Copyright (c) 2020 cortezvinicius. All rights reserved.
//

#import "LINKSAPLICATIVOSViewController.h"

@interface LINKSAPLICATIVOSViewController ()

@end

@implementation LINKSAPLICATIVOSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}


- (void)viewDidAppear:(BOOL)animated
{
    LinksAplicativos *linksAplicativos = [[LinksAplicativos alloc] init];
    [linksAplicativos abrirMapas:@"Teste" :@"-200" :@"300"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
   
}

@end
