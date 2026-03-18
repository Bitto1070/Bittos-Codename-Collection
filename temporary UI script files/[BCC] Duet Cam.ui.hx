function generateIcon() {
	var params = event.params;
	if (inMenu || params == null) return;
	var group = new EventIconGroup();

	//tween length stuff
	var timeroPre = Std.string(params[4]).split(":");
	var len = timeroPre.length;

	if (len < 1 || len > 3) return;

	var m = Std.parseFloat(timeroPre[0]);
	var b = (len > 1) ? Std.parseFloat(timeroPre[1]) : 0;
	var s = (len > 2) ? Std.parseFloat(timeroPre[2]) : 0;

	var stepDuration = switch len {
		case 1: m;
		case 2: 4*m + b;
		case 3: 16*m + 4*b + s;
	}

	if (stepDuration > 0 && params[5] != 'CLASSIC' && !params[3] && !inMenu) generateEventIconDurationArrow(group, stepDuration);

	//strum adder
	var strums = params[0];
	if (strums.indexOf(",") != -1) strums = strums.split(",");
	else strums = [strums];

	var spacing = 8;
	for (s => i in strums) {
		var icon = getIconFromStrumline(strums[s]);
		if (icon == null) group.add(generateDefaultIcon(event.name));
		icon.setPosition(-8,-8 + s*spacing);
		group.add(icon);
	}

	return group;
}