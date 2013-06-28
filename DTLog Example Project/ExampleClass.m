//
//  ExampleClass.m
//  DTLog Example Project
//
//  Created by Domagoj Tršan on 6/27/13.
//  Copyright (c) 2013 Domagoj Trsan. All rights reserved.
//

#import "ExampleClass.h"
#import "DTLog.h"

@implementation ExampleClass

- (void)logCriticalMessage
{
    DTLogCritical(@"Critical message");
}

- (void)logErrorMessage
{
    DTLogError(@"Error message");
}

- (void)logWarningMessage
{
    DTLogWarning(@"Warning message");
}

- (void)logInfoMessage
{
    DTLogInfo(@"Info message");
}

- (void)logDebugMessage
{
    DTLogDebug(@"Debug message");
}

- (void)logVerboseMessage
{
    DTLogVerbose(@"Verbose message");
}

@end
