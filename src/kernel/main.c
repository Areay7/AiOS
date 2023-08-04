#include <AiOS/AiOS.h>
#include <AiOS/types.h>
#include <AiOS/io.h>
#include <AiOS/string.h>
#include <AiOS/console.h>
#include <AiOS/printk.h>
#include <AiOS/assert.h>


void kernel_init()
{
   console_init();

   assert(3 < 5);
   // assert(3 > 5);

   panic("out of Memory");
   
   return;
}

