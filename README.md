# munkireport_scheduled

## Background

If you're using MunkiReport in combination with Munki, you'll notice that your endpoints perioically check in to MunkiReport shortly after they check into Munki. This is because [the default LaunchDaemon for MunkiReport relies on Munki's scheduling](https://github.com/munkireport/munkireport-php/wiki/Client-Runs).

If you're using MunkiReport, but not Munki, you've got a couple of options to ensure that your endpoints check into MunkiReport.

If you're using Jamf Pro, you can follow [these instructions](https://github.com/munkireport/munkireport-php/wiki/Using-MunkiReport-with-Jamf) to have the `jamf` binary perform this task for you.

If you're not using Jamf Pro, or would prefer to do it yourself, you'll need to deploy a custom LaunchDaemon to force your endpoints to check in to MunkiReport. This repo aims to help users do that.

## Requirements

Here's what you'll need to build this pkg:

1. To use the included build script, you'll need [munkipkg](https://github.com/munki/munki-pkg) installed at `/usr/local/munki-pkg` (`sudo git clone https://github.com/munki/munki-pkg.git /usr/local/`).
2. You'll also need [MacAdmins Python](https://github.com/macadmins/python) installed.
3. You must be running [MunkiReport](https://github.com/munkireport/munkireport-php) 5.8 or later, since that's the first release to use Python 3.

## Instructions

1. Clone or download this repo to your Mac.
2. Open the Terminal, then drag and drop `build.sh` onto the window.
3. Press **return**.
4. If all goes well, you should have `munkireport_scheduled-1.0.pkg` in your `build` directory.
5. Deploy the newly created pkg with your chosen package deployment system.

## Credit

Huge thanks to [Mat X](https://macvfx.blog) for providing his own LaunchDaemon - that's what's included here.