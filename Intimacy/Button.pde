class Button {
	int x, y, diameter;

	Button (int x, int y, int diameter) {
		this.x = x;
		this.y = y;
		this.diameter = diameter;
	}


	void draw () {
		noStroke();
		fill(255, 0, 0);
		ellipse(x, y, diameter, diameter);
	}
}