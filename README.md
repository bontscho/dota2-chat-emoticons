Dota 2 Chat Emoticons
====================

The recently added Dota 2 Chat Emoticons from the compendium stretch goal as GIF for the use on your website/forum/etc.

## Demo

### 32x32px

![:blush:](assets/images/blush.gif)
![:cheeky:](assets/images/cheeky.gif)
![:cool:](assets/images/cool.gif)
![:crazy:](assets/images/crazy.gif)
![:cry:](assets/images/cry.gif)
![:disapprove:](assets/images/disapprove.gif)
![:doubledamage:](assets/images/doubledamage.gif)
![:facepalm:](assets/images/facepalm.gif)
![:happytears:](assets/images/happytears.gif)
![:haste:](assets/images/haste.gif)
![:hex:](assets/images/hex.gif)
![:highfive:](assets/images/highfive.gif)
![:huh:](assets/images/huh.gif)
![:hush:](assets/images/hush.gif)
![:illusion:](assets/images/illusion.gif)
![:invisibility:](assets/images/invisibility.gif)
![:laugh:](assets/images/laugh.gif)
![:rage:](assets/images/rage.gif)
![:regeneration:](assets/images/regeneration.gif)
![:sad:](assets/images/sad.gif)
![:sick:](assets/images/sick.gif)
![:sleeping:](assets/images/sleeping.gif)
![:smile:](assets/images/smile.gif)
![:surprise:](assets/images/surprise.gif)
![:wink:](assets/images/wink.gif)

### 16x16px

![:blush:](assets/images/blush-16.gif)
![:cheeky:](assets/images/cheeky-16.gif)
![:cool:](assets/images/cool-16.gif)
![:crazy:](assets/images/crazy-16.gif)
![:cry:](assets/images/cry-16.gif)
![:disapprove:](assets/images/disapprove-16.gif)
![:doubledamage:](assets/images/doubledamage-16.gif)
![:facepalm:](assets/images/facepalm-16.gif)
![:happytears:](assets/images/happytears-16.gif)
![:haste:](assets/images/haste-16.gif)
![:hex:](assets/images/hex-16.gif)
![:highfive:](assets/images/highfive-16.gif)
![:huh:](assets/images/huh-16.gif)
![:hush:](assets/images/hush-16.gif)
![:illusion:](assets/images/illusion-16.gif)
![:invisibility:](assets/images/invisibility-16.gif)
![:laugh:](assets/images/laugh-16.gif)
![:rage:](assets/images/rage-16.gif)
![:regeneration:](assets/images/regeneration-16.gif)
![:sad:](assets/images/sad-16.gif)
![:sick:](assets/images/sick-16.gif)
![:sleeping:](assets/images/sleeping-16.gif)
![:smile:](assets/images/smile-16.gif)
![:surprise:](assets/images/surprise-16.gif)
![:wink:](assets/images/wink-16.gif)

## Installation

Just copy the `assets` folder into your project and refer to the corresponding gifs in your HTML.

## Update Workflow

You will need graphicscmagick/imagemagick (`apt-get install graphicsmagick` on Debian/Ubuntu) and Ruby (get it e.g. via [rvm.io](http://rvm.io)) to run the generator.

1. Extract `scripts/emoticons.txt` from Dota 2 pak files and export to `src/scripts/emoticons.txt`
3. Extract `resource/flash3/images/emoticons` from Dota 2 pak files to `src/emoticons`
4. Run `bundle` to get the required packages for the generator
5. Run `ruby generator.rb`

### Tools

Tools I used: [Gibbeds VPK Extractor](https://developer.valvesoftware.com/wiki/Gibbeds_VPK_Extractor)

Full List of Third Party Tools: https://developer.valvesoftware.com/wiki/Category:Third_Party_Tools