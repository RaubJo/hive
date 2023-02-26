{ hexString, ... }:
with builtins;
let
  base16 = {
    "0" = 0;
    "1" = 1;
    "2" = 2;
    "3" = 3;
    "4" = 4;
    "5" = 5;
    "6" = 6;
    "7" = 7;
    "8" = 8;
    "9" = 9;
    "A" = 10;
    "B" = 11;
    "C" = 12;
    "D" = 13;
    "E" = 14;
    "F" = 15;
  };

  convertPair = hexPair:
    add (mul (getAttr (substring 0 1 hexPair) base16) 16)
    (mul (getAttr (substring 1 1 hexPair) base16) 1);

  getPairsFromString = startPosition: string: substring startPosition 2 string;

  pairsInString = string: (div (stringLength string) 2);

  getPairPositionsFromString = string:
    genList (x: x * 2) (pairsInString string);

  convertHexStringToNumberString = hexString:
    map (x:
      toString (convertPair (elemAt
        (map (pos: (getPairsFromString pos hexString))
          (getPairPositionsFromString hexString)) x)))
    (genList (x: x) (pairsInString hexString));

  toRGB = h:
    "rgb(${elemAt (convertHexStringToNumberString h) 0},${
      elemAt (convertHexStringToNumberString h) 1
    },${elemAt (convertHexStringToNumberString h) 2})";
in {
  (toRGB hexString);
}
