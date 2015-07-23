//
//  Request.m
//  MadStreetDen
//
//  Created by GANESH BASKER on 18/07/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "Request.h"
#define BASE_URL @"https://fashion1.madstreetden.com"

@implementation Request




- (void) callProductRequest:(REQUEST_TYPE)reqType withDelegate:(id<RequestDelegate>)delegate {
    
    NSURL *reqUrl = nil;
    NSString *reqParam = nil;
    self.reqDelegate = delegate;
    
    switch (reqType) {
            
        case MOREPRODUCTLISTREQUEST: {
            reqUrl= [NSURL URLWithString:[NSString stringWithFormat:@"%@/more",BASE_URL]];
            reqParam=[NSString stringWithFormat:@"productID=MO296WA48MAHINDFAS&appID=7212070341&details=true&numResults=16&appSecret=q4s7cgotmj3irpc7i0tc"];
        }
        break;
        default:
        break;
    }
    NSString *paramLength=[NSString stringWithFormat:@"%lu",(unsigned long)[reqParam length]];
    NSData *PostData = [reqParam dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:reqUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:paramLength forHTTPHeaderField:@"Content-Lenght"];
    [request setHTTPBody:PostData];
    NSURLConnection *connection =[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    self.responseData = [[NSMutableData alloc] init];

}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [self.responseData appendData:data];

}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSError *error;
    
    id response = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Response : %@", response);
    NSMutableDictionary *responseDictionary = (NSMutableDictionary *)response;
    if ([[responseDictionary valueForKey:@"status"]isEqualToString:@"success"]) {
        [self.reqDelegate requestDidFinishLoadingWithResponse:responseDictionary];
    }else{
        
    }
    

}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"Error Description : %@", error.description);
    [self.reqDelegate requestDidFailWithError:error];


}


@end
