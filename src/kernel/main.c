#include <ranix/ranix.h>
#include <ranix/types.h>
#include <ranix/io.h>
#include <ranix/string.h>
#include <ranix/console.h>

char message[] = "However mean your life is, meet it and live it;\n";
char buf[1024];

void kernel_init()
{

    console_init();
    for (int i = 1; i <= 13145200; i++)
    {
        char ch = (i%10+0x30);
        console_write(&ch, 2);
        console_write(message, sizeof(message));
    }
    
    
    
    return;
}
