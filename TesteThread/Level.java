enum TileType {
	WALL,
	TELEPORT,
	ENERGY,
	POINT,
	SPAWN
};

abstract class Level {
	int gridRows;
	int gridCols;
	TileType[][] tileGrid;
}