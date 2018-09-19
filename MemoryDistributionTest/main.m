//
//  main.m
//  MemoryDistributionTest
//
//  Created by yuqian on 2018/9/19.
//  Copyright © 2018年 yuqian. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger getTotalNumber (NSInteger number1 ,NSInteger number2);
void test (void);


@interface CustomObject : NSObject  {
    long a[200];
}
@end

@implementation CustomObject

@end

int main(int argc, const char * argv[]) {
    
    NSMutableSet *objs = [NSMutableSet new];
    @autoreleasepool {
//        test();
        
        for (int i = 0; i < 1000; ++i) {
            CustomObject *obj = [CustomObject new];
            [objs addObject:obj];
        }
        sleep(100000);
    }
    return 0;
}


void test (void) {
    
    int tmpAge;//栈
    NSString *tmpName = @"Dely";//栈
    NSString *number = @"123456"; //123456\\\\0在常量区，number在栈上。
    NSLog(@"&number = %p, number = %p", &number, number);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];//分配而来的8字节的区域就在堆中，array在栈中，指向堆区的地址
    NSInteger total = getTotalNumber(1, 2);
    
    
    char s[] = "abc"; //栈
    char *p1; //栈
    char *p2 = "123456";  //123456\\\\0在常量区，p2在栈上。
    static int c =0; // 全局（静态）初始化区
    NSLog(@"&s = %p, s = %p", &s, s);
    NSLog(@"&p2 = %p, s = %p", &p2, p2);
    char *w1, *w2;
    w1 = (char *)malloc(10);
    w2 = (char *)malloc(20);
    // 分配得来得10和20字节的区域就在堆区。
    NSLog(@"&w1 = %p, w1 = %p", &w1, w1);
    
    NSString *str1 = @"abc";
    NSString *str2 = [NSString stringWithString:@"abc"];
    NSString *str3 = [[NSString alloc] initWithString:@"abc"];
    NSLog(@"_______ %p %p %p",str1,str2,str3);  // 存储在常量区
    
    NSString *str4 = [NSString stringWithFormat:@"abc"];
    NSString *str5 = [[NSString alloc] initWithFormat:@"abc"];
    NSLog(@"_______ %p %p ",str4,str5); //存储在堆上，只有一份拷贝
    
    NSMutableString *str6 = [NSMutableString stringWithString:@"abc"];
    NSString *str7 = [[NSMutableString alloc] initWithString:@"abc"];
    NSLog(@"_______ %p %p ",str6,str7);
    
    NSMutableString *str8 = [[NSMutableString alloc] initWithString:@"abc"];
    NSMutableString *str9 = [NSMutableString stringWithFormat:@"abc"];
    NSLog(@"_______ %p %p ",str8,str9);
    
}

NSInteger getTotalNumber (NSInteger number1 ,NSInteger number2) {
    return number1 + number2;//number1和number2 栈区
}
