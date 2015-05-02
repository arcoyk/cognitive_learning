import processing.video.*;
Movie mov;

void setup() {
  mov = new Movie(this, "blackbird1.mov");
  size(640, 426);
  mov.play();
  mov.jump(0);
}

void draw() {
  if (mov.available()) {
    mov.read();
  }
  image(mov, 0, 0);
}

