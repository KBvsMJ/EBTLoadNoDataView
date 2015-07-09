//
//  EBTLoadNoDataView.m
//  EBaoTongDai
//
//  Created by ebaotong on 15/7/8.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kImageSize CGSizeMake(80.0f,70.0f)
#import "EBTLoadNoDataView.h"
@interface EBTLoadNoDataView ()
{
    UIView *vContent; //imageview和label的父视图
    UILabel *lblTitle; //文本描述
    UIImageView *imvPhoto; //图片
}
@end

@implementation EBTLoadNoDataView

+ (EBTLoadNoDataView *)shareInstance
{
    static EBTLoadNoDataView *myInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        myInstance  = [[EBTLoadNoDataView alloc]init];
    });
    
    return myInstance;
}

- (void)loadNoDataView :(EBTLoadNoDataViewType)noDataType
{
    
    //创建一个vcontent对象
    vContent = [[UIView alloc]init];
    vContent.translatesAutoresizingMaskIntoConstraints = NO;
    vContent.backgroundColor = [UIColor clearColor];
    [self addSubview:vContent];
    
    //为vcontent水平方向添加约束
    NSArray *vcontent_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[vContent]|"
                                                                  options:0 metrics:nil views:NSDictionaryOfVariableBindings(vContent)];
    [self addConstraints:vcontent_H];
    
    
    //创建一个_imvPhoto对象
    imvPhoto = [[UIImageView alloc]init];
    imvPhoto.translatesAutoresizingMaskIntoConstraints =NO;
    [vContent addSubview:imvPhoto];
    
    //绑定_imvPhoto
    NSDictionary *bindDic_imvPhoto = NSDictionaryOfVariableBindings(imvPhoto);
    //设置_imvPhoto的宽高
    NSDictionary *dic_imvPhoto = @{@"width":@(kImageSize.width)};
    //水平方向相对父视图添加约束
    NSArray *imvphoto_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[imvPhoto(width)]" options:0 metrics:dic_imvPhoto views:bindDic_imvPhoto];
    
    NSLayoutConstraint *imvPhoto_CX = [NSLayoutConstraint constraintWithItem:imvPhoto attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:vContent attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [vContent addConstraints:imvphoto_H];
    [vContent addConstraint:imvPhoto_CX];
    
    
    
    //titleLabel添加约束
    lblTitle = [[UILabel alloc]init];
    lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.font = [UIFont systemFontOfSize:15.0f];
    
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.textColor = UIColorFromRGB(0x424242);
    lblTitle.numberOfLines = 0;
    [vContent addSubview:lblTitle];
    
    NSDictionary *bindDic_lblTitle = NSDictionaryOfVariableBindings(lblTitle);
    NSDictionary *dic_lblTitle = @{@"top":@(5.0f),@"leftRight":@(110.0f),@"height":@(34.0f)};
    
    //水平方向相对父视图添加约束
    NSArray *lblTitle_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftRight-[lblTitle]-leftRight-|" options:0 metrics:dic_lblTitle views:bindDic_lblTitle];
    [vContent addConstraints:lblTitle_H];
    
    
    //把所有控件放在最终的父视图中并添加约束
    NSDictionary *bindDic = @{@"imvPhoto":imvPhoto,@"lblTitle":lblTitle};
    NSDictionary *dic_constraint = @{ @"margin":@(10.0f),
                                      @"imgHeight":@(kImageSize.height),
                                      @"titleHeight":@(34.0f)
                                      };
    
    NSString *formatStr = [NSString stringWithFormat:@"V:|-[imvPhoto(imgHeight)]-margin-[lblTitle(>=titleHeight)]-|"];
    
    NSArray *constrain_V = [NSLayoutConstraint constraintsWithVisualFormat:formatStr options:0 metrics:dic_constraint views:bindDic];
    [vContent addConstraints:constrain_V];
    
    
}
- (void)showInView:(UIView *)baseView andLoadNoDataType:(EBTLoadNoDataViewType)noDataType
{
    self.userInteractionEnabled = NO;
    [self loadNoDataView:noDataType];
    switch (noDataType) {
        case EBTLoadNoDataViewNone:
        {
            imvPhoto.image = [UIImage imageNamed:@"1"];
            lblTitle.text = @"暂无相关记录";
        }
            break;
            
        default:
            break;
    }
    CGSize contentSize = [vContent systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSDictionary *dic_contentView = @{@"height":@(contentSize.height)};
    NSArray *contentView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[vContent(height)]" options:0 metrics:dic_contentView views:NSDictionaryOfVariableBindings(vContent)];
    NSLayoutConstraint *contentView_CY = [NSLayoutConstraint constraintWithItem:vContent attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self addConstraints:contentView_V];
    [self addConstraint:contentView_CY];
    [baseView addSubview:self];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *self_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[self]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(self)];
    NSArray *self_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(self)];
    [baseView addConstraints:self_H];
    [baseView addConstraints:self_V];
    
}
- (void)removeView
{
    [UIView animateWithDuration:1.0 animations:^{
        
        [self removeFromSuperview];
    }];
    
}
+ (void)removeNoDataView
{
    [[EBTLoadNoDataView shareInstance]removeView];
}
+ (void)showInView:(UIView *)baseView andLoadNoDataType:(EBTLoadNoDataViewType)noDataType
{
    [[EBTLoadNoDataView shareInstance] showInView:baseView andLoadNoDataType:noDataType];
}
@end
