#include <stdio.h>

typedef char *va_list;

#define va_start(ap, v) (ap = (va_list)&v)
#define va_arg(ap, t) (*(t *)(ap += sizeof(char *)))
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



int main()
{
    // test_args(3, 1, '1', 0xaa);
    int ary[] = {5,2,3,4,5,6};

    int count = *ary;
    int *ap = ary+1;


    // printf("%p\n", ap);
    while (count--)
    {
        // printf("%d\n", (*(int *)((ap += 1) - 1)));
    }
    // printf("%p\n", ap);

    
    ap = (int *)0;
    // printf("%p\n", ap);

    test_args(5,2,3,4,5,6);

    return 0;
}
