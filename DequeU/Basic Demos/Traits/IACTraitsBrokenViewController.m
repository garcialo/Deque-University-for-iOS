//
//  DQTraitsBrokenViewController.m
//  Deque University for iOS
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "IACTraitsBrokenViewController.h"

@implementation IACTraitsBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //This sets the "shadow" property of the DQButtons to "ON", to help users more easily see that they are buttons.
    [_buttonDisplayCat setShadowed:YES];
    [_buttonDisplayDog setShadowed:YES];
    [_buttonDisplayFish setUnderlined:YES]; //This sets the "underlined" property of the DQButton to "ON" to help users understand that
                                            //  this button acts as a link.
    
    [_buttonDisplayCat addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_buttonDisplayDog addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_buttonDisplayFish addTarget:self action:@selector(visitWebPage) forControlEvents:UIControlEventTouchDown];

    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
    [_ImageView setAccessibilityHint:@""]; ///< Sometimes hints aren't needed, this silences the warning.
    [_ImageView setAccessibilityLabel:NSLocalizedString(@"DOG", nil)];
    [_ImageView setIsAccessibilityElement:YES];
}

- (void)displayImage:(id)sender {
    UIButton* button = (UIButton*)sender;
    
    if (button == _buttonDisplayCat) {
        [self updateImage:@"cat"];
    } else if (button == _buttonDisplayDog) {
        [self updateImage:@"dog"];
    } else {
        [self updateImage:@"fish"];
    }
}

- (NSString*)visitWebPage {
    NSString* url = @"http://lmgtfy.com/?q=fish";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    return url;
}

// Update the imageView's image and accessibility label given the name of the animal.
- (void)updateImage:(NSString*)name {
    [_ImageView setImage:[UIImage imageNamed:name]];
    [_ImageView setAccessibilityLabel:name];
}


- (BOOL)shouldAutorotate {
    return NO;
}

@end
