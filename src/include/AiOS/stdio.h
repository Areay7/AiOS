#ifndef AiOS_STDIO_H
#define AiOS_STDIO_H

#include <AiOS/stdarg.h>

int vsprintf(char *buf, const char *fmt, va_list args);
int sprintf(char *buf, const char *fmt, ...);

#endif