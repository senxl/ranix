#ifndef RANIX_CONSOLE_H
#define RANIX_CONSOLE_H

#include <ranix/types.h>

void console_init();
void console_clear();
void console_write(char *buf, u32 count);

#endif