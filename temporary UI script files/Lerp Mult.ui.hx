function generateIcon() {
	var params = event.params;
	if (params == null || inMenu) return;

	var group = new EventIconGroup();
	group.add(generateDefaultIcon(event.name));
	generateEventIconNumbers(group,params[0],5,16);
	return group;
}