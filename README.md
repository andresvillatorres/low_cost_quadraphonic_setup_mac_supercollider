# low_cost_quadraphonic_setup_mac_supercollider
# tutorial 

This is made for using a quadraphonic setup on the fly - on the road. It is helpful for taking advantage of internal macbook speakers, a bluetooth stereo speaker and Aggregate Devices feautre inside the Audio Midi Setup.

It is also useful to try out spacialization for sound installations, composition and interactive applications without the need to build an expensive and tedious 4-Ch or 5.1 Audio System.

# Requirements:
This setup has been tested with a MacBook Pro 13-inch with Mojave 10.14.6.

An "aggregate device" has been tested using the internal speakers and a B&O Beoplay bluetooth speaker (boom box). Presumably it should work with any bluetooth speaker or bluetooth headphones.

An additional aggregate device has been tested using the internal speakers and the headphones jack, you can use this setup instead if you don't have a wireless speaker and rather you have a wired stereo pair of monitors or even only headphones.

# Notes:
*** Consider doing the necessary dB adjustments between all your speakers in order to have closer to real experience of the 360 spacializaiton of the sounds.

Also remember, sound is like color, it unfolds its potential features in interaction with other sounds, i.e. in interaction with context. Therefore the examples include two different sounds in asynchronous motion.

# Steps

1. Download and Install the 3.10.3 version of supercollider or newer
https://supercollider.github.io/download

2. Clone or download this repository

3. Prepare your adio gear. I. e. pair your bluetooth audio box or plug in your headphones to your laptop

4. Open your Audio MIDI Setup by searching for it through spotlight or find it inside "Applications/Utilities/Audio MIDI Setup"

5. Once open, click on the "+" symbol on the left lower corner and choose create "Aggregate Device"

6. An aggregate device should appear and on the right side you should be able to select from a list of devices , be aware of the differences between In(s) and Out(s) and make sure to select two devices for output and one for input, in this case the macbook speakers, the BeoPlay A1 as outputs and the internal microphone as input.

7. Once done, click on "configure speakers" and in the configuration dropdown select "quadraphonic". Rearrange the speakers if necessary. LF - 1, RF - 2 , LS - 3 , RS - 4.

*** By clicking on the speaker icons you will hear a very loud white noise coming from each of the mono speakers in your 4 output setup. if this is not the case something went wrong. Click Apply and Done.

8. Also make sure that the sample rates from the inputs and outputs match (48,000kHz) and that the levels from the independent output devices are not maxed out.

9. Now you can proceed to open the file "audio_4_setup.scd" with supercollider and compile it. It should all run and you should be able to listen to two sounds one continuous drone and one discrete

10. You can as well open and run the file "xyPan4circleSCviaOSC.pde" with processing too

