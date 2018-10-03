void setup() {
  disableDebugPorts();
  // Initialize pins
  pinMode(LED_BUILTIN, OUTPUT); // LED_BUILTIN is PC13.
  pinMode(PA11, OUTPUT);
  pinMode(PA12, OUTPUT);
  pinMode(PA15, OUTPUT); // Yes, 15 is after 12. I can count!
  pinMode(PB3, OUTPUT);  // And B3 is after A15.
  pinMode(PB4, OUTPUT);
  pinMode(PB5, OUTPUT);
  pinMode(PB6, OUTPUT);
  pinMode(PB7, OUTPUT);
  pinMode(PB8, OUTPUT);
  pinMode(PB9, OUTPUT);

  pinMode(PA1, PWM);

  delay(25); // Next block doesn't work without delay, 25 is arbitrary
             // Reason for this is probably that the pins are still setting up, or something.
             // I have no reason to explore this further.

  // Set all pins to low on startup.
  gpio_write_bit(GPIOA, 11, HIGH);
  gpio_write_bit(GPIOA, 12, HIGH);
  gpio_write_bit(GPIOA, 15, HIGH);
  gpio_write_bit(GPIOB, 3,  HIGH);
  gpio_write_bit(GPIOB, 4,  HIGH);
  gpio_write_bit(GPIOB, 5,  HIGH);
  gpio_write_bit(GPIOB, 6,  HIGH);
  gpio_write_bit(GPIOB, 7,  HIGH);
  gpio_write_bit(GPIOB, 8,  HIGH);
  gpio_write_bit(GPIOB, 9,  HIGH);

  // Turn on built-in led as a canary
  gpio_write_bit(GPIOC, 13, LOW); // Built-in led is on-low.

  pwmWrite(PA1, 20000);
}

void loop() {
  gpio_write_bit(GPIOA, 11, LOW);
  delay(100);
  gpio_write_bit(GPIOA, 11, HIGH);
  gpio_write_bit(GPIOA, 12, LOW);
  delay(100);
  gpio_write_bit(GPIOA, 12, HIGH);
  gpio_write_bit(GPIOA, 15, LOW);
  delay(100);
  gpio_write_bit(GPIOA, 15, HIGH);
  gpio_write_bit(GPIOB, 3,  LOW);
  delay(100);
  gpio_write_bit(GPIOB, 3,  HIGH);
  gpio_write_bit(GPIOB, 4,  LOW);
  delay(100);
  gpio_write_bit(GPIOB, 4,  HIGH);
  gpio_write_bit(GPIOB, 5,  LOW);
  delay(100);
  gpio_write_bit(GPIOB, 5,  HIGH);
  gpio_write_bit(GPIOB, 6,  LOW);
  delay(100);
  gpio_write_bit(GPIOB, 6,  HIGH);
  gpio_write_bit(GPIOB, 7,  LOW);
  delay(100);
  gpio_write_bit(GPIOB, 7,  HIGH);
  gpio_write_bit(GPIOB, 8,  LOW);
  delay(100);
  gpio_write_bit(GPIOB, 8,  HIGH);
  gpio_write_bit(GPIOB, 9,  LOW);
  delay(100);
  gpio_write_bit(GPIOB, 9,  HIGH);
}
