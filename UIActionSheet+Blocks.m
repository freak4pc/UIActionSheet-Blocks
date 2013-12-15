//
//  UIActionSheet+Blocks.m
//
//  Created by Shai Mishali on 9/26/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "UIActionSheet+Blocks.h"

static void (^__clickedBlock)(UIActionSheet *sheet, NSUInteger index);
static void (^__cancelBlock)(UIActionSheet *sheet);
static void (^__destroyBlock)(UIActionSheet *sheet);

@implementation UIActionSheet (Blocks)

+(UIActionSheet *)presentOnView:(UIView *)view
                      withTitle:(NSString *)title
                   otherButtons:(NSArray *)otherStrings
                       onCancel:(void (^)(UIActionSheet *sheet))cancelBlock
                onClickedButton:(void (^)(UIActionSheet *sheet, NSUInteger buttonIndex))clickBlock{
    
    return [self presentOnView:view
                     withTitle:title
                  cancelButton:NSLocalizedString(@"Cancel", @"")
             destructiveButton:nil
                  otherButtons:otherStrings
                      onCancel:cancelBlock
                 onDestructive:nil
               onClickedButton:clickBlock];
}

+(UIActionSheet *)presentOnView: (UIView *)view
                      withTitle: (NSString *)title
                   cancelButton: (NSString *)cancelString
              destructiveButton: (NSString *)destructiveString
                   otherButtons: (NSArray *)otherStrings
                       onCancel: (void (^)(UIActionSheet *sheet))cancelBlock
                  onDestructive: (void (^)(UIActionSheet *sheet))destroyBlock
                onClickedButton: (void (^)(UIActionSheet *sheet, NSUInteger buttonIndex))clickBlock{
    __cancelBlock           = cancelBlock;
    __clickedBlock          = clickBlock;
    __destroyBlock          = destroyBlock;
    
    UIActionSheet *sheet    = [[UIActionSheet alloc] initWithTitle:title
                                                          delegate:(id) [self class]
                                                 cancelButtonTitle:nil
                                            destructiveButtonTitle:destructiveString
                                                 otherButtonTitles:nil];
    
    for(NSString *other in otherStrings)
        [sheet addButtonWithTitle: other];
    
    if (cancelString) {
        [sheet setCancelButtonIndex:[sheet addButtonWithTitle:cancelString]];
    }
    
    [sheet showInView: view];

    return sheet;
}

#pragma mark - Private Static delegate
+(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if([actionSheet destructiveButtonIndex] == buttonIndex && __destroyBlock)
        __destroyBlock(actionSheet);
    else if([actionSheet cancelButtonIndex] == buttonIndex && __cancelBlock)
        __cancelBlock(actionSheet);
    else if(__clickedBlock)
        __clickedBlock(actionSheet, buttonIndex);
}

+(void)actionSheetCancel:(UIActionSheet *)actionSheet{
    if(__cancelBlock)
        __cancelBlock(actionSheet);
}

@end