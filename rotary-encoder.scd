(
var encoderSteps = 10;
var encoderValue = encoderSteps / 2;
var encoderValueChangedHandler = { |index, value|
    encoderValue = value - encoderValue;
    if (encoderValue == encoderSteps, { encoderValue = 1.neg });
    if (encoderValue == (encoderSteps.neg), { encoderValue = 1 });
    encoderValue.postln;
    encoderValue = value;
};
w = Window.new.front;
w.bounds_(Rect(0, 0, 500, 500));

1.do{ |i|
    e = EZKnob(
        parent: w,
        label: "Label",
        controlSpec: ControlSpec(
            minval: 0,
            maxval: encoderSteps,
            step: 1,
            default: encoderSteps / 2),
        action: { |knob|
            encoderValueChangedHandler.value(i, knob.value);
        }
    );
};
)

Window.closeAll;