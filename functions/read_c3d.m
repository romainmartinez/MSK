function [btk, freq] = read_c3d(filename)
btkc3d = btkReadAcquisition(filename);
btk.analog = btkGetAnalogs(btkc3d);
btk.point = btkGetPoints(btkc3d);
freq.emg = btkGetAnalogFrequency(btkc3d);
freq.camera = btkGetPointFrequency(btkc3d);

btkCloseAcquisition(btkc3d);