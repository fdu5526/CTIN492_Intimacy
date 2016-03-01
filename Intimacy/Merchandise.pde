class Merchandise {
	int x, y;
	PImage image;

	float vx;
	boolean active;
	boolean bought;
	int moneyValue;

	Merchandise (int x, int y, int moneyValue) {
		this.x = x;
		this.y = y;
		this.moneyValue = moneyValue;

		this.vx = random(0.5, 4);
		this.active = true;
		this.bought = false;

		int i = (int)random(1,1);
		image = loadImage("merchandise" + i + ".jpg");
	}

	// clicked on
	boolean checkClickedOn () {
		if (!bought) {
			if (x <= mouseX && mouseX <= x + image.width &&
				y <= mouseY && mouseY <= y + image.height &&
				playerMoney >= moneyValue) {
				bought = true;
				playerMoney -= moneyValue;
				return true;
			}
		}
		return false;
	}

	void draw () {
		if (active) {
			if (x > width + 200) {
				active = false;
				removeMerchandise(this);
			}
			if (bought) {
				fill(0,255,0);
				rect(x - 5, y - 5, image.width + 10, image.height + 10);
			}

			image(image, x, y);

			if (!bought) {
				x += vx;
				textSize(80);
			  fill(255, 0, 0);
			  text("$" + moneyValue, x, y + 3f * image.height / 4f);
			}
		}
	}
}