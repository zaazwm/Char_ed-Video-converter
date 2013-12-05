function imtochar2(I,hsize);


I_2=rgb2gray(I);

[h,w]=size(I_2);

w2=floor(hsize*(w/h));

I2=imresize(I,[hsize,w2]);

level = graythresh(I2);

I3=im2bw(I2,level);

%imshow(I3);

[hh,ww]=size(I3);

fid=fopen('imdata.txt','at');

for i = 1:2:hh-1
	for j = 1:ww
		if I3(i,j)==1 && I3(i+1,j)==1
			fprintf(fid,'%s',' ');
        else
            if I3(i,j)==0 && I3(i+1,j)==0
                fprintf(fid,'%s','B');
            else
                if I3(i,j)==1 && I3(i+1,j)==0
                    fprintf(fid,'%s','o');
                else
                    fprintf(fid,'%s','P');
                end
            end
		end
	end
	fprintf(fid,'\n');
end

fclose(fid);
 