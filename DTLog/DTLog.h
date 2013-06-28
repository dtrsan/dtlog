/*
 * DTLog.h
 * DTLog
 * @brief Simple logger for Objective-C
 * @version v1.0
 *
 * @author Domagoj Tršan 
 * @date 6/23/13
 * @copyright (c) 2013 Domagoj Tršan. All rights reserved.
 * @licence The MIT License (MIT).
 */

#import <Foundation/Foundation.h>

/**
 * Available logging levels
 */
typedef enum {
    /** Disables logging. */
    kLogNone,
    /** Critical: logs critical conditions.
      * If critical conditions occurs, the system is unusable. */
    kLogCritical,
    /** Error: logs error conditions. */
    kLogError,
    /** Warning: logs warning conditions. */
    kLogWarning,
    /** Informational: logs informational messages. */
    kLogInfo,
    /** Debug: logs debug messages. */
    kLogDebug,
    /** Everything else. */
    kLogVerbose
} DTLogType;

/**
 * Sets logging level
 * @see DTLogType
 */
void setDTLogLevel(DTLogType level);

/**
 * Generic logging function.
 * @param *pretty_function The name of the method/function from which the log 
 * function is called.
 * @param line The line number inside file from which the loging method is called.
 * @param type The type of a logging message.
 * @param *format The message to log.
 */
void DTLog__(const char *pretty_function,
             int line,
             DTLogType type,
             NSString *format,
             ...);

/**
 * Macro which simplifies calling DTLog__ logging function by automatically
 * prepopulating with __PRETTY_FUNCTION__ and __LINE__.
 */
#define DTLog(type, format, ...)   DTLog__(__PRETTY_FUNCTION__, __LINE__, type, format, ##__VA_ARGS__)

/**
 * Log a critical condition.
 */
#define DTLogCritical(format, ...) DTLog(kLogCritical, format, ##__VA_ARGS__)
/**
 * Log an error condition.
 */
#define DTLogError(format, ...)    DTLog(kLogError, format, ##__VA_ARGS__)
/**
 * Log a warning condition.
 */
#define DTLogWarning(format, ...)  DTLog(kLogWarning, format, ##__VA_ARGS__)
/**
 * Log an info message.
 */
#define DTLogInfo(format, ...)     DTLog(kLogInfo, format, ##__VA_ARGS__)
/**
 * Log a debug message.
 */
#define DTLogDebug(format, ...)    DTLog(kLogDebug, format, ##__VA_ARGS__)
/**
 * Log a verbose message.
 */
#define DTLogVerbose(format, ...)  DTLog(kLogVerbose, format, ##__VA_ARGS__)

/**
 * Macro to call right when method/function did start.
 */
#define DTLogMethodStart           DTLogInfo(@"-- method start --", nil)
/**
 * Macro to call right before when method/function will end.
 */
#define DTLogMethodEnd             DTLogInfo(@"-- method end --", nil)

/**
 * Redirects stderr output to a file. If append is set to true, redirect is done
 * with mode "a" which will opens file for output at the end of a file. The file
 * is created if it does not exist. If append is set to false, redirect is done
 * with mode "w" which will create an empty file for output operations. If a
 * file with the same name already exists, its contents are discarded and the
 * file is treated as a new empty file.
 * @param file The file path.
 * @param append If true output will be appended to the existing file, otherwise 
 * new file will be created and existing will be overwritten.
 */
void redirectStderrToFile(NSString *file, BOOL append);

/**
 * Redirects stdout output to a file. If append is set to true, redirect is done
 * with mode "a" which will opens file for output at the end of a file. The file
 * is created if it does not exist. If append is set to false, redirect is done
 * with mode "w" which will create an empty file for output operations. If a 
 * file with the same name already exists, its contents are discarded and the 
 * file is treated as a new empty file.
 * @param file The file path.
 * @param append If true output will be appended to the existing file, otherwise
 * new file will be created and existing will be overwritten.
 */
void redirectStdoutToFile(NSString *file, BOOL append);
