--
--  Copyright (C) 2024, Vadim Godunko <vgodunko@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--

with A0B.ARMv7M.CMSIS;

procedure Key_LED_Demo.Driver is
begin
   Key_LED_Demo.Initialize;

   A0B.ARMv7M.CMSIS.Enable_Interrupts;

   loop
      --  Switch CPU into lower power mode.

      A0B.ARMv7M.CMSIS.Wait_For_Interrupt;
   end loop;
end Key_LED_Demo.Driver;
