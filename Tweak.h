@class SBSApplicationShortcutIcon;

@interface SBSApplicationShortcutItem : NSObject <NSCopying>

@property (nonatomic,copy) NSString * type;
@property (nonatomic,copy) NSString * localizedTitle;
@property (nonatomic,copy) NSString * localizedSubtitle;
@property (nonatomic,copy) NSString * bundleIdentifierToLaunch;
@property (nonatomic, copy) SBSApplicationShortcutIcon *icon;
@property (nonatomic, copy) NSDictionary* userInfo;
@end

@interface SBUIAppIconForceTouchControllerDataProvider : NSObject

-(NSString *)applicationBundleIdentifier;

@end



@interface SBIconController
+(id)sharedInstance;
-(void)_dismissAppIconForceTouchControllerIfNecessaryAnimated:(BOOL)arg1 withCompletionHandler:(id)arg2;
-(BOOL)_appIconForceTouchGestureRecognizerShouldBegin;
-(void)_cancelAppIconForceTouchGestureAndBeginEditing;
-(BOOL)isEditing;
@end



@interface SBUIAppIconForceTouchController
-(void)dismissAnimated:(BOOL)arg1 withCompletionHandler:(id)arg2;
-(void)_triggerEditingMode;
@end