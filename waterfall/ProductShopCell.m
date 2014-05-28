//
//  ProductCell.m
//  brandshow
//
//  Created by lance on 14-5-16.
//  Copyright (c) 2014年 harry.xie. All rights reserved.
//

#import "ProductShopCell.h"
#import "ProductInf+Util.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "TouchView.h"
#import "UIColor+Util.h"

int headHeight;
int titleHeight;

@implementation ProductShopCell

@synthesize container;//item 头部容器

@synthesize productPic;
@synthesize productDesc;

@synthesize headContainer;//item 头部容器
@synthesize imgbg;
@synthesize imgBrand;

@synthesize labelBrand;
@synthesize labelTitle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray * nibs=[[NSBundle mainBundle] loadNibNamed:@"ProductShopCell" owner:self options:nil];
        for (id obj in nibs) {
            if ([obj isKindOfClass:[ProductShopCell class]]) {
                self=(ProductShopCell *)obj;
                break;
            }
        }
    }
    
    [imgBrand.layer setMasksToBounds:YES];
    [imgBrand.layer setCornerRadius:imgBrand.frame.size.width/2.0];

    container.clipsToBounds=YES;
    [container.layer setCornerRadius:4];
    //[container setTouchBeganBackgroundColor:[UIColor colorWithHexString:@"#ececec"]];
    //[container setTouchEndBackgroundColor:[UIColor whiteColor]];
    
    //设置阴影会出现一些问题
    [self.layer setShadowColor:[UIColor darkGrayColor].CGColor];
    [self.layer setShadowRadius:1];
    [self.layer setShadowOpacity:0.3f];
    [self.layer setShadowOffset:CGSizeMake(1, 1)];
    
    
    return self;
}

//调整单元格布局
-(void) initLayout:(ProductInf *)inf indexPath:(NSIndexPath *)indexPath 
{
    //调整图片的宽高
    CGRect picRect = productPic.frame;
    picRect.size.height=inf.picHeight;
    productPic.frame=picRect;
    
    //调整商品标签的位置
    CGRect titleRect=labelTitle.frame;
    titleRect.origin.y=productPic.frame.origin.y+productPic.frame.size.height;
    labelTitle.frame=titleRect;
    
    //调整容器的尺寸
    CGRect containerRect=container.frame;
    containerRect.size.height=inf.picHeight+50+40;//这只需要内容高度,忽略内边距高度
    container.frame=containerRect;
    
    
    [imgBrand setImageWithURL:[NSURL URLWithString:inf.brdimg]];
    labelBrand.text=inf.brdname;
    labelTitle.text=inf.productTitle;
    
}

//计算图片高度并调整标题的布局
+(float) heightForProductInf:(ProductInf *)inf width:(int)columnWidth withInsetHeight:(int)insetHeight

{
    return inf.picHeight+insetHeight+50+40;//这里需要添加边距的高度
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
