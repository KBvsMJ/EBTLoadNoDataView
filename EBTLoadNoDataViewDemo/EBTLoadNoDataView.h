//
//  EBTLoadNoDataView.h
//  EBaoTongDai
//
//  Created by ebaotong on 15/7/8.
//  Copyright (c) 2015年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  @brief  发送网络请求没有数据的时候显示指定view
 *
 */

typedef NS_ENUM(NSInteger, EBTLoadNoDataViewType)
{
    EBTLoadNoDataViewNone    //显示图片和文本
};

@interface EBTLoadNoDataView : UIView
/**
 *  通过单例显示加载网络请求没有数据指定的view
 *
 *  @return 单例对象
 */
+ (EBTLoadNoDataView *)shareInstance;
/**
 *  @brief  显示没有数据的view
 *
 *  @param baseView   在父视图上显示
 *  @param noDataType 根据该枚举变量来加载显示对应的图片和文本
 *
 */
+ (void)showInView:(UIView *)baseView andLoadNoDataType:(EBTLoadNoDataViewType)noDataType;

/**
 *  @brief  从父视图上移除
 */
+ (void)removeNoDataView;

@end
