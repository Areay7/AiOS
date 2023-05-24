#include <AiOS/AiOS.h>

int magic = AiOS_MAGIC;
char message[] = "Hello AiOS ~~~";  // .data
char buf[1024];                     // .bss

void kernel_init()
{
    char *video = (char *) 0xb8000; // 文本显示器的内存位置
    for(int i = 0; i < sizeof(message); i++)
    {
        video[i * 2] = message[i];
    }
}