class Merchandise {
	int x, y;
	PImage image;

	float vx;
	boolean active;
	int moneyValue;

	Merchandise (int x, int y, int moneyValue) {
		this.x = x;
		this.y = y;
		this.moneyValue = moneyValue;

		this.vx = random(0.5, 4);
		this.active = true;

		int i = (int)random(1,1);
		image = loadImage("merchandise" + i + ".jpg");
	}

	// clicked on
	boolean checkClickedOn () {
		if (x <= mouseX && mouseX <= x + image.width &&
				y <= mouseY && mouseY <= y + image.height &&
				playerMoney >= moneyValue) {
			active = false;
			playerMoney -= moneyValue;
			removeMerchandise(this);
			return true;
		}
		return false;
	}

	void draw () {
		if (active) {
			if (x > width + 200) {
				active = false;
				removeMerchandise(this);
			}

			x += vx;
			image(image, x, y);
		}
	}
}