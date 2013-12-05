function videotochar(filename);

vobj= VideoReader(filename);

nFrames = vobj.NumberOfFrames;
vidHeight = vobj.Height;
vidWidth = vobj.Width;

mov(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),'colormap', []);

for k = 1 : nFrames
    mov(k).cdata = read(vobj, k);
end

disp('start generating');

counter = -1;

for k=1 : nFrames
    %imtochar(mov(k).cdata,'¡¡','ÃÊ',240);
    imtochar2(mov(k).cdata,240);

    if rem(floor(100*k/nFrames),10)==0 && floor(100*k/nFrames) > counter
        disp(floor(100*k/nFrames));
        counter=floor(100*k/nFrames);
    end
end
 