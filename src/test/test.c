#include <stdio.h>

typedef char *va_list;

#define va_start(ap, v) (ap = (va_list)&v + sizeof(char *))
#define va_arg(ap, t) (*(t *)((ap += sizeof(char *)) - sizeof(char *)))
#define va_end(ap) (ap = (va_list)0)

void test_args(int cnt, ...)
{
    va_list args;
    va_start(args, cnt);

    int arg;
    while (cnt--)
    {
       arg = va_arg(args, int);
       printf("0x%x\n", arg);
    }
    va_end(args);
    
}

void test(int cnt0, ...)
{
    int i=0;
    int *p = &i;
    p += 8;


    int stack = *p;

    for (i = 0; i < 3; i++)
    {
        printf("%d\n", *p);
        p++;
    }
    
    return;
}

int main()
{
    test(5,10,15);
    printf("hello world!\n");
    test_args(3, 1, '1', 0xaa);
    return 0;
}
