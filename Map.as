package {
  public class Map {
    public var width:int;
    public var height:int;
    public var tiles:Array;  // indexed by [x][y] -> Object
    public var buildings:Array;  // indexed by building id
    
    // Tile types (.tile property)
    public static var EMPTY:String = 'empty';
    public static var ROAD:String = 'road';
    public static var LOT:String = 'lot';
    public static var BUILDING:String = 'building';
    
    public function Map(w:int, h:int) {
      width = w;
      height = h;
      for (var y:int = 0; y <= height+1; y++) {
        tiles[y] = new Array(width+2);
        for (var x:int = 0; x <= width+1; x++) {
          tiles[y][x] = {type: EMPTY};
        }
      }
    }

    
    // Return an empty string if the data is valid, or a reason it's not
    public function validate():String {
      // TODO: collect list of tiles with building set to b, and it
      // should be equal (modulo sorting) to buildings[b].lots
      return "";
    }


    // Convert a lot into a new building
    public function construct(player:Player, x:int, y:int, buildingType:String):String {
      return "not implemented";
    }


    // Merge a building an an adjacent lot into a larger building
    public function merge(player:Player, x1:int, y1:int, dir:String):String {
      return "not implemented";
    }


    // Demolish a building, turning all of it into empty lots
    public function demolish(player:Player, x:int, y:int):String {
      return "not implemented";
    }


    // Buy an empty lot
    public function buy(player:Player, x:int, y:int):String {
      return "not implemented";
    }


    // Sell an empty lot
    public function sell(player:Player, x:int, y:int):String {
      return "not implemented";
    }

  }
}

      