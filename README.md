# BlackPill STM32F401 LED-Key Demo

This crate provides an example how to implement LED on/off by the button press using external interrupts.

## Build and flash

You need to install [Alire](https://alire.ada.dev/) first, and add [A0B Alire Index](https://github.com/godunko/a0b-alire-index), then clone repositiory.

To build demo type

```
make
```

To build and flash demo using OpenOCD and CMSIS-DAP dongle type

```
make flash-ocd
```

That's all!
