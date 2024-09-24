--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with A0B.ARMv7M.CMSIS;
with A0B.Callbacks.Generic_Parameterless;
with A0B.STM32F401.GPIO.PIOA;
with A0B.STM32F401.GPIO.PIOC;

with A0B.STM32F401.SVD.RCC; use A0B.STM32F401.SVD.RCC;

package body Key_LED_Demo is

   LED : A0B.STM32F401.GPIO.GPIO_Line renames A0B.STM32F401.GPIO.PIOC.PC13;
   Key : A0B.STM32F401.GPIO.GPIO_Line renames A0B.STM32F401.GPIO.PIOA.PA0;

   procedure On_Key;

   package On_Key_Callbacks is
     new A0B.Callbacks.Generic_Parameterless (On_Key);

   State : Boolean := False;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      RCC_Periph.AHB1ENR.GPIOAEN := True;
      RCC_Periph.AHB1ENR.GPIOCEN := True;
      RCC_Periph.APB2ENR.SYSCFGEN := True;

      Key.Configure_EXTI
        (Mode => A0B.STM32F401.GPIO.Falling_Edge,
         Pull => A0B.STM32F401.GPIO.Pull_Up);
      Key.Set_Callback (On_Key_Callbacks.Create_Callback);
      Key.Enable_Interrupt;

      LED.Configure_Output;
      LED.Set (State);
   end Initialize;

   ------------
   -- On_Key --
   ------------

   procedure On_Key is
   begin
      State := not State;
      LED.Set (State);
   end On_Key;

end Key_LED_Demo;
