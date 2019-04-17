//
//  main.m
//  Lesson-6
//
//  Created by Tatiana Tsygankova on 16.04.2019.
//  Copyright © 2019 Tatiana Tsygankova. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        int a = 10;
        int b = 4;
        
        __block int c=0;
        
        dispatch_sync(globalQueue, ^{
            c = a + b;
            NSLog(@"%d + %d = %d", a, b, c);
        });
        
        dispatch_async(globalQueue, ^{
            for(int i=0; i<100; i++) {
                NSLog(@"****** c = %d", c);
            }
        });
        
        dispatch_sync(globalQueue, ^{
            c = a - b;
            NSLog(@"%d - %d = %d", a, b, c);
        });
        
        dispatch_async(globalQueue, ^{
            c = a * b;
            NSLog(@"%d * %d = %d", a, b, c);
        });
        
        dispatch_async(globalQueue, ^{
            c = a / b;
            NSLog(@"%d / %d = %d", a, b, c);
        });
        
        dispatch_async(globalQueue, ^{
            c = a % b;
            NSLog(@"%d %% %d = %d", a, b, c);
        });
        
        dispatch_async(globalQueue, ^{
            NSLog(@"%d ^ %d = %.2f", a, c, pow(a,c));
        });
        
    }
    return 0;
}
