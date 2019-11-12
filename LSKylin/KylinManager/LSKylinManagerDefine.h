//
//  LSKylinManagerDefine.h
//  LSKylin
//
//  Created by lhs7248 on 2019/11/12.
//  Copyright © 2019 lhs7248. All rights reserved.
//

#ifndef LSKylinManagerDefine_h
#define LSKylinManagerDefine_h
// 设置启动阶段的key值 A
#ifndef LSKylinSTAGE_KEY_A
#define LSKylinSTAGE_KEY_A "LSSTAGE_KEY_A"
#endif
// 设置启动阶段的key值 B
#ifndef LSKylinSTAGE_KEY_B
#define LSKylinSTAGE_KEY_B "LSSTAGE_KEY_B"
#endif
// 设置启动阶段的key值 C
#ifndef LSKylinSTAGE_KEY_C
#define LSKylinSTAGE_KEY_C "LSSTAGE_KEY_C"
#endif
// 设置启动阶段的key值 D
#ifndef LSKylinSTAGE_KEY_D
#define LSKylinSTAGE_KEY_D "LSSTAGE_KEY_D"
#endif
// 设置启动阶段的key值 E
#ifndef LSKylinSTAGE_KEY_E
#define LSKylinSTAGE_KEY_E "LSSTAGE_KEY_E"
#endif



//#ifndef STAGE_KEY_A

#define LSKylinDATA(sectName) __attribute((used, section("__DATA,"#sectName" ")))


#define LSKLN_FUNCTIONS_EXPORT(className,STAGE_KEY) \
    static void LSKylin##className##_FUNCTIONS_IMP (void);\
    void (*LSKylin##className##_FUNCTIONS) (void) LSKylinDATA(STAGE_KEY) = LSKylin##className##_FUNCTIONS_IMP; \
    void LSKylin##className##_FUNCTIONS_IMP (void)


#endif /* LSKylinManagerDefine_h */
