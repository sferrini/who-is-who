//
//  EmployeeDownloader.h
//  who-is-who
//
//  Created by Simone Ferrini on 01/06/14.
//  Copyright (c) 2014 sferrini. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DownloadCompletionHandler)(NSData *data);

@interface EmployeeDownloader : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property NSMutableData *receivedData;

- (id)initWithCompletionHandler:(DownloadCompletionHandler)completionHandler;

@end
