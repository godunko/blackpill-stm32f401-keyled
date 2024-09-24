
all: build

build:
	alr build
	alr exec -- arm-eabi-objcopy -O binary bin/demo.elf bin/demo.bin

dump:
	alr exec -- arm-eabi-objdump --disassemble bin/demo.elf
	alr exec -- arm-eabi-readelf -l bin/demo.elf

clean:
	rm -rf .objs bin alire config


flash-ocd: build
	openocd -f interface/cmsis-dap.cfg -f target/stm32f4x.cfg -c 'program bin/demo.bin verify reset exit 0x08000000'

ocd:
	openocd -f interface/cmsis-dap.cfg -f target/stm32f4x.cfg

gdb:
	eval `alr printenv` && arm-eabi-gdb --command="gdbinit" .objs/main.elf
