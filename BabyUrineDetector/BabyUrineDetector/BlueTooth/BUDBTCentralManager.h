//
//  BUDBTCentralManager.h
//  BabyUrineDetector
//
//  Created by 王泽一 on 15/5/4.
//  Copyright (c) 2015年 王泽一. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMSCBCentralManager.h"

@interface BUDBTCentralManager : YMSCBCentralManager

+ (BUDBTCentralManager *)initSharedServiceWithDelegate:(id)delegate;

+(BUDBTCentralManager*)sharedInstance;

@end
