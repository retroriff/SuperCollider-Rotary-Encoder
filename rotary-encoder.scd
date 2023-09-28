(
var encoderSteps = 10;
var encoderValue = encoderSteps / 2;
w = Window.new.front;
w.bounds_(Rect(0, 0, 500, 500));

s = { |index, value|
    encoderValue = value - encoderValue;
    if (encoderValue == encoderSteps, { encoderValue = 1.neg });
    if (encoderValue == (encoderSteps.neg), { encoderValue = 1 });
    encoderValue.postln;
    encoderValue = value;
};

1.do{ |i|
    var knobs;
    var rotaryValue = 0;
    e = EZKnob(
        parent: w,
        label: "Label",
        controlSpec: ControlSpec(0, encoderSteps, step: 1, default: encoderSteps / 2),
        action: { |ez| s.value(i, ez.value, t); }
    );
};
)

Window.closeAll;