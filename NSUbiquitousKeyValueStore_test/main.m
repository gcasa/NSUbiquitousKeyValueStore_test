//
//  main.m
//  NSUbiquitousKeyValueStore_test
//
//  Created by Gregory John Casamento on 7/7/19.
//  Copyright © 2019 Gregory John Casamento. All rights reserved.
//

#import <Foundation/Foundation.h>


void passTest(BOOL flag,
              NSString *msg)
{
    if(flag == YES)
    {
        NSLog(@"PASS: %@",msg);
    }
    else
    {
        NSLog(@"FAIL: %@",msg);
    }
}

/*
 NSByteCountFormatterCountStyleFile
 Specifies display of file byte counts. The actual behavior for this is platform-specific; in macOS 10.8, this uses the decimal style, but that may change over time.
 
 NSByteCountFormatterCountStyleMemory
 Specifies display of memory byte counts. The actual behavior for this is platform-specific; in macOS 10.8, this uses the binary style, but that may change over time.
 
 NSByteCountFormatterCountStyleDecimal
 Causes 1000 bytes to be shown as 1 KB. It is better to use
 NSByteCountFormatterCountStyleFile
 or
 NSByteCountFormatterCountStyleMemory
 in most cases.
 
 NSByteCountFormatterCountStyleBinary
 Causes 1024 bytes to be shown as 1 KB. It is better to use
 NSByteCountFormatterCountStyleFile
 or
 NSByteCountFormatterCountStyleMemory
 in most cases.
 */
void runTests()
{
    NSUbiquitousKeyValueStore *kvStore = [NSUbiquitousKeyValueStore defaultStore];
    [kvStore setObject:@"Hello" forKey:@"World"];
    id obj = [kvStore objectForKey:@"World"];
    passTest([obj isEqualToString:@"Hello"], @"Returned proper value");
    
    [kvStore setString:@"Hello" forKey:@"World2"];
    obj = [kvStore objectForKey:@"World2"];
    passTest([obj isEqualToString:@"Hello"], @"Returned proper value");
    
    [kvStore setArray: [NSArray arrayWithObject:@"Hello"] forKey:@"World3"];
    obj = [kvStore objectForKey:@"World3"];
    passTest([obj isEqual:[NSArray arrayWithObject:@"Hello"] ], @"Returned proper value");
    
    [kvStore setDictionary:[NSDictionary dictionaryWithObject:@"Hello" forKey:@"World4"] forKey:@"World5"];
    obj = [kvStore objectForKey:@"World5"];
    passTest([obj isEqual:[NSDictionary dictionaryWithObject:@"Hello" forKey:@"World4"]], @"Returned proper value");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        runTests();
    }
    return 0;
}
