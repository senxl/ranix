#include <ranix/ranix.h>
#include <ranix/types.h>
#include <ranix/io.h>
#include <ranix/string.h>
#include <ranix/console.h>
#include <ranix/printk.h>
#include <ranix/stdarg.h>
#include <ranix/assert.h>
#include <ranix/debug.h>

char message[] = "However mean your life is, meet it and live it;\n";

void test_args(int cnt, ...)
{
    va_list args;
    va_start(args, cnt);

    int arg;
    while (cnt--)
    {
       arg = va_arg(args, int);
       printk("0x%x\n", arg);
    }
    va_end(args);
    
}

void test()
{
    // test_args(3, 0x23, 0x30, 0xff);

    // assert(1>2);
    // assert(1<2);
    // panic("Run Error!");

    BMB;
    DEBUGK(message);
    // BMB;
    
}

void kernel_init()
{

    console_init();
    test();
    
    return;
}
