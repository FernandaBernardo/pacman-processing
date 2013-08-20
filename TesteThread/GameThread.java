import java.lang.reflect.Method;
import java.util.List;

public class GameThread extends Thread {

	public static final int RUN_FOREVER = 0;
	public static final int RUN_ONCE = 1;

	private Object object;
	private String methodName;
	private int sleepTime;
	private int runTimes;
	private boolean threadPaused;
	private boolean threadAlive;

	public GameThread (Object pObject, String pMethodName, int pSleepTime, int pRunTimes) {
		object = pObject;
		methodName = pMethodName;
		sleepTime = pSleepTime;
		runTimes = pRunTimes;
		threadPaused = false;
		threadAlive = true;
	}
	public GameThread (Object pObject, String pMethodName) {
		this(pObject, pMethodName, 0, 1);
	}

	public void run() {
		try {
			Method mMethod;
			mMethod = object.getClass().getDeclaredMethod(methodName);
			do {
				if (!threadPaused) {
					mMethod.invoke(object);
					runTimes--;
					sleep(sleepTime);
				}
			}
			while (runTimes != 0 && threadAlive);
		}
		catch (Exception pException) {
			pException.printStackTrace();
		}
	}

	public void pause () {
		threadPaused = true;
	}

	public void unpause () {
		threadPaused = false;
	}

	public boolean isPaused () {
		return threadPaused;
	}

	public void kill () {
		threadAlive = false;
	}
}