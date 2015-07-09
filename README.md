# EBTLoadNoDataView
#1:对于显示在普通的页面上
  [EBTLoadNoDataView showInView:self.view andLoadNoDataType:EBTLoadNoDataViewNone];
  
#2对于tableview页面上需要添加一个与tableview同级的view  然后显示在view上
  [EBTLoadNoDataView showInView:_maskView andLoadNoDataType:EBTLoadNoDataViewNone];
#3在不同的页面显示不同的图片或者文字需要在以下地方进行自行添加
typedef NS_ENUM(NSInteger, EBTLoadNoDataViewType)
{
    EBTLoadNoDataViewNone    //显示图片和文本
    
    /**自定义一个枚举变量*/
    
    
};


- (void)showInView:(UIView *)baseView andLoadNoDataType:(EBTLoadNoDataViewType)noDataType
{
switch (noDataType) {
        case EBTLoadNoDataViewNone:
        {
            imvPhoto.image = [UIImage imageNamed:@"1"];
            lblTitle.text = @"暂无相关记录";
        }
            break;
           /**在这里设置背景图和文字描述*/ 
        default:
            break;
    }

}



#效果图
![Image](https://github.com/KBvsMJ/EBTLoadNoDataView/blob/master/Demo/1.gif)
