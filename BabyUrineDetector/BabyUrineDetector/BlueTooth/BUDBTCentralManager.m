//
//  BUDBTCentralManager.m
//  BabyUrineDetector
//
//  Created by 王泽一 on 15/5/4.
//  Copyright (c) 2015年 王泽一. All rights reserved.
//

#import "BUDBTCentralManager.h"
#import "YMSCBCentralManager.h"

@interface BUDBTCentralManager() <CBCentralManagerDelegate>

@end

static BUDBTCentralManager* sharedInstance;

@implementation BUDBTCentralManager{
}

+ (BUDBTCentralManager *)initSharedServiceWithDelegate:(id)delegate{
    if (sharedInstance == nil) {
        dispatch_queue_t queue = dispatch_queue_create("com.yummymelon.deanna", 0);
        
        NSArray *nameList = @[@"TI BLE Sensor Tag", @"SensorTag"];
        sharedInstance = [[super allocWithZone:NULL] initWithKnownPeripheralNames:nameList
                                                                            queue:queue
                                                             useStoredPeripherals:YES
                                                                         delegate:delegate];
    }
    return sharedInstance;
}

+(BUDBTCentralManager*)sharedInstance{
    NSAssert(sharedInstance != nil, @"sharedInstance must invoke after init");
    return sharedInstance;
}

-(void)startScan{
    NSDictionary *options = @{ CBCentralManagerScanOptionAllowDuplicatesKey: @YES };
    __weak BUDBTCentralManager *this = self;
    [self scanForPeripheralsWithServices:nil
                                 options:options
                               withBlock:^(CBPeripheral *peripheral, NSDictionary *advertisementData, NSNumber *RSSI, NSError *error) {
                                   if (error) {
                                       NSLog(@"Something bad happened with scanForPeripheralWithServices:options:withBlock:");
                                       return;
                                   }
                                   
                                   NSLog(@"DISCOVERED: %@, %@, %@ db", peripheral, peripheral.name, RSSI);
                                   [this p_onFoundPeripheral:peripheral];
                               }];
    
}

-(void)p_onFoundPeripheral:(CBPeripheral *)peripheral{
    if ([peripheral.name isEqualToString:@"TI BLE Sensor Tag"]) {
        NSAssert(NO, @"abcd");
    }
}

@end
