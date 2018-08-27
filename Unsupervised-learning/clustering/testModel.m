% one man
usr1 = [14.6, 14.3, 14.2, 14.6, 16.5, 25.93, 27.64, 29.99, 19.65, 13.03, 13.32, 14.12, 15.63, 15.51, 15.92, 16.6, 17.554, 25.65, 54.4, 60.6,56.6, 43.46, 25.83, 19.89];
% two young men
usr2 = [17.8, 17.73, 16.72, 17.97, 19.566, 29.32, 32.66, 34.66, 23.77, 14.54, 14.97, 16.55, 17.63, 17.44, 18.32, 18.563, 19.74, 28.743, 59.7, 64.73, 58.54, 49.74, 30.64, 20.32];
% three generation family
usr3 = [22.4, 21.4, 22.43, 22.97, 26.73, 36.72, 38.32, 38.77, 39.02, 34.02, 31.98, 35.32, 36.33, 37.54, 36.23, 34.33, 36.32, 46.43, 66.66, 72.77, 76.65, 77.32, 57.032, 31.34];
% three people
usr4 = [19.4, 19.4, 20.33, 20.32, 24.64, 33.72, 35.32, 36.77, 29.02, 19.02, 18.98, 30.32, 29.33, 19.54, 22.23, 23.33, 27.32, 35.43, 60.66, 67.77, 69.65, 69.32, 50.032, 26.34];
% retired two peoole
usr5 = [14.6, 14.3, 14.2, 14.6, 16.5, 18.93, 20.64, 21.99, 19.65, 17.03, 16.32, 20.12, 16.63, 15.51, 14.92, 14.6, 25.554, 30.65, 46.4, 48.6, 49.6, 35.46, 30.83, 15.89];

[usrData1, usrLabel1] = data_generator(1000, usr1, 1, 5);
[usrData2, usrLabel2] = data_generator(1000, usr2, 2, 5);
[usrData3, usrLabel3] = data_generator(1000, usr3, 3, 5);
[usrData4, usrLabel4] = data_generator(1000, usr4, 4, 5);
[usrData5, usrLabel5] = data_generator(1000, usr5, 5, 5);

% mix the data
mix =[usrData1; usrData2; usrData3; usrData4; usrData5];
rowrank = randperm(length(mix));
mix = mix(rowrank,:);

% get the reference label
usrLabel = [usrLabel1; usrLabel2; usrLabel3; usrLabel4; usrLabel5];

% train the model
[clusters, label] = modelTrain(mix, 5);

figure
plot((clusters{1})')
figure
plot((clusters{2})')
figure
plot((clusters{3})')
figure
plot((clusters{4})')
figure
plot((clusters{5})')

% evaluate the model
score1 = exIndex(usrLabel, label, 1)
score2 = exIndex(usrLabel, label, 2)
score3 = exIndex(usrLabel, label, 3)

score4 = intIndex(clusters, 1)
score5 = intIndex(clusters, 2)