//
//  MPCManager.h
//  ProgressiveEuchre
//
//  Created by Richard Fellure on 7/4/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MPCManager : NSObject<MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate>

@property MCPeerID *peerID;
@property MCSession *session;
@property MCNearbyServiceAdvertiser *advertiser;
@property MCNearbyServiceBrowser *browser;
@property NSMutableArray *foundPeersArray;

-(void)setupPeerIDAndSession:(NSString *)displayName;
-(void)advertiseSelf:(BOOL) shouldAdvertise;
-(void)startBrowsing;
-(void)stopBrowsing;


@end
