#include <string.h>
#include <stdio.h>
#include "utils.h"
#include "uart.h"
#include "dac.h"
#include "bench.h"

int main() {
  printf("Test DAC !!!!!\n");

  /* Write to DAC CH1 data Register */
  write_dac_ch1_data(0x80);

  print_summary(0);
  return 0;
}
