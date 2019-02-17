(

w=Window.new.front;
w.bounds_(Rect(0,0,500,500));

~encoderSteps = 10;
~encoderValue=~encoderSteps/2;

s={|index, value|
	~encoderValue=value-~encoderValue;
	if (~encoderValue == ~encoderSteps, { ~encoderValue=1.neg });
	if (~encoderValue == (~encoderSteps.neg), { ~encoderValue=1 });
	~encoderValue.postln;
	~encoderValue=value;
};

1.do{
	|i|
	var knobs;
	var rotaryValue = 0;
	e = EZKnob(
		w,
		~knobbounds,
		"Steps:"+~encoderSteps,
		ControlSpec(0, ~encoderSteps, step:1, default:~encoderSteps/2),
		{ |ez| s.value(i, ez.value, t); },
	);
};

)

Window.closeAll;