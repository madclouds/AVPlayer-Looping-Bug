# AVPlayer-Looping-Bug
I've been trying to lock down a bug in AVPlayer when playing audio through a bluetooth speaker.  I've created this simple project to demonstrate the issue.

Below is the log output when testing with a bluetooth device:


```

//[From Erik]: Looping has started correctly and the seek time is > 10.0
2018-06-26 13:31:26.321393-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.004689, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:26.521509-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.204804, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:26.721350-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.404648, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:26.921366-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.604662, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:27.121607-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.804904, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:27.321368-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.004590, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:27.521360-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.204585, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:27.721992-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.405194, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:27.921574-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.604799, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:28.121450-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.804676, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:28.321249-0700 AVPlayer Loop[12955:11069115] Current Progress: 12.004502, Loop Start: 10.000000, Loop End: 12.000000

//[From Erik]: Current time is > 12, so seekToTime back to 10.0:
2018-06-26 13:31:28.521203-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.049851, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:28.721251-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.249900, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:28.921553-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.450188, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:29.122137-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.650774, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:29.322080-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.850732, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:29.521239-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.049824, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:29.721456-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.250025, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:29.921266-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.449836, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:30.121239-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.649826, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:30.321717-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.850288, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:30.521370-0700 AVPlayer Loop[12955:11069115] Current Progress: 12.049982, Loop Start: 10.000000, Loop End: 12.000000

//[From Erik]: Current time is > 12, so seekToTime back to 10.0:
2018-06-26 13:31:30.722138-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.032112, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:30.921311-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.231285, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:31.121175-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.431174, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:31.321173-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.631173, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:31.521235-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.831232, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:31.721230-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.031188, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:31.922058-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.232013, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:32.121275-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.431218, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:32.322129-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.632075, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:32.521207-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.831166, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:32.722254-0700 AVPlayer Loop[12955:11069115] Current Progress: 12.032190, Loop Start: 10.000000, Loop End: 12.000000

//[From Erik]: Current time is > 12, so seekToTime back to 10.0:
2018-06-26 13:31:32.921587-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.034231, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:33.121220-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.233883, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:33.321310-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.433963, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:33.521431-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.634080, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:33.721384-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.834034, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:33.921352-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.033966, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:34.122130-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.234728, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:34.321584-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.434172, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:34.522216-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.634816, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:34.721256-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.833858, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:34.921361-0700 AVPlayer Loop[12955:11069115] Current Progress: 12.033938, Loop Start: 10.000000, Loop End: 12.000000

//[From Erik]: Current time is > 12, so seekToTime back to 10.0:
2018-06-26 13:31:35.121125-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.015147, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:35.321050-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.215084, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:35.521132-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.415164, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:35.721084-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.615114, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:35.921165-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.815196, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:36.121296-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.015292, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:36.321164-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.215158, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:36.521321-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.415301, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:36.721149-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.615157, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:36.921186-0700 AVPlayer Loop[12955:11069115] Current Progress: 11.815188, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:37.121387-0700 AVPlayer Loop[12955:11069115] Current Progress: 12.015362, Loop Start: 10.000000, Loop End: 12.000000

//[From Erik]: Current time is > 12, so seekToTime back to 10.0:
//[From Erik]: This is where the bluetooth connection succeeds and starts playing audio, notice the current progress is less than 10 even though we told the AVPlayer to seekToTime: 10.0
2018-06-26 13:31:37.321117-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.996465, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:37.521185-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.047198, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:37.721133-0700 AVPlayer Loop[12955:11069115] Current Progress: 10.227329, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:37.921100-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.895198, Loop Start: 10.000000, Loop End: 12.000000
//[From Erik]: Current time is < loop start, so seekToTime back to 10.0:
2018-06-26 13:31:38.121977-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.544086, Loop Start: 10.000000, Loop End: 12.000000
//[From Erik]: Current time is < loop start, so seekToTime back to 10.0:
2018-06-26 13:31:38.321084-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.557441, Loop Start: 10.000000, Loop End: 12.000000
//[From Erik]: Current time is < loop start, so seekToTime back to 10.0:
2018-06-26 13:31:38.521195-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.548574, Loop Start: 10.000000, Loop End: 12.000000
//[From Erik]: Current time is < loop start, so seekToTime back to 10.0:
2018-06-26 13:31:38.721413-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.562998, Loop Start: 10.000000, Loop End: 12.000000
//[From Erik]: Current time is < loop start, so seekToTime back to 10.0:
2018-06-26 13:31:38.921237-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.507425, Loop Start: 10.000000, Loop End: 12.000000
//[From Erik]: Current time is < loop start, so seekToTime back to 10.0:
2018-06-26 13:31:39.121168-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.544820, Loop Start: 10.000000, Loop End: 12.000000
//[From Erik]: Current time is < loop start, so seekToTime back to 10.0:
2018-06-26 13:31:39.321309-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.535962, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:39.521277-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.503738, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:39.721151-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.517862, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:39.921136-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.532083, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:40.121351-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.500102, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:40.322166-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.515150, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:40.521271-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.505268, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:40.721210-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.519446, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:40.921164-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.510448, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:41.122011-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.525548, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:41.321166-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.538925, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:41.521283-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.506845, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:41.721302-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.521092, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:41.921179-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.511999, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:42.121293-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.526351, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:42.321203-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.540517, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:42.521269-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.508367, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:42.721192-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.522540, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:42.922177-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.514529, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:43.122062-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.505450, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:43.321107-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.518754, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:43.522069-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.510710, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:43.721256-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.500919, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:43.921388-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.515286, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:44.121262-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.506201, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:44.321265-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.520439, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:44.521450-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.511664, Loop Start: 10.000000, Loop End: 12.000000
2018-06-26 13:31:44.721175-0700 AVPlayer Loop[12955:11069115] Current Progress: 9.525631, Loop Start: 10.000000, Loop End: 12.000000
```
