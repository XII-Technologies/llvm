//===-- aeabi_memmove.S - EABI memmove implementation --------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===---------------------------------------------------------------------===//

#include "../assembly.h"

//  void __aeabi_memmove(void *dest, void *src, size_t n) { memmove(dest, src, n); }

        .p2align 2
DEFINE_COMPILERRT_FUNCTION(__aeabi_memmove)
#ifdef USE_THUMB_1
        push    {r7, lr}
        bl      memmove
        pop     {r7, pc}
#else
#if defined(__ARM_FEATURE_BTI_DEFAULT)
        bti
#endif
        b       memmove
#endif
END_COMPILERRT_FUNCTION(__aeabi_memmove)

DEFINE_AEABI_FUNCTION_ALIAS(__aeabi_memmove4, __aeabi_memmove)
DEFINE_AEABI_FUNCTION_ALIAS(__aeabi_memmove8, __aeabi_memmove)

NO_EXEC_STACK_DIRECTIVE

