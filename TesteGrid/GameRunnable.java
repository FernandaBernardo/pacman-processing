public abstract class GameRunnable extends Thread {
	private final int DEFAULT_UPDATE_INTERVAL = 500;
	private int sleepTime;
	private boolean threadPaused;
	private boolean threadAlive;

	protected GameRunnable () {
		threadAlive = true;
		threadPaused = false;
		sleepTime = DEFAULT_UPDATE_INTERVAL;
		start();
	}
	protected GameRunnable (int pSleepTime) {
		threadAlive = true;
		threadPaused = false;
		sleepTime = pSleepTime;
		start();
	}

	@Override
	public void run () {
		while (threadAlive) {
			try {
				sleep(sleepTime);
			}
			catch (Exception pException) {
			}
			if (!threadPaused) {
				update();
			}
		}
	}

	protected void pause () {
		threadPaused = true;
	}

	protected void unpause () {
		threadPaused = false;
	}

	protected void kill () {
		threadAlive = false;
	}

	protected abstract void update ();
}