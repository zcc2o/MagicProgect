//
//  ZCCInputView.h
//  
//
//  Created by mac on 2017/6/26.
//
//

#import <UIKit/UIKit.h>

@interface ZCCInputView : UIView

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *inputLabeltextField;

+ (instancetype)inputView;


@end
