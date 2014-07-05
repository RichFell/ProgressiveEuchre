//
//  MPCManager.m
//  ProgressiveEuchre
//
//  Created by Richard Fellure on 7/4/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "MPCManager.h"

@implementation MPCManager

-(id)init
{
    self = [super init];
        if (self)
        {
            self.peerID = nil;
            self.session = nil;
            self.browser = nil;
            self.session = nil;
            self.advertiser = nil;
            self.foundPeersArray = [NSMutableArray array];
        }
    return self;
}

-(void)session:(MCSession *)session didReceiveCertificate:(NSArray *)certificate fromPeer:(MCPeerID *)peerID certificateHandler:(void (^)(BOOL))certificateHandler
{
    certificateHandler(YES);
}

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{

}

-(void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info
{
    
}

-(void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID
{

}

-(void)setupPeerIDAndSession:(NSString *)displayName
{
    self.peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
    self.session = [[MCSession alloc]initWithPeer:self.peerID];
    self.session.delegate = self;
}

-(void)advertiseSelf:(BOOL)shouldAdvertise
{

    if (shouldAdvertise)
    {

        self.advertiser = [[MCNearbyServiceAdvertiser alloc]initWithPeer:self.peerID discoveryInfo:nil serviceType:@"progressiveeuchre"];
        self.advertiser.delegate = self;
        [self.advertiser startAdvertisingPeer];
    }

    else
    {
        [self.advertiser stopAdvertisingPeer];
        self.advertiser = nil;
    }

}

-(void)startBrowsing
{
    self.browser = [[MCNearbyServiceBrowser alloc]initWithPeer:self.peerID serviceType:@"progressiveeuchre"];
    self.browser.delegate = self;
    [self.browser startBrowsingForPeers];
}

-(void)stopBrowsing
{
    [self.session disconnect];
    self.session.delegate = nil;
    self.session = nil;

    [self.advertiser stopAdvertisingPeer];
    self.advertiser.delegate = nil;
    self.advertiser = nil;

    [self.browser stopBrowsingForPeers];
    self.browser.delegate = nil;
    self.browser = nil;
}

@end
