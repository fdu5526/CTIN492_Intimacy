class Button {
	int x, y, diameter;

	Button (int x, int y, int diameter) {
		this.x = x;
		this.y = y;
		this.diameter = diameter;
	}

	boolean checkClickedOn () {
		float dx = mouseX - x;
		float dy = mouseY - y;
		float r = diameter / 2f;
		if (dx*dx + dy*dy <= r*r) {
			return true;
		}
		return false;
	}

	void draw () {
		noStroke();
		fill(255, 0, 0);
		ellipse(x, y, diameter, diameter);
	}
}