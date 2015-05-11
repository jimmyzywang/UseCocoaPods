//
//  BUDBTCentralManager.m
//  BabyUrineDetector
//
//  Created by 王泽一 on 15/5/4.
//  Copyright (c) 2015年 王泽一. All rights reserved.
//

#import "BUDBTCentralManager.h"
#import "BUDConstants.h"
#import "BUDNotification.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface BUDBTCentralManager() <CBCentralManagerDelegate>

@end

@implementation BUDBTCentralManager{
    CBCentralManager *_centralManager;
}

-(void)beginToScan{
    NSDictionary *options = @{ CBCentralManagerScanOptionAllowDuplicatesKey: @YES };
    [[self p_cbCentralManager] scanForPeripheralsWithServices:nil options:options];
}

+(BUDBTCentralManager*)sharedInstance{
    static BUDBTCentralManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BUDBTCentralManager alloc] init];
    });
    return sharedInstance;
}

-(CBCentralManager*)p_cbCentralManager{
    if (_centralManager == nil) {
        dispatch_queue_t queue = dispatch_queue_create("com.baby.urine.detector", 0);
        _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:queue];
    }
    return _centralManager;
}


-(void)p_onFoundPeripheral:(CBPeripheral *)peripheral{
    if ([peripheral.name isEqualToString:kTIBLEName]) {
        [[self p_cbCentralManager] stopScan];
        [[NSNotificationCenter defaultCenter] postNotificationName:kBTHasFoundTIBLENotification object:nil];
    }
}

-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI{
    [self p_onFoundPeripheral:peripheral];
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    
}
@end
