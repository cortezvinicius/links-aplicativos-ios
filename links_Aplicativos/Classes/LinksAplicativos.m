//
//  LinksAplicativos.m
//  LinksAplicativosDemo
//
//  Created by Vinicius Cortez on 01/04/20.
//  Copyright © 2020 Vinicius Cortez. All rights reserved.
//

#import "LinksAplicativos.h"

@interface LinksAplicativos() <MFMailComposeViewControllerDelegate>

@end

@implementation LinksAplicativos

-(void) abrirPaginaWeb:(NSString* )url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
-(void) abrirChamadaTelefone: (NSString *)telefone
{
    
    NSString *url = @"tel://";
    url = [url stringByAppendingString:telefone];
    
    //NSLog(url);
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

-(void) abrirWhatsapp: (NSString *)whatsapp:(NSString *)mensagem
{
    NSString *url = @"whatsapp://send?phone=+55";
    url = [url stringByAppendingString:whatsapp];
    url = [url stringByAppendingString:@"&text="];
    url = [url stringByAppendingString:mensagem];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
    
    //NSLog(url);
}

-(void) abrirMapas:(NSString *)nomeLocal:(NSString *) latitude:(NSString *)longitude:(bool *)suporteGoogleMaps
{
    if(suporteGoogleMaps == true)
    {
        if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]] == true)
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Traçar Rota" message:@"Você deseja abrir com o Apple Maps ou Google Maps ?" preferredStyle:UIAlertControllerStyleAlert];
            
            
            
            UIAlertAction* googleMaps = [UIAlertAction actionWithTitle:@"Google Maps" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSString *url = @"comgooglemaps://?saddr=&daddr=";
                       url = [url stringByAppendingString: latitude];
                       url = [url stringByAppendingString: @","];
                       url = [url stringByAppendingString:longitude];
                       url = [url stringByAppendingString:@"&directionsmode=driving"];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
            }];
            UIAlertAction* appleMaps = [UIAlertAction actionWithTitle:@"Apple Maps" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                
                double latitudeDouble = [latitude doubleValue];
                double longitdeDouble = [longitude doubleValue];
                
                MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(latitudeDouble, longitdeDouble) addressDictionary:nil];
                MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
                [mapItem setName: nomeLocal];
                NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
                [mapItem openInMapsWithLaunchOptions:options];
                
                
            }];
            UIAlertAction* cancelar = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:nil];
            
            
            [alert addAction:appleMaps];
            [alert addAction:googleMaps];
            [alert addAction:cancelar];
            
            
            
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];
            
            //[[UIApplication sharedApplication] openURL:[NSURL URLWithString: url]];
        }else
        {
            double latitudeDouble = [latitude doubleValue];
            double longitdeDouble = [longitude doubleValue];
            
            MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(latitudeDouble, longitdeDouble) addressDictionary:nil];
            MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
            [mapItem setName: nomeLocal];
            NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
            [mapItem openInMapsWithLaunchOptions:options];
        }
    }else
    {
        double latitudeDouble = [latitude doubleValue];
        double longitdeDouble = [longitude doubleValue];
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(latitudeDouble, longitdeDouble) addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName: nomeLocal];
        NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
        [mapItem openInMapsWithLaunchOptions:options];
    }
}


-(void)abrirEmail:(NSString *)email:(NSString *)titulo: (NSString *) texto
{
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        [mailCont setToRecipients:[NSArray arrayWithObject:email]];
        [mailCont setSubject:titulo];
        [mailCont setMessageBody:texto isHTML:NO];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:mailCont animated:true completion:nil];
        //[self presentViewController:mailCont animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:true completion:nil];
}

@end
