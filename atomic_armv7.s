080002b0 <count>:

#include <stdio.h>
#include <stdlib.h>
#include <stdatomic.h>
int sum = 0;
void count(){
 80002b0:	b480      	push	{r7}
 80002b2:	b083      	sub	sp, #12
 80002b4:	af00      	add	r7, sp, #0
    for (int i = 0; i < 10000000; i++){
 80002b6:	2300      	movs	r3, #0
 80002b8:	607b      	str	r3, [r7, #4]
 80002ba:	e00f      	b.n	80002dc <count+0x2c>
        /* sum = sum + 1*/
        atomic_fetch_add(&sum, 1);
 80002bc:	4b0c      	ldr	r3, [pc, #48]	; (80002f0 <count+0x40>)
 80002be:	f3bf 8f5b 	dmb	ish
 80002c2:	e853 2f00 	ldrex	r2, [r3]
 80002c6:	f102 0201 	add.w	r2, r2, #1
 80002ca:	e843 2100 	strex	r1, r2, [r3]
 80002ce:	2900      	cmp	r1, #0
 80002d0:	d1f7      	bne.n	80002c2 <count+0x12>
 80002d2:	f3bf 8f5b 	dmb	ish
    for (int i = 0; i < 10000000; i++){
 80002d6:	687b      	ldr	r3, [r7, #4]
 80002d8:	3301      	adds	r3, #1
 80002da:	607b      	str	r3, [r7, #4]
 80002dc:	687b      	ldr	r3, [r7, #4]
 80002de:	4a05      	ldr	r2, [pc, #20]	; (80002f4 <count+0x44>)
 80002e0:	4293      	cmp	r3, r2
 80002e2:	ddeb      	ble.n	80002bc <count+0xc>
    }
}