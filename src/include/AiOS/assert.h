#ifndef AiOS_ASSERT_H
#define AiOS_ASSERT_H

void assertion_failure(char *exp, char *file, char *base, int line);

#define assert(exp) \
    if (exp)        \
        ;           \
        else        \
            assertion_failure(#exp, __FILE__, __BASE_FILE__, __LINE__)
// 宕机 系统运行不下去了
void panic(const char *fmt, ...);

#endif