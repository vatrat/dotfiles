// MAX7219-powered 7-segment display

/* SS    <-->  PA4 <-->  BOARD_SPI1_NSS_PIN */
/* SCK   <-->  PA5 <-->  BOARD_SPI1_SCK_PIN */
/* MISO  <-->  PA6 <-->  BOARD_SPI1_MISO_PIN */
/* MOSI  <-->  PA7 <-->  BOARD_SPI1_MOSI_PIN */

#include <SPI.h>
#include <STM32ADC.h>
#define SPI1_NSS_PIN PA4

STM32ADC ADC_1(ADC1);

void display_send_data(int spi_data){
  gpio_write_bit(GPIOA, 4, LOW);
  SPI.transfer(spi_data);
  gpio_write_bit(GPIOA, 4, HIGH);
};

void display_send_cmd(int address, int data){
  gpio_write_bit(GPIOA, 4, LOW);
  SPI.transfer(address);
  SPI.transfer(data);
  gpio_write_bit(GPIOA, 4, HIGH);
};

void display_int(int value){
  if (value < 100000000 && value > -10000000){ // If outside this, more than 8 digits needed.
    if (value < 0){
      display_send_cmd(0x07, 0x0A);
    }
    int i = 1;
    while ((value > 0 && i < 9) || (value == 0 && i == 1)){
      int digit = value % 10;
      display_send_cmd(i, digit);
      value /= 10;
      i++;
    }
    if (i < 8){
      for (int j = 8; j > i; j--){
        display_send_cmd(j, 0x0F);
      }
    }
  }
};

void display_int_offset(int value, int offset){
  if ((value < 100000000 && value > -10000000)){
    if (value < 0){
      display_send_cmd(0x07, 0x0A);
    }
    int i = 1;
    while ((value > 0 && i < 9) || (value == 0 && i == 1)){
      int digit = value % 10;
      display_send_cmd(i, digit);
      value /= 10;
      i++;
    }
    if (i < 8){
      for (int j = 8; j > i; j--){
        display_send_cmd(j, 0x0F);
      }
    }
  }
 };

void display_decimal(int value){
  
};

void setup(){
  pinMode(PC13, OUTPUT);

  SPI.begin();                  //Initialize the SPI_1 port.
  SPI.setBitOrder(MSBFIRST);    // Set the SPI_1 bit order
  SPI.setDataMode(SPI_MODE0);   //Set the  SPI_1 data mode 0
  SPI.setClockDivider(SPI_CLOCK_DIV8); // Slow speed (72 / 16 = 4.5 MHz SPI_1 speed)
  delay(25);
  pinMode(SPI1_NSS_PIN, OUTPUT); // note: this must be after the SPI.begin() for gpio control of CSN
  gpio_write_bit(GPIOC, 13, LOW);

  display_send_cmd(0x0F,0x01); // display test mode on
  delay(500);
  display_send_cmd(0x0F,0x00); // display test mode off
  display_send_cmd(0x0C,0x01); // shutdown mode off (may be blank otherwise)
  delayMicroseconds(10);
  display_send_cmd(0x09,0xFF); // decode mode settings (each digit is its value in binary)
  // so, rightmost digit is 0x01, 4 rightmost are 0x0F, all 8 is 0xFF, leftmost 7 is 0xFE.
  delayMicroseconds(10);
  display_send_cmd(0x0B,0x07); // scan limit. 0x07 is all 8, 0x00 is only first digit
  delayMicroseconds(10);
  display_send_cmd(0x0A,0x04); // intensity control
  delayMicroseconds(10);

  for (int i=0; i<9; i++){
    display_send_data(i);
    display_send_data(0x0F); // make all digits "blank" char
    delayMicroseconds(10);
  }

  pinMode(PA0, INPUT_ANALOG);

  ADC_1.calibrate();

}

void loop(){

  /* display_int(1); */
  /* delay(300); */
  /* display_int(0); */
  /* delay(300); */

  int sum = 0;
  uint32 avg = 0;
  for (int i=0;i<5000;i++){
    int sample = analogRead(PA0);
    sum += sample;
    delayMicroseconds(10);
  }
  avg = sum / 5000;
  display_int((33000*avg)/4095);
  delay(10);

}




