
#define    true      1
#define    false     0

#define setbit(var, bitno)    ((var) |= 1UL << (bitno))
#define clrbit(var, bitno)    ((var) &= ~(1UL << (bitno)))
#define getbit(var, bitno)     ((var>>bitno) & 1UL)

 void main()
 {
   TRISA = 0x00;
 
 }

