class Button {
	int x, y, diameter;
	PImage buttonImage;

	Button (int x, int y, int diameter) {
		this.x = x;
		this.y = y;
		this.diameter = diameter;
		buttonImage = loadImage("button.png");
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
		image(buttonImage, x - diameter/2f, y - diameter/2f);
	}
}