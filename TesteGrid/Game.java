import java.util.Random;

enum GameState {
	GameStateMenu,
	GameStatePlaying,
	GameStatePaused
}

class Game extends GameRunnable {

	GameState currentGameState;

	public Game () {
		setup(); // @DEBUG
	}

	// @DEBUG
	void printMatrix (char[][] pMatrix) {
		System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		for (int i = 0; i < pMatrix.length; i++) {
			char[] mMatrixLine = pMatrix[i];
			for (int j = 0; j < mMatrixLine.length; j++) {
				System.out.printf("%c", mMatrixLine[j]);
			}
			System.out.println();
		}
		System.out.println();
	}
	// @DEBUG END

	int x = -1;
	int y = -1;
	Random mRand = new Random();
	char PLYR = 'C';
	char WALL = '+';
	char DOTS = '.';
	char ENGY = 'o';
	char SPCE = ' ';

	char[][] gameMatrix = {
		{ WALL, WALL, WALL, SPCE, WALL, WALL, WALL, WALL, WALL, WALL, WALL },
		{ WALL, DOTS, DOTS, DOTS, DOTS, DOTS, DOTS, DOTS, DOTS, DOTS, WALL },
		{ WALL, SPCE, WALL, SPCE, SPCE, WALL, SPCE, SPCE, WALL, DOTS, WALL },
		{ WALL, SPCE, WALL, SPCE, WALL, WALL, WALL, WALL, SPCE, DOTS, WALL },
		{ WALL, SPCE, SPCE, SPCE, SPCE, SPCE, SPCE, SPCE, SPCE, DOTS, WALL },
		{ WALL, SPCE, SPCE, SPCE, SPCE, PLYR, SPCE, SPCE, SPCE, DOTS, WALL },
		{ WALL, SPCE, SPCE, SPCE, WALL, WALL, WALL, SPCE, SPCE, DOTS, WALL },
		{ WALL, SPCE, WALL, SPCE, SPCE, WALL, SPCE, SPCE, SPCE, DOTS, WALL },
		{ SPCE, DOTS, WALL, SPCE, SPCE, WALL, SPCE, WALL, SPCE, DOTS, SPCE },
		{ WALL, DOTS, DOTS, DOTS, DOTS, DOTS, DOTS, DOTS, DOTS, DOTS, WALL },
		{ WALL, WALL, WALL, SPCE, WALL, WALL, WALL, WALL, WALL, WALL, WALL }
	};

	String[] path = {"u","l","l","u","u","u","u","u","u","r","r","r","r","r","r"};

	void setup () {
		for (int i = 0; i < gameMatrix.length; i++) {
			for (int j = 0; j < gameMatrix[i].length; j++) {
				if (gameMatrix[i][j] == PLYR) {
					x = j;
					y = i;
					break;
				}
			}
			if (x != -1)
				break;
		}
	}

	void move (String pDir) {
		System.out.println("Move " + pDir);
		if (pDir == "u") {
			if (y > 0 && gameMatrix[y-1][x] != WALL) {
				gameMatrix[y][x] = SPCE;
				y--;
			}
			else if (y == 0 && gameMatrix[gameMatrix.length-1][x] == SPCE) {
				gameMatrix[y][x] = SPCE;
				y = gameMatrix.length-1;
			}
		}
		if (pDir == "d") {
			if (y+1 < gameMatrix.length-1 && gameMatrix[y+1][x] != WALL) {
				gameMatrix[y][x] = SPCE;
				y++;
			}
			else if (y == gameMatrix.length-1 && gameMatrix[0][x] == SPCE) {
				gameMatrix[y][x] = SPCE;
				y = 0;
			}
		}
		if (pDir == "l") {
			if (x > 0 && gameMatrix[y][x-1] != WALL) {
				gameMatrix[y][x] = SPCE;
				x--;
			}
			else if (x == 0 && gameMatrix[y][gameMatrix[y].length-1] == SPCE) {
				gameMatrix[y][x] = SPCE;
				x = gameMatrix[y].length-1;
			}
		}
		if (pDir == "r") {
			if (x+1 < gameMatrix[y].length-1 && gameMatrix[y][x+1] != WALL) {
				gameMatrix[y][x] = SPCE;
				x++;
			}
			else if (x == gameMatrix[y].length-1 && gameMatrix[y][0] == SPCE) {
				gameMatrix[y][x] = SPCE;
				x = 0;
			}
		}
		gameMatrix[y][x] = PLYR;
	}
	int k = 0;

	protected void update () {
		if (k < path.length) move(path[k++]);
		else {
			int mMove = mRand.nextInt(4);
			switch (mMove) {
				case 0:
					move("u");
					break;
				case 1:
					move("d");
					break;
				case 2:
					move("l");
					break;
				case 3:
					move("r");
					break;
				default:
					break;
			}
		}
		printMatrix(gameMatrix);
	}
}