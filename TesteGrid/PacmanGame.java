import java.util.List;
import java.util.LinkedList;

class PacmanGame {
	public static void main(String[] args) {
		new Game();
	}

	GameThread mainThread;
	Level currentLevel;
	LinkedList<Level> levelList;
	public PacmanGame () {
		levelList = new LinkedList();
		while (true) {
			try {
				String mClassName = String.format("Level%d", levelList.size()+1);
				Class mClass = Class.forName(mClassName);
				levelList.add((Level)mClass.newInstance());
			}
			catch (Exception pException) {
				pException.printStackTrace();
				break;
			}
		}
		currentLevel = levelList.getFirst();

		mainThread = new GameThread(this, "update", 100, GameThread.RUN_FOREVER);
		mainThread.start();
	}

	public void update () {
	}
}