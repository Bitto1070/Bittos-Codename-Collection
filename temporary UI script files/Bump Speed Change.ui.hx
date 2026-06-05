function generateIcon() {
	var params = event.params;
	if (params == null || inMenu) return;

	var group = new EventIconGroup();
	var icon = generateDefaultIcon(event.name);
	group.add(icon);

	if (params[0]) {
		var itsAbs = new FunkinText(-3,0,icon.width*2,"ABS");
		itsAbs.size = 10;
		itsAbs.y = icon.y - itsAbs.height + 1;
		group.add(itsAbs);
	}

	generateEventIconNumbers(group,params[1],5,16);
	generateEventIconNumbers(group,params[2],5,24);
	generateEventIconNumbers(group,params[3],5,32);
	return group;
}