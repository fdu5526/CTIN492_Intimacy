class Button {
	int x, y, diameter;
	PImage buttonImage;
	int cooldown = 150;
	int currentCooldown;
	float scale;
	boolean pressed;

	Button (int x, int y, int diameter) {
		this.x = x;
		this.y = y;
		this.diameter = diameter;
		currentCooldown = 0;
		buttonImage = loadImage("button.png");
		scale = 1f;
		pressed = false;
	}


	void pressed () {
		float dx = mouseX - x;
		float dy = mouseY - y;
		float r = diameter / 2f;
		if (dx*dx + dy*dy <= r*r && currentCooldown == 0) {
			scale = 1.2f;
			pressed = true;
		}
	}

	boolean released () {
		float dx = mouseX - x;
		float dy = mouseY - y;
		float r = diameter / 2f;
		if (dx*dx + dy*dy <= r*r) {
			if (currentCooldown == 0 && pressed) {
				currentCooldown = cooldown;
				pressed = false;
				scale = 1f;
				blubSound.cue(0);
				blubSound.play();
				return true;
			} else {
				wrongSound.cue(0);
				wrongSound.play();
			}
		}

		pressed = false;
		scale = 1f;
		return false;
	}

	void draw () {
		currentCooldown = max(currentCooldown - 1, 0);

	  if (currentCooldown > 0) {
	    tint(128,128,128);
	  } else {
	    tint(255,255,255);
	  }

    pushMatrix();
    	translate(x - scale*diameter/2f, y - scale*diameter/2f);
    	scale(scale);
			image(buttonImage,0,0);
		popMatrix();
	}
}