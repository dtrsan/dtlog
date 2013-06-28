//
//  ExampleClass.h
//  DTLog Example Project
//
//  Created by Domagoj Tršan on 6/27/13.
//  Copyright (c) 2013 Domagoj Trsan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExampleClass : NSObject

- (void)logCriticalMessage;
- (void)logErrorMessage;
- (void)logWarningMessage;
- (void)logInfoMessage;
- (void)logDebugMessage;
- (void)logVerboseMessage;

@end
