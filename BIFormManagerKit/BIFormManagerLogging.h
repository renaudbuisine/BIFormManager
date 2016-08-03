//
//  BIFormManagerLogging.h
//  BIFormManagerKit
//
//  Created by Renaud BUISINE on 20/06/16.
//  Copyright © 2016 Renaud Buisine. All rights reserved.
//

#ifndef BIFormManagerLogging_h
#define BIFormManagerLogging_h

#define LOG_FORMAT(fmt, lvl, ...) NSLog((@"[FORMMANAGER %@] " fmt), lvl, ##__VA_ARGS__)
#define LOG_WARNING(fmt, ...) LOG_FORMAT(fmt, @"WARNING", ##__VA_ARGS__)
#define LOG_ERROR(fmt, ...) LOG_FORMAT(fmt, @"ERROR", ##__VA_ARGS__)
#define LOG(fmt, ...) LOG_FORMAT(fmt, @"DEBUG", ##__VA_ARGS__)

#endif /* BIFormManagerLogging_h */
