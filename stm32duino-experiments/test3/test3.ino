// MAX7219-powered 7-segment display

/* SS    <-->  PA4 <-->  BOARD_SPI1_NSS_PIN */
/* SCK   <-->  PA5 <-->  BOARD_SPI1_SCK_PIN */
/* MISO  <-->  PA6 <-->  BOARD_SPI1_MISO_PIN */
/* MOSI  <-->  PA7 <-->  BOARD_SPI1_MOSI_PIN */

#include <SPI.h>
#include <STM32ADC.h>
#define SPI1_NSS_PIN PA4

STM32ADC ADC_1(ADC1); // Set up ADC (internal device, not the pin)

uint32 avg = 0;  // Global because they should persist between loop iterations,
uint32 avg2 = 0; // uint32 because that's what the display functions accept.

int int_len(int x) { // believe it or not, this is the fastest way
  /* if (x >= 1000000000) return 10; */
  /* if (x >= 100000000)  return 9; */
  if (x >= 10000000)   return 8; // limited to 8 because 8 digit display
  if (x >= 1000000)    return 7;
  if (x >= 100000)     return 6;
  if (x >= 10000)      return 5;
  if (x >= 1000)       return 4;
  if (x >= 100)        return 3;
  if (x >= 10)         return 2;
  return 1;
}

void display_send_data(int spi_data){ // sends one value
  gpio_write_bit(GPIOA, 4, LOW);
  SPI.transfer(spi_data);
  gpio_write_bit(GPIOA, 4, HIGH);
};

void display_send_cmd(int address, int data){ // sends two values
                      // useful because that's how the MAX7219 formats commands
  gpio_write_bit(GPIOA, 4, LOW);
  SPI.transfer(address);
  SPI.transfer(data);
  gpio_write_bit(GPIOA, 4, HIGH);
};

void display_int(int value){

  if (value < 100000000 && value > -10000000){
    // If outside this, more than 8 digits needed, so stop
    int digit;
    if (value < 0){
      display_send_cmd(0x07, 0x0A); // negative sign in first digit
    }
    int i = 1;
    while ((value > 0 && i < 9) || (value == 0 && i == 1)){
      digit = value % 10; // this goes through the value by powers of 10
      display_send_cmd(i, digit); // write digit to the correct position
      value /= 10;
      i++;
    }
    if (i < 8){
      for (int j = 8; j > (i-1); j--){
        display_send_cmd(j, 0x0F); // clear all digits not written to,
      }                            // needed to clear previous data
    }
  }
};

void display_int_offset(int value, int offset){

  if ((value < 100000000 && value > -10000000)){
    // If outside this, more than 8 digits needed, so stop
    int digit;
    if (value < 0){
      display_send_cmd(0x07, 0x0A); // negative sign in first digit
    }
    int i = 1;
    while ((value > 0 && i < 9) || (value == 0 && i == 1)){
      digit = value % 10; // this goes through the value by powers of 10
      display_send_cmd(i, digit); // write digit to the correct position
      value /= 10;
      i++;
    }
    if (i < 8){
      for (int j = 8; j > i; j--){
        display_send_cmd(j, 0x0F); // clear all digits not written to,
                                   // needed to clear previous data
      }
    }
  }
 };

void display_decimal(int value, int decimal_position){

  if (value < 100000000 && value > -10000000){
    // If outside this, more than 8 digits needed.
    int digit;
    if (value < 0){
      display_send_cmd(0x07, 0x0A); // negative sign in first digit
    }
    if (decimal_position < 0){
      decimal_position = -1 * decimal_position * int_len(value);
    };
    int i = 1;
    while ((value > 0 && i < 9) || (value == 0 && i == 1)){
      digit = value % 10; // this goes through the value by powers of 10
      if (i == decimal_position){
        digit = digit | 0x80; // bitwise "or" sets a 1 at beginning of byte,
                              // turning on the decimal point at that digit
      };
      display_send_cmd(i, digit); // write digit to the correct position
      value /= 10;
      i++;
    }
    if (i < 8){
      for (int j = 8; j > i; j--){
        display_send_cmd(j, 0x0F);  // clear all digits not written to,
      }                             // needed to clear previous data
    }
  }
};

void setup(){

  SPI.begin();                  // Initialize the SPI_1 port.
  SPI.setBitOrder(MSBFIRST);    // Set the SPI_1 bit order, most sig. bit
  SPI.setDataMode(SPI_MODE0);   // Set the  SPI_1 data mode 0
  SPI.setClockDivider(SPI_CLOCK_DIV8); // Slow speed
  // (72 / 16 = 4.5 MHz SPI_1 speed)
  delay(25); // A slight delay before setting NSS_PIN to output, may or may not
             // be necessary

  pinMode(SPI1_NSS_PIN, OUTPUT); // note: this must be after the SPI.begin(),
  // for gpio control of CSN


  pinMode(PC13, OUTPUT);
  gpio_write_bit(GPIOC, 13, LOW); // Turn on the user LED (it's on-low)


  display_send_cmd(0x0F,0x01); // display test mode on
  delay(200); // No actual reason for turning it on, I just like it
  display_send_cmd(0x0F,0x00); // display test mode off

  display_send_cmd(0x0C,0x01); // shutdown mode off (may be blank otherwise)
  delayMicroseconds(10); // these delays may not be necessary, but are
                      // included to counter any instability during prototyping

  display_send_cmd(0x09,0xFF); // decode mode settings
  // (each digit is its value in binary)
  // so, rightmost digit is 0x01, 4 rightmost are 0x0F, all 8 is 0xFF,
  // and leftmost 7 is 0xFE.
  delayMicroseconds(10);

  display_send_cmd(0x0B,0x07); // scan limit. 0x07 is all 8,
  // 0x00 is only first digit. "Scan" is how many digits are activated.
  delayMicroseconds(10);

  display_send_cmd(0x0A,0x04); // intensity control, "brightness"
  delayMicroseconds(10);

  for (int i=0; i<9; i++){ // make all digits "blank" char
    display_send_data(i);
    display_send_data(0x0F);
    delayMicroseconds(10);
  }

  pinMode(PA0, INPUT_ANALOG); // This mode is what's used for an ADC.
  ADC_1.calibrate(); // No idea what this actually does, just read the library.

  pinMode(PB8, PWM); 
  pwmWrite(PB8, 200);

}

void loop(){

  int sum = 0;

  for (int i=0;i<5000;i++){
    int sample = analogRead(PA0);
    sum += sample;
    delayMicroseconds(10);
  }

  avg2 = avg;
  avg = sum / 5000;
  int value = (330000*((avg+avg2)/2)) / 4095;
  display_decimal(value, -1);
  /* display_int(value); */
  pwmWrite(PB8, (avg*65535)/4095);
  delay(10);

}




