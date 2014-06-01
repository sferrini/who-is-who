//
//  EmployeeDownloader.m
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import "EmployeeDownloader.h"

@interface EmployeeDownloader ()

@property (nonatomic, copy) DownloadCompletionHandler completionHandler;

@end

@implementation EmployeeDownloader

- (id)initWithCompletionHandler:(DownloadCompletionHandler)completionHandler
{
    self = [super init];
    if (self) {
        self.completionHandler = completionHandler;
        [self startPageSourceDownload];
    }
    return self;
}

- (void)startPageSourceDownload
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.theappbusiness.com/our-team/"]
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:60.0];
    
    self.receivedData = [NSMutableData dataWithCapacity:0];
    
    if (![[NSURLConnection alloc] initWithRequest:request delegate:self]) {
        self.receivedData = nil;
        NSLog(@"Unable To Create Connection");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.receivedData = nil;
    self.completionHandler(self.receivedData);
    NSLog(@"Error:%@", error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.completionHandler(self.receivedData);
}

@end
