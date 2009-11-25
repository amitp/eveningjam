package {
  import flash.display.*;
  import flash.events.*;
  
  public class eveningjam extends Sprite {
    public function eveningjam() {
      draw();
    }

    public function draw():void {
      var size:int = 33;
      var spacing:int = size+1;
      
      var W:int = 10;
      var H:int = 7;
      var x:int;
      var y:int;
      
      // Draw the tiles
      for (x = 0; x <= W+1; x++) {
        for (y = 0; y <= H+1; y++) {
          graphics.beginFill((x == 0 || x == W+1 || y == 0 || y == H+1) ? 0x666666 : 0x2e3561);
          graphics.drawRect(x * spacing + 1, y * spacing + 1, size, size);
          graphics.endFill();
        }
      }

      // Draw the edges
      for (x = 1; x <= W+1; x++) {
        for (y = 1; y <= H+1; y++) {
          graphics.lineStyle(1, 0x0000ff);
          if (x <= W) {
            graphics.moveTo(x * spacing + 1, y * spacing);
            graphics.lineTo(x * spacing + 1 + size, y * spacing);
          }
          if (y <= H) {
            graphics.moveTo(x * spacing, y * spacing + 1);
            graphics.lineTo(x * spacing, y * spacing + 1 + size);
          }
          graphics.lineStyle();
        }
      }

      // Draw the corners
      for (x = 1; x <= W+1; x++) {
        for (y = 1; y <= H+1; y++) {
          graphics.beginFill(0x000000);
          graphics.drawRect(x * spacing, y * spacing, 1, 1);
          graphics.endFill();
        }
      }
      
    }
  }
}
