//
//  LSKylinManager.h
//  LSKylin
//
//  Created by lhs7248 on 2019/11/12.
//  Copyright © 2019 lhs7248. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSKylinManager : NSObject
/**
 初始化方法
 @return 实例对象
 */
+(instancetype)sharedInstance;


/**
 触发 注册到 STAGE_KEY 的阶段逻辑
 @param STAGE_KEY 启动阶段
 */
- (void)executeArrayForKey:(NSString *)STAGE_KEY;
@end

NS_ASSUME_NONNULL_END
