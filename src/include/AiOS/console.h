#ifndef AiOS_CONSOLE_H
#define AiOS_CONSOLE_H

#include <AiOS/types.h>

void console_init();
void console_clear();
void console_write(char *buf, u32 count);

#endif