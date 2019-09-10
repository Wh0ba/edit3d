#import "Tweak.h"





%hook SBUIAppIconForceTouchControllerDataProvider

-(NSArray *)applicationShortcutItems {

	NSString *bundleIdentifier = [self applicationBundleIdentifier];
	
	if (!bundleIdentifier) return %orig;
	
	NSMutableArray *orig = [%orig mutableCopy];
	
	if (!orig) orig = [NSMutableArray new];

	SBSApplicationShortcutItem *item = [[%c(SBSApplicationShortcutItem) alloc] init];
	
	item.localizedTitle = @"Rearrange Apps";
	
	item.type = @"com.wh0ba.edit3d";
	
	[orig addObject:item];
	
	return orig;
}

%end



%hook SBUIAction

-(id)initWithTitle:(id)title subtitle:(id)arg2 image:(id)image badgeView:(id)arg4 handler:(id)arg5 {
	if ([title isEqualToString:@"Rearrange Apps"]) {
		image = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/Edit3D/Edit3D.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	}
	
	return %orig;
}

%end







%hook SBUIAppIconForceTouchController

-(void)appIconForceTouchShortcutViewController:(id)arg1 activateApplicationShortcutItem:(SBSApplicationShortcutItem *)item {
//
	if ([[item type] isEqualToString:@"com.wh0ba.edit3d"]) {
		
		[self dismissAnimated:YES withCompletionHandler:^
			{
				[self _triggerEditingMode];
		}];
		
		
		nil;
		
	}
	else{
		%orig;
	}
}

%new
-(void)_triggerEditingMode{
	// go into editing mode
	
	/*if ([[%c(SBIconView) sharedInstance] respondsToSelector:@selector(_handleSecondHalfLongPressTimer:)])
		[[%c(SBIconView) sharedInstance] _handleSecondHalfLongPressTimer:nil];
	else */if ([[%c(SBIconController) sharedInstance] respondsToSelector:@selector(_cancelAppIconForceTouchGestureAndBeginEditing)])
		[[%c(SBIconController) sharedInstance] _cancelAppIconForceTouchGestureAndBeginEditing];
}

%end





//[self dismissAnimated:YES withCompletionHandler:nil];