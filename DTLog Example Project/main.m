//
//  main.m
//  DTLog Example Project
//
//  Created by Domagoj Tršan on 6/27/13.
//  Copyright (c) 2013 Domagoj Trsan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExampleClass.h"
#import "DTLog.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        // Sets loging filter.
        // By default it's set to kLogNone
        setDTLogLevel(kLogVerbose);

        DTLogMethodStart;

        ExampleClass *obj = [[ExampleClass alloc] init];

        // Log messages from the main thread.
        [obj logCriticalMessage];
        [obj logErrorMessage];
        [obj logWarningMessage];
        [obj logInfoMessage];
        [obj logDebugMessage];
        [obj logVerboseMessage];

        // Log messages on the background thread.
        [obj performSelectorInBackground:@selector(logCriticalMessage)
                              withObject:nil];
        [obj performSelectorInBackground:@selector(logErrorMessage)
                              withObject:nil];
        [obj performSelectorInBackground:@selector(logWarningMessage)
                              withObject:nil];
        [obj performSelectorInBackground:@selector(logInfoMessage)
                              withObject:nil];
        [obj performSelectorInBackground:@selector(logDebugMessage)
                              withObject:nil];
        [obj performSelectorInBackground:@selector(logVerboseMessage)
                              withObject:nil];

        // Log message from the block.
        void(^example_block)() = ^() {
            DTLogMethodStart;
            
            DTLogVerbose(@"Hey, i'm inside the block");

            DTLogMethodEnd;
        };

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            example_block();
        });

        // Waits for other threads
        [NSThread sleepForTimeInterval:0.5];

        DTLogMethodEnd;
    }

    return 0;
}
