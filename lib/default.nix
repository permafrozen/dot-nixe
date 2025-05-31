{ lib, ... }:
{
  decToHex =
    decimalString:
    let
      decimal = builtins.fromJSON decimalString;
      integer = lib.strings.toInt (toString (builtins.floor (decimal * 255)));
      hex = lib.trivial.toHexString integer;
    in
    if (lib.stringLength hex) == 1 then "0${hex}" else hex;
}
