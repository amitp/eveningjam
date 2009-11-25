// License: MIT

package {
  import flash.display.*;
  import flash.events.*;
  
  public class eveningjam extends Sprite {
    public var map:Map = new Map(10, 7);
    
    public function eveningjam() {
      draw();
    }

    public function draw():void {
      var size:int = 33;
      var spacing:int = size+1;
      
      var x:int;
      var y:int;
      
      // Draw the tiles
      for (x = 0; x <= map.width+1; x++) {
        for (y = 0; y <= map.height+1; y++) {
          var type:String = map.tiles[x][y].type;
          graphics.beginFill(type == Map.GUTTER? 0x333333 : type == Map.ROAD? 0x999999 : 0x2e3561);
          graphics.drawRect(x * spacing + 1, y * spacing + 1, size, size);
          graphics.endFill();
        }
      }

      // Draw the edges
      for (x = 1; x <= map.width+1; x++) {
        for (y = 1; y <= map.height+1; y++) {
          graphics.lineStyle(1, 0x0000ff);
          if (x <= map.width) {
            graphics.moveTo(x * spacing + 1, y * spacing);
            graphics.lineTo(x * spacing + 1 + size, y * spacing);
          }
          if (y <= map.height) {
            graphics.moveTo(x * spacing, y * spacing + 1);
            graphics.lineTo(x * spacing, y * spacing + 1 + size);
          }
          graphics.lineStyle();
        }
      }

      // Draw the corners
      for (x = 1; x <= map.width+1; x++) {
        for (y = 1; y <= map.height+1; y++) {
          graphics.beginFill(0x000000);
          graphics.drawRect(x * spacing, y * spacing, 1, 1);
          graphics.endFill();
        }
      }
      
    }
  }
}
