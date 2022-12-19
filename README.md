
<div align="center">
  <img src="logo.svg" width="250" />
  <h1>The Hive</h1>
  <p>The secretly open NixOS-Society</span>
</div>

---

[![Standard](https://img.shields.io/badge/Nix-Standard-green?style=for-the-badge&logo=NixOS)](https://github.com/divnix/std)
[![Colmena](https://img.shields.io/badge/Nix-Colmena-yellow?style=for-the-badge&logo=NixOS)](https://github.com/zhaofengli/colmena)
[![Nix GL](https://img.shields.io/badge/Nix-GL-orange?style=for-the-badge&logo=NixOS)](https://github.com/guibou/nixGL)

[![NixOS Generators](https://img.shields.io/badge/NixOS-generators-yellowgreen?style=for-the-badge&logo=NixOS)](https://github.com/nix-community/nixos-generators)
[![NixOS Disko](https://img.shields.io/badge/NixOS-disko-blue?style=for-the-badge&logo=NixOS)](https://github.com/nix-community/disko)
[![NixOS Hardware](https://img.shields.io/badge/NixOS-hardware-lightgrey?style=for-the-badge&logo=NixOS)](https://github.com/nixos/nixos-hardware)

[![Support room on Matrix](https://img.shields.io/matrix/hive-std-nix:matrix.org?server_fqdn=matrix.org&style=for-the-badge)](https://matrix.to/#/#hive-std-nix:matrix.org)

# Table of Contents

1.  [How did I end up here?](#org78e5219)
2.  [System Component Overview](#orge918b31)
3.  [System Configuration Overview](#org8126b08)
    1.  [Hive](#org9123b7c)
        1.  [What is hive?](#org0760533)
        2.  [Why use Hive?](#orga452ffc)
        3.  [What about Digga?](#org65a862b)
    2.  [Hosts](#org0338a9f)
        1.  [μελετάω (Meletao : Thought)](#org25308dc)
        2.  [νέφος (Nephos : Cloud)](#orgec0d03b)
        3.  [Κουφίζω (Kouphizo : Lightweight)](#org1f2b8de)
        4.  [θυρεός (Thureos : Shield)](#org3cc2ac6)
        5.  [Κήρυγμα (Kerugma : Preach)](#orga441ec4)
    3.  [Suites](#org633d214)
    4.  [Profiles](#orgdb763cf)
4.  [Cool Nix projects](#orgccc2237)
    1.  [Implemented in this flake](#org2bd98c4)
    2.  [Others](#orgebaa9ef)
        1.  [Deployment](#org3b10491)
        2.  [Secrets Management](#orgb073a67)
        3.  [Misc](#org4dcfd7f)
5.  [Places I have learned from](#orgec751a2)
    1.  [New Nix or NixOs users](#org8acf7e4)
    2.  [General Flake stuff](#org5eaac5d)
    3.  [Standard Videos](#org27e277a)
    4.  [Random stuff I want to remember](#orgb2c01f8)



<a id="org78e5219"></a>

# How did I end up here?

I kept a list of programs that I had installed and was working on finding a program with which to manage all my meticulously crafted dotfiles while simultaneously jumping down the emacs rabbit hole, specifically [Doom Emacs](https://github.com/doomemacs/doomemacs) (Thanks [DistroTube](https://distro.tube/index.html) !) I fell in love with the configuration system of Doom Emacs.

I then started watching [System Crafters](https:systemcrafters.net) on YouTube and was introduced to [Guix](https:guix.gnu.org) which I tried to install on an older laptop that needed proprietary software in order to have operable WiFi. I looked for something that allowed unfree software and binary blobs out of the box, behold, NixOs.

For the last seven years I had distro hopped: Ubuntu, Debian, Arch, Fedora, Arch again, Manjaro, now my pursuit of sanity is done. I failed. I give up and Nixos is my final computational resting place.

If you are looking at this repo, I don&rsquo;t think I need to explain what [NixOS](https://www.nixos.org) is. I will warn you, once you take the first step of configuring a system, *You Will Never Go Back*.


<a id="orge918b31"></a>

# System Component Overview

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">Meletao</td>
<td class="org-left">Kouphizo</td>
<td class="org-left">Kerugma</td>
<td class="org-left">Nephos</td>
<td class="org-left">Thureos</td>
</tr>


<tr>
<td class="org-left">Shell</td>
<td class="org-left">Fish</td>
<td class="org-left">Fish</td>
<td class="org-left">Fish</td>
<td class="org-left">Bash</td>
<td class="org-left">Bash</td>
</tr>


<tr>
<td class="org-left">Desktop Manager</td>
<td class="org-left">myXSession</td>
<td class="org-left">myXSession</td>
<td class="org-left">Gnome (Wayland)</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Window Manager</td>
<td class="org-left">Xmonad</td>
<td class="org-left">Xmonad</td>
<td class="org-left">Gnome</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Compositor</td>
<td class="org-left">Picom</td>
<td class="org-left">Picom</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Bar</td>
<td class="org-left">Xmobar</td>
<td class="org-left">Xmobar</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Hotkeys</td>
<td class="org-left">Xmonad</td>
<td class="org-left">Xmonad</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Launcher</td>
<td class="org-left">Rofi</td>
<td class="org-left">Rofi</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Theme</td>
<td class="org-left">Nord</td>
<td class="org-left">Nord</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Notifications</td>
<td class="org-left">Dunst</td>
<td class="org-left">Dunst</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Terminal</td>
<td class="org-left">Alacritty</td>
<td class="org-left">Alacritty</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>


<tr>
<td class="org-left">Editor</td>
<td class="org-left">Neovim + Doom Emacs</td>
<td class="org-left">Neovim + Doom Emacs</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">Neovim</td>
<td class="org-left">Neovim</td>
</tr>


<tr>
<td class="org-left">Web Browser</td>
<td class="org-left">Qutebrowser</td>
<td class="org-left">Qutebrowser</td>
<td class="org-left">Epiphany</td>
<td class="org-left">-</td>
<td class="org-left">-</td>
</tr>
</tbody>
</table>


<a id="org8126b08"></a>

# System Configuration Overview

This configuration uses NixOs [Flakes](https://nixos.wiki/wiki/Flakes) and the [Hive](https://github.com/divnix/hive) library/framework.

:NOTE: Understanding how to implement a flake based configuration took me a long time. I don&rsquo;t know how many times I have read the std docs and source code.


<a id="org9123b7c"></a>

## Hive


<a id="org0760533"></a>

### What is hive?

Hive is a Nixos system configuration flake with the naming convention around a beehive.


<a id="orga452ffc"></a>

### Why use Hive?

I use hive primarily because of its integration with [std](https://github.com/divnix/std).


<a id="org65a862b"></a>

### What about Digga?

When I came across Divnix and [Digga](https://github.com/divnix/digga), I began to switch to it. I liked the organization of [Digga](https://github.com/divnix/digga) and it made sense while holding to the &rsquo;traditional&rsquo; nix flake layout. At the same time whilst digging around in the Divnix repos I couldn&rsquo;t help notice Hive and [std](https://github.com/divnix/std). As I read the Standard book (more than once) and played with it in &rsquo;nix repl&rsquo; I decided to skip the [Digga](https://github.com/divnix/digga) config and use [Hive](https://github.com/divnix/hive), this was further solidified after watching all of the [std](https://github.com/divnix/std) videos (linked below).


<a id="org0338a9f"></a>

## Hosts


<a id="org25308dc"></a>

### μελετάω (Meletao : Thought)

-   Daily driver laptop, this is where I do most of my work.


<a id="orgec0d03b"></a>

### νέφος (Nephos : Cloud)

-   Desktop server
-   Runs cloud services


<a id="org1f2b8de"></a>

### Κουφίζω (Kouphizo : Lightweight)

-   Pinebook Pro
-   Light in weight and processing &#x2026;, great for traveling.


<a id="org3cc2ac6"></a>

### θυρεός (Thureos : Shield)

-   Raspberry Pi Zero W
-   Protector of my network via pihole and tailscale.


<a id="orga441ec4"></a>

### Κήρυγμα (Kerugma : Preach)

-   Microsoft Surface Go 2
-   Used when teaching


<a id="org633d214"></a>

## Suites

These are collections of profiles.


<a id="orgdb763cf"></a>

## Profiles

These are applications configured for use in NixOs


<a id="orgccc2237"></a>

# Cool Nix projects


<a id="org2bd98c4"></a>

## Implemented in this flake

-   [Home-manager](https://github.com/nix-community/home-manager)
-   [Colmena](https://github.com/zhaofengli/colmena)
-   [Disko](https://github.com/nix-community/disko)
-   [Devshell](https://github.com/numtide/devshell)
-   [Nix-colors](https://github.com/misterio77/nix-colors)
-   [Nixos-hardware](https://github.com/nix-community/nixos-hardware)
-   [Flake-utils](https://github.com/numtide/flake-utils)
-   [Flake-utils-plus](https://github.com/gytis-ivaskevicius/flake-utils-plus)
-   [Agenix](https://github.com/ryantm/agenix)


<a id="orgebaa9ef"></a>

## Others


<a id="org3b10491"></a>

### Deployment

-   [Deploy-rs](https://github.com/serokell/deploy-rs)
-   [Morph](https://github.com/DBCDK/morph)


<a id="orgb073a67"></a>

### Secrets Management

-   [Sops-nix](https://github.com/Mic92/sops-nix)
-   [Ragenix](https://github.com/yaxitech/ragenix) Rust based cli for agenix
-   [Homeage](https://github.com/jordanisaacs/homeage)


<a id="org4dcfd7f"></a>

### Misc

-   [Dconf2nix](https://github.com/gvolpe/dconf2nix)
-   [Impermanence](https://github.com/nix-community/impermanence)


<a id="orgec751a2"></a>

# Places I have learned from


<a id="org8acf7e4"></a>

## New Nix or NixOs users

-   <https://nixos.org/guides/nix-language.html>
-   <https://book.divnix.com/>
-   <https://nixos.org/manual/nix/stable/introduction.html>
-   <https://github.com/justinwoo/nix-shorts>
-   <https://ianthehenry.com/posts/how-to-learn-nix/introduction/>


<a id="org5eaac5d"></a>

## General Flake stuff

-   <https://www.tweag.io/blog/2020-05-25-flakes/>
-   <https://nixos.wiki/wiki/Flakes>
-   <https://github.com/hlissner/dotfiles>
-   <https://www.youtube.com/channel/UC-cY3DcYladGdFQWIKL90SQ>


<a id="org27e277a"></a>

## Standard Videos

These were what help me understand [std](https://github.com/divnix/std) the most. It makes sense of Hive&rsquo;s source code.

-   [Std - Introduction](https://www.loom.com/share/cf9d5d1a10514d65bf6b8287f7ddc7d6)
-   [Std - Cell Blocks Deep Dive](https://www.loom.com/share/04fa1d578fd044059b02c9c052d87b77)
-   [Std - Operables & OCI](https://www.loom.com/share/27d91aa1eac24bcaaaed18ea6d6d03ca)
-   [Std - Nixago](https://www.loom.com/share/5c1badd77ab641d3b8e256ddbba69042)


<a id="orgb2c01f8"></a>

## Random stuff I want to remember

-   [Winter Theme](https://github.com/KubqoA/dotfiles)

