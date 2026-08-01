function generateIcon() {
	var params = event.params;
	if (params == null || inMenu) return;

	var timeroPre = Std.string(params[1]).split(":");
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

	var group = new EventIconGroup();
	if (stepDuration > 0 && params[2] != 'lerp' && params[2] != 'none (instant)' && params[2] != 'none (happens instantly)') generateEventIconDurationArrow(group, stepDuration);
	group.add(generateDefaultIcon(event.name));

	var zoomAsked = Std.parseFloat(params[0]);
	var zoomTarget = Math.isNaN(zoomAsked) ? (Xml.parse(Assets.getText(Paths.xml('stages/'+PlayState.SONG.stage))).firstElement().get("zoom") ?? 1) : zoomAsked;
	generateEventIconNumbers(group,zoomTarget,5,16);
	return group;
}