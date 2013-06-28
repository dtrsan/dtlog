/*
 * DTLog.m
 * DTLog
 * @brief Simple logger for Objective-C
 * @version v1.0
 *
 * @author Domagoj Tršan
 * @date 6/23/13
 * @copyright (c) 2013 Domagoj Tršan. All rights reserved.
 * @licence The MIT License (MIT).
 */

#import "DTLog.h"
#include <pthread.h>

static DTLogType DTLogLevel = kLogNone;

void setDTLogLevel(DTLogType level) {
    DTLogLevel = level;
}


/**
 * Returns string ID for logging level.
 * @param level logging level
 * @return DTLogType string ID or nil if invalid level is passed.
 * @see DTLogType
 */
static NSString* DTLogTypeString(DTLogType level) {

    switch (level) {
        case kLogCritical: return @"CRITICAL";
        case kLogError: return @"ERROR";
        case kLogWarning: return @"WARNING";
        case kLogInfo: return @"INFO";
        case kLogDebug: return @"DEBUG";
        case kLogVerbose: return @"VERBOSE";
        case kLogNone: return @"";
    }

    return @"INVALID";
}

void DTLog__(const char *pretty_function,
             uint32 line,
             DTLogType type,
             NSString *format,
             ...) {
    
    if (DTLogLevel < type) {
        return;
    }

    mach_port_t machTID = pthread_mach_thread_np(pthread_self());

    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format
                                               arguments:args];
    va_end(args);

    NSLog(@"%@: TID %u(%@): %@:%d: %@",
          DTLogTypeString(type),
          machTID,
          [[NSThread currentThread] isMainThread] ? @"M" : @"NM",
          [NSString stringWithUTF8String:pretty_function],
          line,
          message);

#if ! __has_feature(objc_arc)
    [message release];
#endif
}


void redirectStderrToFile(NSString *file, BOOL append) {

    char *mode = append ? "a" : "w";
    freopen([file cStringUsingEncoding:NSASCIIStringEncoding], mode, stderr);
}

void redirectStdoutToFile(NSString *file, BOOL append) {

    char *mode = append ? "a" : "w";
    freopen([file cStringUsingEncoding:NSASCIIStringEncoding], mode, stdout);
}
