function O = imtochar(I,white,black,hsize);


I_2=rgb2gray(I);

[h,w]=size(I_2);

w2=floor(hsize*(w/h));

I2=imresize(I,[hsize,w2]);

level = graythresh(I2);

I3=im2bw(I2,level);

%imshow(I3);

[hh,ww]=size(I3);

fid=fopen('imdata.txt','at');

O=[hh,ww];

for i = 1:hh
	for j = 1:ww
		if I3(i,j)==1
			fprintf(fid,'%s',white);
            O(i,j)=white;
		else
			fprintf(fid,'%s',black);
            O(i,j)=black;
		end
	end
	fprintf(fid,'\n');
end

fclose(fid);
