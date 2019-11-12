//
//  LSKylinManager.m
//  LSKylin
//
//  Created by lhs7248 on 2019/11/12.
//  Copyright © 2019 lhs7248. All rights reserved.
//

#import "LSKylinManager.h"
#include <mach-o/getsect.h>
#include <mach-o/loader.h>
#include <mach-o/dyld.h>
#include <dlfcn.h>
#import <objc/runtime.h>
#import <objc/message.h>
#include <mach-o/ldsyms.h>

#include <unistd.h>
#include <stdint.h>
#include <stdio.h>


@implementation LSKylinManager
static NSArray<NSValue *>* LSKylinReadSectionConfiguration(const char *section)
{
    NSMutableArray *configs = [NSMutableArray array];
    
    Dl_info info;
    dladdr(LSKylinReadSectionConfiguration, &info);
    unsigned long size = 0;
    
#ifndef __LP64__
    // const struct mach_header *mhp = _dyld_get_image_header(0); // both works as below line
    const struct mach_header *mhp = (struct mach_header*)info.dli_fbase;
    // 找到之前存储的数据段的一片内存
    uint32_t *memory = (uint32_t*)getsectiondata(mhp, "__DATA", section, & size);
#else /* defined(__LP64__) */
    const struct mach_header_64 *mhp = (struct mach_header_64*)info.dli_fbase;
    uint64_t *memory = (uint64_t*)getsectiondata(mhp, "__DATA", section, & size);
#endif /* defined(__LP64__) */
    
    // 把特殊段里面的数据都转换成字符串存入数组中
    for(int idx = 0; idx < size/sizeof(void*); ++idx){
        
        IMP method = (IMP)memory[idx];

        [configs addObject:[NSValue valueWithPointer:method]];
    }
    
    return configs;
}




+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static LSKylinManager * manager = nil;
    dispatch_once(&onceToken, ^{
        
        manager = [[LSKylinManager alloc]init];
    });
    return manager;
}

- (void)executeArrayForKey:(NSString *)STAGE_KEY{
    NSString * sectionStr = [NSString stringWithFormat:@"\"%@\"",STAGE_KEY];
    const char * section = [sectionStr cStringUsingEncoding:NSUTF8StringEncoding];
    NSArray * methodPointArray = LSKylinReadSectionConfiguration(section);
    
    for (NSValue * value in methodPointArray) {
        
        IMP func = [value pointerValue];
        
        func();
    }
    
    
    
}

@end
