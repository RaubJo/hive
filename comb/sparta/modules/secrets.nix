{ config, lib, pkgs, ... }:

{
  age.secrets.s1.file = ../secrets/s1.age;
  age.secrets.s1.mode = "444";
}
