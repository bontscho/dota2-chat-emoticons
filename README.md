Dota 2 Chat Emoticons
====================

The recently added Dota 2 Chat Emoticons from the compendium stretch goal as GIF and CSS animation for the use on your website/forum/etc.

## Demo

### 32x32px

![:aaaah:](assets/images/aaaah.gif)
![:blush:](assets/images/blush.gif)
![:burn:](assets/images/burn.gif)
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
![:hide:](assets/images/hide.gif)
![:highfive:](assets/images/highfive.gif)
![:huh:](assets/images/huh.gif)
![:hush:](assets/images/hush.gif)
![:iceburn:](assets/images/iceburn.gif)
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
![:tears:](assets/images/tears.gif)
![:techies:](assets/images/techies.gif)
![:wink:](assets/images/wink.gif)

### 24x24px

![:aaaah:](assets/images/aaaah-24.gif)
![:blush:](assets/images/blush-24.gif)
![:burn:](assets/images/burn-24.gif)
![:cheeky:](assets/images/cheeky-24.gif)
![:cool:](assets/images/cool-24.gif)
![:crazy:](assets/images/crazy-24.gif)
![:cry:](assets/images/cry-24.gif)
![:disapprove:](assets/images/disapprove-24.gif)
![:doubledamage:](assets/images/doubledamage-24.gif)
![:facepalm:](assets/images/facepalm-24.gif)
![:happytears:](assets/images/happytears-24.gif)
![:haste:](assets/images/haste-24.gif)
![:hex:](assets/images/hex-24.gif)
![:hide:](assets/images/hide-24.gif)
![:highfive:](assets/images/highfive-24.gif)
![:huh:](assets/images/huh-24.gif)
![:hush:](assets/images/hush-24.gif)
![:iceburn:](assets/images/iceburn-24.gif)
![:illusion:](assets/images/illusion-24.gif)
![:invisibility:](assets/images/invisibility-24.gif)
![:laugh:](assets/images/laugh-24.gif)
![:rage:](assets/images/rage-24.gif)
![:regeneration:](assets/images/regeneration-24.gif)
![:sad:](assets/images/sad-24.gif)
![:sick:](assets/images/sick-24.gif)
![:sleeping:](assets/images/sleeping-24.gif)
![:smile:](assets/images/smile-24.gif)
![:surprise:](assets/images/surprise-24.gif)
![:tears:](assets/images/tears-24.gif)
![:techies:](assets/images/techies-24.gif)
![:wink:](assets/images/wink-24.gif)

### 16x16px

![:aaaah:](assets/images/aaaah-16.gif)
![:blush:](assets/images/blush-16.gif)
![:burn:](assets/images/burn-16.gif)
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
![:hide:](assets/images/hide-16.gif)
![:highfive:](assets/images/highfive-16.gif)
![:huh:](assets/images/huh-16.gif)
![:hush:](assets/images/hush-16.gif)
![:iceburn:](assets/images/iceburn-16.gif)
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
![:tears:](assets/images/tears-16.gif)
![:techies:](assets/images/techies-16.gif)
![:wink:](assets/images/wink-16.gif)

## Installation & Usage

Just copy the `assets` folder into your project and refer to the corresponding gifs in your HTML.

To use the CSS animation version with the PNGs embed the `assets/stylesheets/dota2-chat-emoticons.css` into your HTML and use like this:

```html
<i class="d2ce wink"></i>
<i class="d2ce blush"></i>
<i class="d2ce cheeky"></i>
...
```

> **Recommendation**: For highest quality, use the CSS Animation since PNG supports alpha.

## Update Workflow

In case Valve adds more emoticons:

You will need graphicscmagick/imagemagick (`apt-get install graphicsmagick` on Debian/Ubuntu) and Ruby (get it e.g. via [rvm.io](http://rvm.io)) to run the generator.

1. Extract `scripts/emoticons.txt` from Dota 2 pak files and export to `src/scripts/emoticons.txt`
3. Extract `resource/flash3/images/emoticons` from Dota 2 pak files to `assets/images/emoticons`
4. Run `bundle` to get the required packages for the generator
5. Run `ruby generator.rb`

### Tools

Tools I used: [Gibbeds VPK Extractor](https://developer.valvesoftware.com/wiki/Gibbeds_VPK_Extractor)

Full List of Third Party Tools: https://developer.valvesoftware.com/wiki/Category:Third_Party_Tools

All game images and names are property of Valve Corporation.
