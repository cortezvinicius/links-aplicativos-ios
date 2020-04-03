//
//  LinksAplicativos.h
//  LinksAplicativosDemo
//
//  Created by Vinicius Cortez on 01/04/20.
//  Copyright © 2020 Vinicius Cortez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>

@interface LinksAplicativos : NSObject

-(void) abrirPaginaWeb:(NSString *)url;
-(void) abrirChamadaTelefone: (NSString *)telefone;
-(void) abrirWhatsapp: (NSString *)whatsapp: (NSString *)mensagem;
-(void) abrirMapas:(NSString *)nomeLocal:(NSString *) latitude:(NSString *)longitude:(bool *)suporteGoogleMaps;
-(void)abrirEmail:(NSString *)email:(NSString *)titulo: (NSString *) texto;

@end
