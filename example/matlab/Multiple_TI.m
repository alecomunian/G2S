%This code requires the G2S server to be running

%ti1 contains horizontal lines and ti2 vertical lines
ti=repmat((sin(1:150)>0)',1,150);
ti1=ti;
ti2=rot90(ti,1);

%QS call using only the horizontal lines as TI
simulation1=g2s('-a','qs', ...
            '-di',nan(150,150,1), ...
            '-ti',{ti1}, ...
            '-dt',[1], ...
            '-k',1.2, ...
            '-n',25, ...
            '-j',0.5);

% QS call using both horizontal and vertical lines as TI's
simulation2=g2s('-a','qs', ...
            '-di',nan(150,150,1), ...
            '-ti',{ti1 ti2}, ...
            '-dt',[1], ...
            '-k',1.2, ...
            '-n',25, ...
            '-j',0.5);

%Display results 
figure(4);clf
sgtitle('multi-TI');
subplot(2,2,1);
imshow(ti1);
title('Training image 1');
subplot(2,2,2);
imshow(ti2);
title('Training image 2');
subplot(2,2,3);
imshow(simulation1);
title('Simulation with training image 1');
subplot(2,2,4);
imshow(simulation2);
title('Simulation with training images 1 and 2');
