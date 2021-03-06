// Copyright 2015-present 650 Industries. All rights reserved.

#import "EXKernelServiceRegistry.h"
#import "EXErrorRecoveryManager.h"
#import "EXGoogleAuthManager.h"
#import "EXKernelLinkingManager.h"
#import "EXRemoteNotificationManager.h"
#import "EXScreenOrientationManager.h"

@interface EXKernelServiceRegistry ()

@property (nonatomic, strong) EXGoogleAuthManager *googleAuthManager;
@property (nonatomic, strong) EXErrorRecoveryManager *errorRecoveryManager;
@property (nonatomic, strong) EXKernelLinkingManager *linkingManager;
@property (nonatomic, strong) EXRemoteNotificationManager *remoteNotificationManager;
@property (nonatomic, strong) EXScreenOrientationManager *screenOrientationManager;
@property (nonatomic, strong) NSDictionary *allServices;

@end

@implementation EXKernelServiceRegistry

- (instancetype)init
{
  if (self = [super init]) {
    // TODO: init these in some clean way
    [self errorRecoveryManager];
    [self remoteNotificationManager];
    [self linkingManager];
    [self screenOrientationManager];
    [self googleAuthManager];
  }
  return self;
}

- (EXRemoteNotificationManager *)remoteNotificationManager
{
  if (!_remoteNotificationManager) {
    _remoteNotificationManager = [[EXRemoteNotificationManager alloc] init];
  }
  return _remoteNotificationManager;
}

- (EXErrorRecoveryManager *)errorRecoveryManager
{
  if (!_errorRecoveryManager) {
    _errorRecoveryManager = [[EXErrorRecoveryManager alloc] init];
  }
  return _errorRecoveryManager;
}

- (EXGoogleAuthManager *)googleAuthManager
{
  if (!_googleAuthManager) {
    _googleAuthManager = [[EXGoogleAuthManager alloc] init];
  }
  return _googleAuthManager;
}

- (EXKernelLinkingManager *)linkingManager
{
  if (!_linkingManager) {
    _linkingManager = [[EXKernelLinkingManager alloc] init];
  }
  return _linkingManager;
}

- (EXScreenOrientationManager *)screenOrientationManager
{
  if (!_screenOrientationManager) {
    _screenOrientationManager = [[EXScreenOrientationManager alloc] init];
  }
  return _screenOrientationManager;
}

- (NSDictionary *)allServices
{
  if (!_allServices) {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id service in @[ self.errorRecoveryManager, self.googleAuthManager, self.linkingManager, self.remoteNotificationManager, self.screenOrientationManager ]) {
      NSString *className = NSStringFromClass([service class]);
      result[className] = service;
    }
    _allServices = result;
  }
  return _allServices;
}

@end
