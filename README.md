<center>
  <table align="center" width="100%" style="margin: 0 auto;">
    <tr>
      <td align="center">
        <strong><a href="https://ricin.im">Ricin</a>: A dead-simple but powerful Tox client.</strong>
      </td>
      <td align="center">
        <a href="https://github.com/RicinApp/Ricin/releases">
          <img src="https://img.shields.io/github/release/RicinApp/Ricin.svg?style=flat">
        </a>
        <a href="https://raw.githubusercontent.com/RicinApp/Ricin/master/LICENSE">
          <img src="https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat">
        </a>
        <a href="https://www.bountysource.com/teams/RicinApp">
          <img src="https://img.shields.io/bountysource/team/RicinApp/activity.svg?style=flat" alt="Support development">
        </a>
        <a href="https://travis-ci.org/RicinApp/Ricin">
          <img src="https://api.travis-ci.org/RicinApp/Ricin.svg" alt="TravisCI build status">
        </a>
      </td>
    </tr>
    <tr>
      <td align="center" width="100%" colspan="2">
        <big><b>Want to get involved? There are several ways you can help us! ^-^</b></big><br>
        <a href="#install">Install</a> -
        <a href="#compile">Compile</a> -
        <a href="docs/CONTRIBUTING.md">Contribute</a> -
        <a href="#translate">Translate</a> -
        <a href="#support-ricin-developement">Support us</a> -
        <a href="#discover-vala">Discover Vala</a>
      </td>
    </tr>
  </table>
</center>

# Introduction
**Ricin** aims to be a _secure_, _lightweight_, _hackable_ and _fully-customizable_ chat client using the awesome and open-source **ToxCore** library. We know that there are several Tox clients but this project was initially made because the other clients are still missing many features that users have been waiting for over many months. Ricin is a simple but powerful cross-platform client written in Vala and using Gtk+ 3.0.

_Screenshot might be outdated but it should give you a general idea of what Ricin is_
![Early version](https://ricin.im/static/images/ricin_01.png)

# Dependencies
| Package name   | Notes      | Version   |
|:---------------|:----------:|----------:|
| [meson]        |  building  | >=0.30.0  |
| [ninja]        |  building  | >=1.5.1   |
| valac          |  building  | >=0.28.1  |
| gtk+3          |            | >=3.16    |
| [libtoxcore]   |            | >=0.0.0   |
| glib2          |            | >=2.38    |
| json-glib      |            | >=1.0     |
| libsoup        |            | >=2.4     |
| libnotify      |            | >=0.7.6   |
| libconfig      |            | >=1.5.0   |

# Install
## Linux
### ArchLinux
Thanks to [LastAvenger] Arch users can enjoy a package located here: [ricin-git]  
Installing the package from a shell is simple as doing this:
```bash
yaourt -S ricin-git
```

### Other Linux distributions
For other systems that doesn't yet have a package you'll have a to compile & install Ricin from sources.  
First, install Ricin's <a href="#dependencies">dependencies</a> then run the following commands in a shell:
```bash
git clone --recursive https://github.com/RicinApp/Ricin.git && cd Ricin
make autogen
sudo make install
```

## Windows
Ricin isn't yet available on Windows, anyway this is planed.

## OSX
Ricin isn't yet available on OSX, anyway this is also planed!

# Compile
Please refer to the [INSTALL.md] to install the dependencies on your Linux distribution.

```bash
git clone --recursive https://github.com/RicinApp/Ricin.git && cd Ricin
make autogen
make debug
```

# Support Ricin developement
You can support the Ricin client developement by
- [Paying us a Bounty]
- **Bitcoin:** btc.ricin.im (OpenAlias) or [3L7B6XAQM27uxfRK8wUQ4fsfja832EKweM](https://blockchain.info/address/3L7B6XAQM27uxfRK8wUQ4fsfja832EKweM)
- **Litecoin:** ltc.ricin.im (OpenAlias) or [LUDFUqvZkjXCvaroNiap5vXHzMGeTB8F8x](https://bchain.info/LTC/addr/LUDFUqvZkjXCvaroNiap5vXHzMGeTB8F8x)
- Backing an issue via Bountysource to make people able to work on it full-time! :)

# Translate
Ricin uses Transifex in order to maintain Localization and enable users to help us translating it in their native language.  
Here's a graphic about the translations' state:

![Translations state for Ricin](https://www.transifex.com/projects/p/ricin/resource/ricinpot/chart/image_png)

## How to translate
In order to make a translation, please create an account on Transifex, then [go to this page] and select the language you want to translate it. Transifex will redirect you to a page where you'll be able to translate Ricin's strings.

**Please respect the following rules while translating:**
- Always use the same markup as the original string.
- Don't remove trailing spaces if any, they are needed for Ricin to display text correctly.
- Please try to translate using similar words, don't use funny words.
- Write the sentences in an imperative way.
- Translations will be reviewed string by string and parts of it could be rejected it the above rules are not respected.

# Discover Vala
Before clicking on any link below, you must know what Vala is and why it is so powerful and easy to use: [What is Vala?]

- [Official Vala website](https://live.gnome.org/Vala)
- [Official Vala documentation](http://www.valadoc.org)
- [Download Vala compiler and tools](https://wiki.gnome.org/Projects/Vala/Tools)
- [The Vala Tutorial](https://wiki.gnome.org/Projects/Vala/Tutorial): (English) (Spanish) (Russian) (Hebrew)
- [Vala for C# Programmers](https://wiki.gnome.org/Projects/Vala/ValaForCSharpProgrammers)
- [Vala for Java Programmers](https://wiki.gnome.org/Projects/Vala/ValaForJavaProgrammers): (English) (Russian)
- [Vala memory management explained](https://wiki.gnome.org/Projects/Vala/ReferenceHandling)
- [Writing VAPI files](https://wiki.gnome.org/Projects/Vala/LegacyBindings): A document that explains how to write VAPI binding files for a C library.

[libtoxcore]: https://github.com/irungentoo/toxcore/blob/master/INSTALL.md
[meson]: http://mesonbuild.com/
[ninja]: http://martine.github.io/ninja/
[LastAvenger]: https://github.com/LastAvenger
[ricin-git]: https://aur.archlinux.org/packages/ricin-git
[INSTALL.md]: docs/INSTALL.md
[Paying us a Bounty]: https://www.bountysource.com/teams/RicinApp
[go to this page]: https://www.transifex.com/ricinapp/ricin/ricinpot/
[What is Vala?]: https://wiki.gnome.org/Projects/Vala/About
