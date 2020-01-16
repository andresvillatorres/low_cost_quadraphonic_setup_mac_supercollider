// double click with cursor on parenthesis and once all selected compile with cmnd + return

(
ServerOptions.devices;
o = Server.default.options;
Server.default.reboot;
o.numOutputBusChannels = 4;
o.device = "Aggregate Device";
Server.default.reboot;


(
s.doWhenBooted{

	1.do{
		1.wait; // wait for one second for everything to be booted and running

		Server.default.scope(4); // open the osciloscope with four channels
		n = NetAddr.new("127.0.0.1", 7777);    // create the NetAddr

		/*7777 -> listening port in your other app listening to OSC*/

		//defining the sound synth - part of the program that generates the sound
		(
			SynthDef(\pan4Testsound,{
				arg x=0,y=0,vol=1.0;
				var signal;
				signal=Pan4.ar(PinkNoise.ar(0.05)+SinOsc.ar(270 +(6.33*SinOsc.kr(5.5)),0.0,0.25), x,  y,0.10) ;

				Out.ar(0,signal*vol);
			}).send(s);
		);
		1.wait; // wait a second cause at times the synthdef needs a bit before it can be actually called
		~sP4 = Synth(\pan4Testsound); // opens the sound synth once



		//defining the sound synth - part of the program that generates the sound
		(
			SynthDef(\pan4TestsoundDiscrete,{
				arg x=0,y=0,vol=10.1;
				var signal,env;
				signal=Pan4.ar(SinOsc.ar(680 +(6.33*SinOsc.kr(5.5)),0.0,0.025), x,  y,0.10) ;
				env=EnvGen.ar(Env.perc(0.001,0.75),doneAction:2);
				signal=signal*env;

				Out.ar(0,signal*vol);

			}).send(s);
		);

		1.wait; // wait a second cause at times the synthdef needs a bit before it can be actually called

		/*a loop that cycles from pos x and y relative to an angle within a circunference, sets these values in the Pan4 function on the open synth and sends them forward via OSC to an OSC listener (in this case processing)*/

		(
			Tdef(\testMultiOutPan4Circle,{
				~angle=270;
				~x=0;
				~y=0;
				~toAdd=0.825;
				inf.do{
					~x=(~angle * pi/180).cos;
					~y=(~angle * pi/180).sin;
					~sP4.set(\x,~x,\y,~y);
					n.sendMsg("/circlePan4", ~x , ~y);
					if(~angle<360,{~angle=~angle+~toAdd},{~angle=0});
					0.005.wait;
				}
			}).play;
		);

		/*a loop that cycles from pos x and y relative to an angle within a circunference, sets these values in the Pan4 function in the discrete triggered synth and sends them also forward via OSC to an OSC listener (in this case processing)*/

		(
			Tdef(\testMultiOutPan4CircleDiscrete,{
				~angle2=90;
				~x2=0;
				~y2=0;
				~toAdd2=8.25;
				inf.do{
					~x2=(~angle2 * pi/180).cos;
					~y2=(~angle2 * pi/180).sin;
					// (~x2 + "," + ~y2).postln;
					// ~sP4.set(\x,~x,\y,~y);
					~sDiscreteP4=Synth(\pan4TestsoundDiscrete,[\x,~x2,\y,~y2]);
					n.sendMsg("/circlePan4_2", ~x2 , ~y2);
					if(~angle2< (360-10.25),{~angle2=~angle2+~toAdd2},{~angle2=0});
					0.25.wait;
				}
			}).play;
		);
	}
}
);
);

/* notes:

using Pan4 class for panning around 4 channels using x and y positions
inside your Out.ar(bus,source) use 0 as your bus
when using Pan4 SC automatically generates a 4 output array
for further understanding search on the web for this : https://doc.sccode.org/Guides/Multichannel-Expansion.html

for complexer spacialization modeling you can try working with volume for distance to the sound sources, HPF (filtering) for Y axis (height) and so on


*/