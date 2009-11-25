// License: MIT

package {
  import flash.display.*;
  import flash.events.*;
  
  public class eveningjam extends Sprite {
    public var map:Map = new Map(10, 7);
    
    static public var size:int = 33;
    static public var spacing:int = size+1;
    
    public function eveningjam() {
      addChild(new Debug(this));
      
      stage.addEventListener(MouseEvent.CLICK, onMouseClick);
      draw();
    }

    // Temporary, for making sure we can map mouse positions to tiles
    private var _currentX:int = 1;
    private var _currentY:int = 2;
    public function onMouseClick(event:MouseEvent):void {
      // Map mouse position to tile position
      var x:int = (event.localX - 1) / spacing;
      var y:int = (event.localY - 1) / spacing;
      _currentX = x;
      _currentY = y;
      draw();
    }
    
    public function draw():void {
      var x:int;
      var y:int;

      graphics.clear();
      
      // Draw the tiles
      for (x = 0; x <= map.width+1; x++) {
        for (y = 0; y <= map.height+1; y++) {
          var type:String = map.tiles[x][y].type;
          graphics.beginFill((x == _currentX && y == _currentY) ? 0xffff00 : type == Map.GUTTER? 0x333333 : type == Map.ROAD? 0x999999 : 0x2e3561);
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
