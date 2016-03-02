class Button {
	int x, y, diameter;
	PImage buttonImage;
	int cooldown = 150;
	int currentCooldown;

	Button (int x, int y, int diameter) {
		this.x = x;
		this.y = y;
		this.diameter = diameter;
		currentCooldown = 0;
		buttonImage = loadImage("button.png");
	}

	boolean checkClickedOn () {
	
		float dx = mouseX - x;
		float dy = mouseY - y;
		float r = diameter / 2f;
		if (dx*dx + dy*dy <= r*r) {
			if (currentCooldown == 0) {
				currentCooldown = cooldown;
				return true;
			} else {
				wrongSound.cue(0);
				wrongSound.play();
			}
		}
		return false;
	}

	void draw () {
		currentCooldown = max(currentCooldown - 1, 0);
		image(buttonImage, x - diameter/2f, y - diameter/2f);
	}
}