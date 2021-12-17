08000204 <fibn>:
/*
 * fb[0] = 1
 * fb[1] = 1
 * fb[i] = fb[i-1] + fb[i-2];
 */
int fibn(int n){
 8000204:	b480      	push	{r7}
 8000206:	b087      	sub	sp, #28
 8000208:	af00      	add	r7, sp, #0
 800020a:	6078      	str	r0, [r7, #4]
	int fb1 = 1;
 800020c:	2301      	movs	r3, #1
 800020e:	617b      	str	r3, [r7, #20]
	int fb0 = 1;
 8000210:	2301      	movs	r3, #1
 8000212:	613b      	str	r3, [r7, #16]
	int fb;
	for(int i = 2; i <= n - 1; i++){
 8000214:	2302      	movs	r3, #2
 8000216:	60bb      	str	r3, [r7, #8]
 8000218:	e00a      	b.n	8000230 <fibn+0x2c>
		fb = fb0 + fb1;
 800021a:	693a      	ldr	r2, [r7, #16]
 800021c:	697b      	ldr	r3, [r7, #20]
 800021e:	4413      	add	r3, r2
 8000220:	60fb      	str	r3, [r7, #12]
		fb0 = fb1;
 8000222:	697b      	ldr	r3, [r7, #20]
 8000224:	613b      	str	r3, [r7, #16]
		fb1 = fb;
 8000226:	68fb      	ldr	r3, [r7, #12]
 8000228:	617b      	str	r3, [r7, #20]
	for(int i = 2; i <= n - 1; i++){
 800022a:	68bb      	ldr	r3, [r7, #8]
 800022c:	3301      	adds	r3, #1
 800022e:	60bb      	str	r3, [r7, #8]
 8000230:	687b      	ldr	r3, [r7, #4]
 8000232:	3b01      	subs	r3, #1
 8000234:	68ba      	ldr	r2, [r7, #8]
 8000236:	429a      	cmp	r2, r3
 8000238:	ddef      	ble.n	800021a <fibn+0x16>
	}
	return fb;
 800023a:	68fb      	ldr	r3, [r7, #12]
}