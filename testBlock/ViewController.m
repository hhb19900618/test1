//
//  ViewController.m
//  testBlock
//
//  Created by 华斌 胡 on 15/8/26.
//  Copyright (c) 2015年 华斌 胡. All rights reserved.
//

#import "ViewController.h"
#import "testModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    void (^printBlock)() = ^(){
        printf("no number\n");
    };
    printBlock();
    
    
    printBlock(9);
    
    int mutiplier = 7;
    //（3）定义名为myBlock的代码块，返回值类型为int
    int (^myBlock)(int) = ^(int num){
        return num*mutiplier;
    };
    //使用定义的myBlock
    int newMutiplier = myBlock(3);
    printf("newMutiplier is %d\n",myBlock(3));
    
   __block int x = 100;
    void (^sumXAndYBlock)(int) = ^(int y){
        x = x+y;
        printf("new x value is %d\n",x);
    };
    sumXAndYBlock(50);
    
    __block int x2=120;
    void (^jianXAndYBlock)(int)=^(int y){
        x2=x2*y;
        printf("new jian x value is %d\n",x2);
    };
    jianXAndYBlock(2);
    
    testModel *test=[[testModel alloc] init];
//    test.testBlock(@"fdsf");
    test.testBlock=^(NSString* str){
        NSLog(@"str11:%@",str);
    };
    test.testBlock(@"sjsljdlsdj");//调用属性block
    [test setExecuteFinished:^{
        NSLog(@"不传参数");
    }];
    [test setExecuteFinishedParam:^(NSString *str) {
        NSLog(@"带参数:%@",str);
    }];
    [test executeTest];
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(10, 64, self.view.bounds.size.width, 30)];
    NSString *title = @"Please rank from most to least the personality below you like your partner to have";
    
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc]initWithString:title];
    
    NSRange range1, range2;
    range1 = NSMakeRange(17, 3);//通过NSRange来划分片段
//    range2 = NSMakeRange(62, 12);
    
    UIColor*    color1 = [UIColor redColor]; //TITLE_TEXT_COLLOR 是我自定义的颜色
    
    [string addAttribute:NSForegroundColorAttributeName value:color1 range:range1];//给不同的片段设置不同的颜色
//    [string addAttribute:NSForegroundColorAttributeName value:color1 range:range2];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeueLTStd-BdCn" size:15] range:range1];//给不同的片段设置不同的字体
//    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeueLTStd-BdCn" size:15] range:range2];
    
//    [label setAttributedText:string];
        [self.view addSubview:label];
    [label setAttributedText:string];

}

void (^printNumBlock)(int) = ^(int num){
    printf("int number is %d",num);
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
