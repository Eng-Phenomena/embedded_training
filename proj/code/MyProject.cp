#line 1 "C:/Users/f_hos/Desktop/proj/code/MyProject.c"
int arr[] = {0b00100011,0b00010101};
int i = 0, tmp = 1;
void main(void)
{
 trisb = 0x00;
 trisc = 0x00;
 trisd = 0x60;
 portb = 0x00;
 portc = 0x00;
 portd.B7 = 1;

 while(1)
 {
 portb = arr[i];
 delay_ms(500);
 while(portd.B7){
 if(portd.B6 == 0)
 portd.B7 = 0;
 if(i == 0){
 portc = 0x21;
 if(portb <= 0x03){
 portc = 0x11;
 }
 }
 else{
 portc = 0x0c;
 if(portb <= 0x03){
 portc = 0x0a;
 }
 }

 portb--;
 delay_ms(500);
 if(portb == 0x00){
 break;
 }
 if(!(portb & 0x0f)){
 portb -= 0x10;
 portb.B0 = portb.B3 = 1;
 portb.B1 = portb.B2 = 0;
 delay_ms(500);
 }

 }
 if(portd.B6 == 0){
 portd.B7 = 0;
 if(portd.B5 != 0){
 if(tmp == 1){
 portc = 0x12;
 delay_ms(1000);
 tmp--;
 }
 portc = 0x21;
 }
 else{
 if(tmp == 0){
 portc = 0x12;
 delay_ms(1000);
 tmp++;
 }
 portc = 0x0c;
 }
 }
 else
 portd.B7 = 1;
 if(i == 0)
 i = 1;
 else
 i = 0;
 }
}
